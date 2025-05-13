// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginTokenModel _$LoginTokenModelFromJson(Map<String, dynamic> json) =>
    LoginTokenModel(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$LoginTokenModelToJson(LoginTokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };
