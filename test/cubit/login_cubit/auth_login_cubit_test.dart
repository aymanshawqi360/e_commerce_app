import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_login_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_login_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthLoginUseCases>()])
void main() {
  late LoginCubit loginCubit;
  late String email;
  late String password;
  late MockAuthLoginUseCases mockAuthLoginUseCases;

  setUp(() {
    mockAuthLoginUseCases = MockAuthLoginUseCases();
    loginCubit = LoginCubit(authLoginUseCases: mockAuthLoginUseCases);
    email = 'test505@gmail.com';
    password = 'test123456789';
  });

  blocTest<LoginCubit, LoginState>(
    'emits [AuthLoginLoading, AuthLoginSuccess] when login succeeds',
    build: () {
      when(
        mockAuthLoginUseCases.login(
          body: argThat(
            isA<LoginRequestBody>()
                .having((e) => e.email, 'email', email)
                .having((p) => p.password, 'password', password),
            named: "body",
          ),
        ),
      ).thenAnswer(
        (_) async => Success<LoginResponseModel>(
          data: LoginResponseModel(
            access: 'dummy_access_token_0987654321',
            refresh: 'dummy_refresh_token_1234567890',
          ),
        ),
      );

      return loginCubit;
    },
    act: (bloc) => [
      bloc.emailController.text = email,
      bloc.passwordController.text = password,
      bloc.loginState(),
    ],

    expect: () => [AuthLoginLoading(), AuthLoginSuccess()],
  );
}
