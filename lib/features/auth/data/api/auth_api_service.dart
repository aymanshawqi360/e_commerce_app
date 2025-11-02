import 'package:dio/dio.dart';

import 'package:e_commerce_app/core/networking/dio_factory.dart';
import 'package:e_commerce_app/features/auth/data/api/auth_api_constants.dart';
import 'package:e_commerce_app/features/auth/data/model/login/login_request_body.dart';
import 'package:e_commerce_app/features/auth/data/model/sign_up/signup_request_body.dart';

class AuthApiService {
  final DioFactory dioFactory;
  const AuthApiService({required this.dioFactory});

  Future<Response> signUp({required SignupRequestBody body}) async {
    try {
      final result = await dioFactory.post(
        AuthApiConstants.signUp,
        body: body.toJson(),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login({required LoginRequestBody body}) async {
    try {
      final result = await dioFactory.post(
        AuthApiConstants.login,
        body: body.toJson(),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
