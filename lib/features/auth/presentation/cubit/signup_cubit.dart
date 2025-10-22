import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/api_error_model.dart';
import 'package:e_commerce_app/core/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_signup_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup_state.dart';
import 'package:flutter/widgets.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authSignupUseCases}) : super(SignupInitial());
  final AuthSignupUseCases authSignupUseCases;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final rolesemailController = TextEditingController();
  void signUpState() async {
    emit(AuthSignupLoading());
    final response = await authSignupUseCases.signUp(
      body: SignupRequestBody(
        confirmPassword: confirmPasswordController.text,
        email: emailController.text,
        password: passwordController.text,
        roles: rolesemailController.text,
      ),
    );
    if (response is Success<SignupResponseModel>) {
      emit(AuthSignupSuccess());
    } else if (response is Failure<SignupResponseModel>) {
      emit(
        AuthSignupFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage.errorMessage,
          ),
        ),
      );
    }
  }
}
