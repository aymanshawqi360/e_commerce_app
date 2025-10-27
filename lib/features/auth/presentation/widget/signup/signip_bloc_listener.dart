import 'package:e_commerce_app/config/error/show_error_message.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignipBlocListener extends StatelessWidget {
  const SignipBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is AuthSignupLoading ||
          current is AuthSignupSuccess ||
          current is AuthSignupFailure,
      listener: (context, state) {
        switch (state) {
          case AuthSignupSuccess():
            buildSuccessState();
          case AuthSignupFailure():
            buildFailureState(context: context, state: state);

          default:
            Text("default error");
        }
      },
      child: SizedBox.shrink(),
    );
  }

  buildSuccessState() {
    return Text("data");
  }

  buildFailureState({
    required BuildContext context,
    required AuthSignupFailure state,
  }) {
    return ShowErrorMessage.showErrorMessage(
      context: context,
      message: state.errorMessage.allError(),
    );
  }
}
