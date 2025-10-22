import 'package:e_commerce_app/core/error/api_error_model.dart';
import 'package:equatable/equatable.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class AuthSignupLoading extends SignupState {}

class AuthSignupSuccess extends SignupState {}

class AuthSignupFailure extends SignupState {
  final ApiErrorModel errorMessage;

  const AuthSignupFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
