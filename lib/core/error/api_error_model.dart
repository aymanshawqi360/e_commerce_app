import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String errorMessage;
  ApiErrorModel({required this.errorMessage});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson(ApiErrorModel errorResult) =>
      _$ApiErrorModelToJson(this);
}
