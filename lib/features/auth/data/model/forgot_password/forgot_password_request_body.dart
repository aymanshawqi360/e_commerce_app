import 'package:json_annotation/json_annotation.dart';
part 'forgot_password_request_body.g.dart';

@JsonSerializable()
class ForgotPasswordRequestBody {
  String? email;
  ForgotPasswordRequestBody({required this.email});

  factory ForgotPasswordRequestBody.fromJso(Map<String, dynamic> json) =>
      _$ForgotPasswordRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordRequestBodyToJson(this);
}
