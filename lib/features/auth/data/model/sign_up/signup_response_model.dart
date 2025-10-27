import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  int? id;
  String? email;
  String? roles;
  @JsonKey(name: 'terms_accepted')
  bool? termsAccepted;
  SignupResponseModel({this.id, this.email, this.roles, this.termsAccepted});
  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
