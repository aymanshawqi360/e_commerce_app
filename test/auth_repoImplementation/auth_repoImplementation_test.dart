import 'package:dio/dio.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';
import 'package:e_commerce_app/features/auth/data/repo_implementation/auth_repo_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repoImplementation_test.mocks.dart';

@GenerateMocks([AuthApiService])
void main() {
  late AuthRepoImplementation authRepoImplementation;
  late MockAuthApiService mockAuthApiService;
  late SignupRequestBody signupRequestBody;
  late LoginRequestBody loginRequestBody;
  late SignupResponseModel signupResponseModel;
  late ForgotPasswordRequestBody forgotPasswordRequestBody;

  setUp(() {
    mockAuthApiService = MockAuthApiService();
    authRepoImplementation = AuthRepoImplementation(
      authApiService: mockAuthApiService,
    );
    loginRequestBody = LoginRequestBody(
      email: "test123@gmail.com",
      password: "test123456789",
    );
    signupRequestBody = SignupRequestBody(
      confirmPassword: "1236",
      email: "sasasasasas183@gmail.com",
      password: "1236",
      roles: "customer",
      termsAccepted: true,
    );
    signupResponseModel = SignupResponseModel(
      email: "sasasasasas183@gmail.com",
      id: 5,
      roles: "customer",
      termsAccepted: true,
    );

    forgotPasswordRequestBody = ForgotPasswordRequestBody(
      email: 'sz6fy@2200freefonts.com',
    );
  });

  test("signUp returns success when API returns 200", () async {
    when(mockAuthApiService.signUp(body: signupRequestBody)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: 'account/sign-up/'),
        statusCode: 200,
        data: signupResponseModel.toJson(),
      ),
    );
    final result = await authRepoImplementation.signUp(body: signupRequestBody);

    expect(result, isA<ApiResult<SignupResponseModel>>());
    expect((result is Success<SignupResponseModel>), true);
    expect((result is Success<String>), false);
    expect((result is Failure), false);
  });

  test(
    "signup authRepoImplementation returns failure when API returns 400",
    () async {
      when(
        mockAuthApiService.signUp(
          body: SignupRequestBody(
            confirmPassword: "",
            email: "",
            password: "",
            roles: "",
            termsAccepted: true,
          ),
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 400,
          data: {
            "message": "Invalid Request",
            "errors": {
              "email": ["This field may not be blank."],
              "password1": ["This field may not be blank."],
              "password2": ["This field may not be blank."],
              "roles": ["This field may not be blank."],
            },
          },
          requestOptions: RequestOptions(path: 'account/sign-up/'),
        ),
      );
      final result = await authRepoImplementation.signUp(
        body: SignupRequestBody(
          confirmPassword: "",
          email: "",
          password: "",
          roles: "",
          termsAccepted: true,
        ),
      );
      expect((result is Failure), true);
    },
  );

  test(
    "login authRepoImplementation returns success when API returns 200",
    () async {
      when(mockAuthApiService.login(body: loginRequestBody)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'account/login/token/'),
          statusCode: 200,
          data: signupResponseModel.toJson(),
        ),
      );
      final result = await authRepoImplementation.login(body: loginRequestBody);

      expect(result, isA<ApiResult<LoginResponseModel>>());
      expect((result is Success<LoginResponseModel>), true);
    },
  );

  group("AuthRepoImplementation - Forgot Password", () {
    test(
      "forgot password authRepoImplementation returns success when API returns 200",
      () async {
        when(
          mockAuthApiService.resetOtp(body: forgotPasswordRequestBody),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: '/account/resend-otp/'),
            statusCode: 200,
            data: forgotPasswordRequestBody.toJson(),
          ),
        );
        final result = await authRepoImplementation.resetOtp(
          body: forgotPasswordRequestBody,
        );
        expect(result, isA<ApiResult<ForgotPasswordResponseModel>>());

        expect((result is Success<ForgotPasswordResponseModel>), true);
      },
    );
    test(
      'forgot password authRepoImplementation returns success when API returns 404',
      () async {
        when(
          mockAuthApiService.resetOtp(
            body: ForgotPasswordRequestBody(email: 'sz6fy@2200freefonts.'),
          ),
        ).thenAnswer(
          (_) async => Response(
            statusCode: 404,
            data: {"error": "Account does not exist."},
            requestOptions: RequestOptions(path: '/account/resend-otp/'),
          ),
        );
        final result = await authRepoImplementation.resetOtp(
          body: forgotPasswordRequestBody,
        );
        expect((result is Failure<ForgotPasswordResponseModel>), true);
      },
    );
  });
}
