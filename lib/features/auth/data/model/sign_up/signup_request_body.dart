import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String? email;
  @JsonKey(name: 'password1')
  String? password;
  @JsonKey(name: 'password2')
  String? confirmPassword;
  String? roles;
  @JsonKey(name: 'terms_accepted')
  bool? termsAccepted;
  SignupRequestBody({
    this.email,
    this.password,
    this.confirmPassword,
    this.roles,
    this.termsAccepted,
  });

  factory SignupRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
