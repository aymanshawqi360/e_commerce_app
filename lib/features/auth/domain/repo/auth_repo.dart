import 'package:e_commerce_app/core/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';

abstract class AuthRepo {
  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestBody body,
  });
}
