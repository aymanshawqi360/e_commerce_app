import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_response_model.g.dart';

@JsonSerializable()
class ForgotPasswordResponseModel {
  String? message;
  ForgotPasswordResponseModel({required this.message});

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseModelToJson(this);
}
