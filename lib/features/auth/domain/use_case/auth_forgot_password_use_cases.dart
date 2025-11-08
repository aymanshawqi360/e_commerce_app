import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class AuthResetOtpUseCases {
  final AuthRepo authRepo;

  AuthResetOtpUseCases({required this.authRepo});

  Future<ApiResult<ForgotPasswordResponseModel>> resetOtp({
    required ForgotPasswordRequestBody body,
  }) {
    return authRepo.resetOtp(body: body);
  }
}
