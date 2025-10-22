import 'package:e_commerce_app/core/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class AuthSignupUseCases {
  final AuthRepo authRepo;

  AuthSignupUseCases({required this.authRepo});

  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestBody body,
  }) {
    return authRepo.signUp(body: body);
  }
}
