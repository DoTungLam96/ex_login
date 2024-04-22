// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['username'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      isActive: json['isActive'] as bool,
      dateOfBirth: json['dateOfBirth'] as String?,
      clientIDForPartner: json['clientIDForPartner'] as String?,
      gender: json['gender'] as String?,
      authInfo: json['authInfo'] == null
          ? null
          : AuthInfo.fromJson(json['authInfo'] as Map<String, dynamic>),
      hasPin: json['hasPin'] as bool?,
      minimumPasswordAge: json['minimumPasswordAge'] as int?,
      custodianFlag: json['custodianFlag'] as String?,
      registrationType: json['registrationType'] as int?,
      forcePasswordChangeStatus: json['forcePasswordChangeStatus'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
      'address': instance.address,
      'isActive': instance.isActive,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'clientIDForPartner': instance.clientIDForPartner,
      'authInfo': instance.authInfo,
      'hasPin': instance.hasPin,
      'forcePasswordChangeStatus': instance.forcePasswordChangeStatus,
      'minimumPasswordAge': instance.minimumPasswordAge,
      'custodianFlag': instance.custodianFlag,
      'registrationType': instance.registrationType,
    };
