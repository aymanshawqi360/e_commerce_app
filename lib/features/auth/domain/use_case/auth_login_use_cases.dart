import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class AuthLoginUseCases {
  final AuthRepo authRepo;

  AuthLoginUseCases({required this.authRepo});
  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestBody body,
  }) {
    return authRepo.login(body: body);
  }
}
