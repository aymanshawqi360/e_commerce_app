import 'package:e_commerce_app/config/error/show_error_message.dart';
import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthForgotPasswordCubit, AuthForgotPasswordState>(
      listenWhen: (previous, current) =>
          current is AuthForgotPasswordLoading ||
          current is AuthForgotPasswordSuccess ||
          current is AuthForgotPasswordFailure,
      listener: (context, state) {
        switch (state) {
          case AuthForgotPasswordSuccess():
            return _buildSuccessState(context: context);
          case AuthForgotPasswordFailure():
            return _buildFailureState(context: context, state: state);

          default:
            Text("Error");
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _buildSuccessState({required BuildContext context}) {
    context.pushNamed(Routes.otpScreen);
  }

  void _buildFailureState({
    required BuildContext context,
    required AuthForgotPasswordFailure state,
  }) {
    ShowErrorMessage.showErrorMessage(
      context: context,
      message: state.errorMessage.allError(),
    );
  }
}
