import 'package:json_annotation/json_annotation.dart';

part 'login_token_model.g.dart';

@JsonSerializable()
class LoginTokenModel {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "expires_in")
  final int expiresIn;

  LoginTokenModel(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  factory LoginTokenModel.fromJson(json) => _$LoginTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokenModelToJson(this);
}
