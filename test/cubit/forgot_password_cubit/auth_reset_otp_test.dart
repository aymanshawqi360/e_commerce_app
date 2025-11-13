import 'package:bloc_test/bloc_test.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_forgot_password_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_reset_otp_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthResetOtpUseCases>()])
void main() {
  late MockAuthResetOtpUseCases mockAuthResetOtpUseCases;
  late AuthForgotPasswordCubit authForgotPasswordCubit;
  late ForgotPasswordRequestBody forgotPasswordRequestBody;

  setUp(() {
    mockAuthResetOtpUseCases = MockAuthResetOtpUseCases();
    authForgotPasswordCubit = AuthForgotPasswordCubit(
      authResetOtpUseCases: mockAuthResetOtpUseCases,
    );
    forgotPasswordRequestBody = ForgotPasswordRequestBody(
      email: "test123@gmail.com",
    );
  });

  blocTest<AuthForgotPasswordCubit, AuthForgotPasswordState>(
    "emits [AuthForgotPassswordLoading, AuthForgotPassswordSuccess] when login succeeds",
    build: () {
      when(
        mockAuthResetOtpUseCases.resetOtp(
          body: argThat(
            isA<ForgotPasswordRequestBody>().having(
              (e) => e.email,
              'Email',
              forgotPasswordRequestBody.email,
            ),
            named: "body",
          ),
        ),
      ).thenAnswer(
        (_) async => Success<ForgotPasswordResponseModel>(
          data: ForgotPasswordResponseModel(message: "OTP sent successfully"),
        ),
      );

      return authForgotPasswordCubit;
    },
    act: (bloc) async => [
      bloc.emailController.text = forgotPasswordRequestBody.email.toString(),
      await bloc.resetOtpState(),
    ],
    expect: () => [AuthForgotPasswordLoading(), AuthForgotPasswordSuccess()],
  );
}
