import 'package:json_annotation/json_annotation.dart';

import 'user_auth_info.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  UserModel(
      {this.userName,
      required this.fullName,
      this.email,
      this.mobile,
      this.address,
      required this.isActive,
      this.dateOfBirth,
      this.clientIDForPartner,
      this.gender,
      this.authInfo,
      this.hasPin,
      this.minimumPasswordAge,
      this.custodianFlag,
      this.registrationType,
      this.forcePasswordChangeStatus});

  bool get isCustodian => custodianFlag == 'Y';

  @override
  UserModel copyWith({AuthInfo? authInfo, String? forcePasswordChangeStatus}) {
    return UserModel(
        fullName: fullName,
        isActive: isActive,
        userName: userName,
        address: address,
        authInfo: authInfo ?? this.authInfo,
        clientIDForPartner: clientIDForPartner,
        dateOfBirth: dateOfBirth,
        email: email,
        gender: gender,
        hasPin: hasPin,
        mobile: mobile,
        custodianFlag: custodianFlag,
        registrationType: registrationType,
        forcePasswordChangeStatus:
            forcePasswordChangeStatus ?? this.forcePasswordChangeStatus);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @JsonKey(name: "username")
  String? userName;
  String fullName;
  String? email;
  String? mobile;
  String? address;
  bool isActive;
  String? gender;
  String? dateOfBirth;
  String? clientIDForPartner;

  AuthInfo? authInfo;
  bool? hasPin;
  String? forcePasswordChangeStatus;
  int? minimumPasswordAge;
  String? custodianFlag;
  int? registrationType;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
