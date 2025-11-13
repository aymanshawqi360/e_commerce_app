import 'package:e_commerce_app/config/error/show_error_message.dart';
import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is AuthLoginLoading ||
          current is AuthLoginSuccess ||
          current is AuthLoginFailure,
      listener: (context, state) {
        switch (state) {
          case AuthLoginSuccess():
            return _buildSuccessState(context: context);
          case AuthLoginFailure():
            return _buildFailureState(context: context, state: state);

          default:
        }
      },
      child: SizedBox.shrink(),
    );
  }

  void _buildSuccessState({required BuildContext context}) {
    context.pushNamed(Routes.home);
  }

  void _buildFailureState({
    required BuildContext context,
    required AuthLoginFailure state,
  }) {
    ShowErrorMessage.showErrorMessage(
      context: context,
      message: state.errorMessage.allError(),
    );
  }
}
