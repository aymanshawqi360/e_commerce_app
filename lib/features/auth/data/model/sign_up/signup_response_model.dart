import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  int? id;
  String? email;
  String? roles;
  SignupResponseModel({this.id, this.email, this.roles});
  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignipResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignipResponseModelToJson(this);
}
