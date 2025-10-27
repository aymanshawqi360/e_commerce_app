import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
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
  setUp(() {
    mockDio = MockDio();
    mockInterceptors = MockInterceptors();
    when(mockDio.interceptors).thenReturn(mockInterceptors);
    dioFactory = DioFactory(dio: mockDio);
    authApiService = AuthApiService(dioFactory: dioFactory);
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
}
