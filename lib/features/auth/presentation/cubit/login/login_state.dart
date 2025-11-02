part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class AuthLoginLoading extends LoginState {}

class AuthLoginSuccess extends LoginState {}

class AuthLoginFailure extends LoginState {
  final ApiErrorModel errorMessage;

  const AuthLoginFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
