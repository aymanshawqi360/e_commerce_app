// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      roles: json['roles'] as String?,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
  SignupResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'roles': instance.roles,
};
