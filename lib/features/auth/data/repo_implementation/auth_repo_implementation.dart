import 'package:e_commerce_app/config/error/api_error_hundler.dart';
import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_service.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final AuthApiService authApiService;

  AuthRepoImplementation({required this.authApiService});
  @override
  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestBody body,
  }) async {
    try {
      final result = await authApiService.signUp(body: body);

      return ApiResult.success(SignupResponseModel.fromJson(result.data));
    } catch (error) {
      return ApiResult.failure(ApiErrorHundler.apiHandler(error));
    }
  }

  @override
  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestBody body,
  }) async {
    try {
      final result = await authApiService.login(body: body);
      return ApiResult.success(LoginResponseModel.fromJson(result.data));
    } catch (error) {
      return ApiResult.failure(ApiErrorHundler.apiHandler(error));
    }
  }
}
