import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce_app/config/error/api_error_model.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
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

  setUp(() {
    mockAuthSignupUseCases = MockAuthSignupUseCases();
    signupCubit = SignupCubit(authSignupUseCases: mockAuthSignupUseCases);
  });
  blocTest<SignupCubit, SignupState>(
    'emits [AuthSignupLoading, AuthSignupSuccess] when signup succeeds',
    build: () {
      when(mockAuthSignupUseCases.signUp(body: anyNamed('body'))).thenAnswer(
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
    act: (bloc) => bloc.signUpState(),
    expect: () => [AuthSignupLoading(), AuthSignupSuccess()],
  );

  blocTest<SignupCubit, SignupState>(
    "emits [AuthSignupLoading , AuthSignupFailure]",
    build: () {
      when(mockAuthSignupUseCases.signUp(body: anyNamed("body"))).thenAnswer(
        (_) async => Failure<SignupResponseModel>(
          errorMessage: ApiErrorModel(errorMessage: "Network error"),
        ),
      );

      return signupCubit;
    },
    act: (bloc) => signupCubit.signUpState(),
    expect: () => [isA<AuthSignupLoading>(), isA<AuthSignupFailure>()],
  );
}
