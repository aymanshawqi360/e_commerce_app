import 'package:e_commerce_app/config/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class AuthForgotPasswordState extends Equatable {
  const AuthForgotPasswordState();

  @override
  List<Object> get props => [];
}

class AuthForgotPasswordInitial extends AuthForgotPasswordState {}

class AuthForgotPasswordLoading extends AuthForgotPasswordState {}

class AuthForgotPasswordSuccess extends AuthForgotPasswordState {}

class AuthForgotPasswordFailure extends AuthForgotPasswordState {
  final ApiErrorModel errorMessage;

  const AuthForgotPasswordFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
