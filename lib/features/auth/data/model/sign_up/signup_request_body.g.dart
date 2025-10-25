// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      email: json['email'] as String?,
      password: json['password1'] as String?,
      confirmPassword: json['password2'] as String?,
      roles: json['roles'] as String?,
      termsAccepted: json['terms_accepted'] as bool?,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password1': instance.password,
      'password2': instance.confirmPassword,
      'roles': instance.roles,
      'terms_accepted': instance.termsAccepted,
    };
