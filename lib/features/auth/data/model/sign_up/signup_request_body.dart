import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String? email;
  String? password;
  String? confirmPassword;
  String? roles;
  SignupRequestBody({
    this.email,
    this.password,
    this.confirmPassword,
    this.roles,
  });

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
