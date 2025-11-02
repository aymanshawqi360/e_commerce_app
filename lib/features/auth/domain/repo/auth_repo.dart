import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';

abstract class AuthRepo {
  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestBody body,
  });

  Future<ApiResult<LoginResponseModel>> login({required LoginRequestBody body});
}
