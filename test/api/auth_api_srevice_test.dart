import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_api_srevice_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>(), MockSpec<Interceptors>()])
void main() {
  late AuthApiService authApiService;
  late DioFactory dioFactory;
  late MockDio mockDio;
  late MockInterceptors mockInterceptors;
  late LoginRequestBody loginRequestBody;
  late ForgotPasswordRequestBody forgotPasswordRequestBody;
  setUp(() {
    mockDio = MockDio();
    mockInterceptors = MockInterceptors();
    when(mockDio.interceptors).thenReturn(mockInterceptors);
    dioFactory = DioFactory(dio: mockDio);
    authApiService = AuthApiService(dioFactory: dioFactory);
    loginRequestBody = LoginRequestBody(
      email: "testLogin@gmail.com",
      password: "test123456789",
    );
    forgotPasswordRequestBody = ForgotPasswordRequestBody(
      email: 'sz6fy@2200freefonts.com',
    );
  });
  test("signUp returns user data when API responds with 200", () async {
    when(
      mockDio.post(
        'account/sign-up/',
        data: {
          "email": "sasasasasas123@gmail.com",
          "password1": "1236",
          "password2": "1236",
          "roles": "customer",
          "terms_accepted": true,
        },
        options: anyNamed('options'),
        cancelToken: anyNamed('cancelToken'),
        onSendProgress: anyNamed('onSendProgress'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: [
          {
            "id": 2,
            "email": "sasasasasas123@gmail.com",
            "roles": "customer",
            "terms_accepted": true,
          },
        ],
        requestOptions: RequestOptions(
          baseUrl:
              'https://e-commerce-api-production-8abf.up.railway.app/account/sign-up/',
        ),
      ),
    );
    Response<dynamic> response = await authApiService.signUp(
      body: SignupRequestBody(
        confirmPassword: "1236",
        email: "sasasasasas123@gmail.com",
        password: "1236",
        roles: "customer",
        termsAccepted: true,
      ),
    );
    expect(response.data, [
      {
        "id": 2,
        "email": "sasasasasas123@gmail.com",
        "roles": "customer",
        "terms_accepted": true,
      },
    ]);
    expect(response.data[0]["id"], 2);
    expect(response.data[0]["email"], "sasasasasas123@gmail.com");
  });

  test("login returns user data when API responds with 200", () async {
    when(
      mockDio.post(
        'account/login/token/',
        cancelToken: anyNamed('cancelToken'),
        queryParameters: anyNamed('queryParameters'),
        onSendProgress: anyNamed('onSendProgress'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        options: anyNamed('options'),
        data: {'email': "testLogin@gmail.com", 'password': "test123456789"},
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          "refresh": "dummy_refresh_token_1234567890",
          "access": "dummy_access_token_0987654321",
        },

        requestOptions: RequestOptions(
          path: 'account/login/token/',

          baseUrl: 'https://e-commerce-api-production-8abf.up.railway.app/',
        ),
      ),
    );

    final result = await authApiService.login(
      body: LoginRequestBody(
        email: "testLogin@gmail.com",
        password: "test123456789",
      ),
    );

    expect(result.data, {
      "refresh": "dummy_refresh_token_1234567890",
      "access": "dummy_access_token_0987654321",
    });
  });

  test("should return 401 when credentials are invalid", () async {
    when(
      mockDio.post(
        'account/login/token/',
        data: {'email': 'testLogin@gmail.com', 'password': 'test123456789'},
        cancelToken: anyNamed('cancelToken'),
        queryParameters: anyNamed('queryParameters'),
        onSendProgress: anyNamed('onSendProgress'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        options: anyNamed('options'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 401,
        data: {
          "message": "Invalid Request",
          "errors": {
            "detail": "No active account found with the given credentials",
          },
        },

        requestOptions: RequestOptions(
          path: 'account/login/token/',

          baseUrl: 'https://e-commerce-api-production-8abf.up.railway.app/',
        ),
      ),
    );

    final result = await authApiService.login(body: loginRequestBody);
    expect(result.statusCode, 401);
    expect(result.data['message'], "Invalid Request");
    expect(result.data['errors'], {
      "detail": "No active account found with the given credentials",
    });
  });

  test(
    "forgot password returns user data when API responds with 200",
    () async {
      when(
        mockDio.post(
          '/account/resend-otp/',
          data: {'email': 'sz6fy@2200freefonts.com'},
        ),
      ).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          data: {"message": "OTP resent successfully."},
          requestOptions: RequestOptions(
            path: '/account/resend-otp/',
            baseUrl: 'https://e-commerce-api-production-8abf.up.railway.app/',
          ),
        ),
      );

      final result = await authApiService.resetOtp(
        body: forgotPasswordRequestBody,
      );

      expect(result.data['message'], 'OTP resent successfully.');
    },
  );
}
