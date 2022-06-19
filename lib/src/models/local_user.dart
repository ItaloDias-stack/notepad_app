import 'package:json_annotation/json_annotation.dart';

part "local_user.g.dart";

@JsonSerializable()
class LocalUser {
  String? email;
  String? password;

  LocalUser({this.email = " ", this.password = " "});

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);
}
