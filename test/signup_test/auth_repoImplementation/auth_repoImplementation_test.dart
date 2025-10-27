import 'package:dio/dio.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
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
  late SignupResponseModel signupResponseModel;
  setUp(() {
    mockAuthApiService = MockAuthApiService();
    authRepoImplementation = AuthRepoImplementation(
      authApiService: mockAuthApiService,
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

  test("description", () async {
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
  });
}
