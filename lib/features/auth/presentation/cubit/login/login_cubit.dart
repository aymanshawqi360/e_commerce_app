import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/config/error/api_error_model.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_login_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthLoginUseCases authLoginUseCases;
  LoginCubit({required this.authLoginUseCases}) : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> loginState() async {
    emit(AuthLoginLoading());

    ApiResult<LoginResponseModel> response = await authLoginUseCases.login(
      body: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response is Success<LoginResponseModel>) {
      emit(AuthLoginSuccess());
    } else if (response is Failure<LoginResponseModel>) {
      emit(
        AuthLoginFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage.errorMessage,
            errors: response.errorMessage.errors,
          ),
        ),
      );
    }
  }
}
