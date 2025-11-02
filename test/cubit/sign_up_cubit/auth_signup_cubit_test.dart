import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce_app/config/error/api_error_model.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_signup_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_signup_cubit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthSignupUseCases>()])
void main() {
  late MockAuthSignupUseCases mockAuthSignupUseCases;
  late SignupCubit signupCubit;
  late String confirmPassword;
  late String email;
  late String password;
  late bool termsAccepted;
  late String roles;

  setUp(() {
    confirmPassword = 'test1236';
    email = 'test183.com';
    password = "test";
    roles = 'customer';
    termsAccepted = true;
    mockAuthSignupUseCases = MockAuthSignupUseCases();
    signupCubit = SignupCubit(authSignupUseCases: mockAuthSignupUseCases);
  });
  blocTest<SignupCubit, SignupState>(
    'emits [AuthSignupLoading, AuthSignupSuccess] when signup succeeds',
    build: () {
      when(
        mockAuthSignupUseCases.signUp(
          body: argThat(
            isA<SignupRequestBody>()
                .having(
                  (cd) => cd.confirmPassword,
                  'confirmPassword',
                  'test123456789',
                )
                .having((el) => el.email, 'email', 'test123@gmail.com')
                .having((pd) => pd.password, 'password', 'test123456789')
                .having((rs) => rs.roles, 'roles', 'customer')
                .having((td) => td.termsAccepted, 'termsAccepted', true),
            named: 'body',
          ),
        ),
      ).thenAnswer(
        (_) async => Success<SignupResponseModel>(
          data: SignupResponseModel(
            id: 1,
            email: 'asasasa@gmail.com',
            roles: 'customer',
            termsAccepted: true,
          ),
        ),
      );

      return signupCubit;
    },
    act: (bloc) async => [
      bloc.emailController.text = 'test123@gmail.com',
      bloc.confirmPasswordController.text = 'test123456789',
      bloc.passwordController.text = 'test123456789',
      bloc.isAccepted = true,
      bloc.selectedValue = 'customer',
      await bloc.signUpState(),
    ],
    expect: () => [AuthSignupLoading(), AuthSignupSuccess()],
  );

  blocTest<SignupCubit, SignupState>(
    "emits [AuthSignupLoading , AuthSignupFailure]",
    build: () {
      when(
        mockAuthSignupUseCases.signUp(
          body: argThat(
            isA<SignupRequestBody>()
                .having(
                  (cp) => cp.confirmPassword,
                  'confirmPassword',
                  confirmPassword,
                )
                .having((el) => el.email, 'email', email)
                .having((pd) => pd.password, 'password', password)
                .having((rs) => rs.roles, 'roles', roles)
                .having(
                  (td) => td.termsAccepted,
                  'termsAccepted',
                  termsAccepted,
                ),
            named: 'body',
          ),
        ),
      ).thenAnswer(
        (_) async => Failure<SignupResponseModel>(
          errorMessage: ApiErrorModel(errorMessage: "Network error"),
        ),
      );

      return signupCubit;
    },
    act: (bloc) async => [
      bloc.passwordController.text = password,
      bloc.confirmPasswordController.text = confirmPassword,
      bloc.emailController.text = email,
      bloc.isAccepted = termsAccepted,
      bloc.selectedValue = roles,
      await bloc.signUpState(),
    ],

    expect: () => [
      AuthSignupLoading(),
      isA<AuthSignupFailure>().having(
        (error) => error.errorMessage,
        'errorMessage',
        isA<ApiErrorModel>(),
      ),
    ],
  );
}
