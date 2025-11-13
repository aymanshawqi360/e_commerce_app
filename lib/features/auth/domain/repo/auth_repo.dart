import 'package:e_commerce_app/config/error/api_result.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/forgot_password/forgot_password_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_response_model.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_response_model.dart';

abstract class AuthRepo {
  //!SignUp
  Future<ApiResult<SignupResponseModel>> signUp({
    required SignupRequestBody body,
  });
  //!Login
  Future<ApiResult<LoginResponseModel>> login({required LoginRequestBody body});
  //!ForgotPassword
  Future<ApiResult<ForgotPasswordResponseModel>> resetOtp({
    required ForgotPasswordRequestBody body,
  });
}
