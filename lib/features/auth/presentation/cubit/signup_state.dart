import 'package:e_commerce_app/config/error/api_error_model.dart';
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

class AuthSignupDropdown extends SignupState {
  final String selectedValue;

  const AuthSignupDropdown({required this.selectedValue});
  @override
  List<Object> get props => [selectedValue];
}

class TermsAcceptedState extends SignupState {
  final bool isAccepted;

  const TermsAcceptedState({required this.isAccepted});
  @override
  List<Object> get props => [isAccepted];
}
