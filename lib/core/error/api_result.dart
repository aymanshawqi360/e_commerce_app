import 'package:e_commerce_app/core/error/api_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) => Success(data: data);
  factory ApiResult.failure(ApiErrorModel errorResulr) =>
      Failure(errorMessage: errorResulr);
}

class Success<T> extends ApiResult<T> {
  T? data;
  Success({required this.data});
}

class Failure<T> extends ApiResult<T> {
  ApiErrorModel errorMessage;
  Failure({required this.errorMessage});
}
