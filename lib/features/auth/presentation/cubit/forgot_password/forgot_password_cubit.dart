import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/config/error/api_error_model.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/use_case/auth_forgot_password_use_cases.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_state.dart';
import 'package:flutter/widgets.dart';

class AuthForgotPasswordCubit extends Cubit<AuthForgotPasswordState> {
  final AuthResetOtpUseCases authResetOtpUseCases;
  AuthForgotPasswordCubit({required this.authResetOtpUseCases})
    : super(AuthForgotPasswordInitial());
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> resetOtpState() async {
    emit(AuthForgotPasswordLoading());
    ApiResult<ForgotPasswordResponseModel> response = await authResetOtpUseCases
        .resetOtp(body: ForgotPasswordRequestBody(email: emailController.text));
    if (response is Success<ForgotPasswordResponseModel>) {
      emit(AuthForgotPasswordSuccess());
    } else if (response is Failure<ForgotPasswordResponseModel>) {
      emit(
        AuthForgotPasswordFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage.errorMessage,
            errors: response.errorMessage.errors,
          ),
        ),
      );
    }
  }
}
