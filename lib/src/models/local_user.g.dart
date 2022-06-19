// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) => LocalUser(
      email: json['email'] as String? ?? " ",
      password: json['password'] as String? ?? " ",
    );

Map<String, dynamic> _$LocalUserToJson(LocalUser instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
