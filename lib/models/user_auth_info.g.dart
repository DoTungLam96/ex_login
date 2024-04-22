// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) => AuthInfo(
      registrationType: json['registrationType'] as int?,
      twoFAType: json['twoFAType'] as int?,
    );

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) => <String, dynamic>{
      'registrationType': instance.registrationType,
      'twoFAType': instance.twoFAType,
    };
