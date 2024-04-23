// ignore_for_file: must_be_immutable

import 'package:ex_module_core/ex_module_core.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_auth_info.dart';

part 'user_model.g.dart';

@Entity(tableName: Constants.userTableName)
@JsonSerializable()
class UserModel extends Equatable {
  UserModel(
      {this.userName,
      this.id,
      this.fullName,
      this.email,
      this.mobile,
      this.address,
      this.isActive,
      this.dateOfBirth,
      this.clientIDForPartner,
      this.gender,
      this.hasPin,
      this.minimumPasswordAge,
      this.custodianFlag,
      this.registrationType,
      this.forcePasswordChangeStatus});

  bool get isCustodian => custodianFlag == 'Y';

  @PrimaryKey(autoGenerate: true)
  final int? id;
  @JsonKey(name: "username")
  String? userName;
  String? fullName;
  String? email;
  String? mobile;
  String? address;
  bool? isActive;
  String? gender;
  String? dateOfBirth;
  String? clientIDForPartner;

  bool? hasPin;
  String? forcePasswordChangeStatus;
  int? minimumPasswordAge;
  String? custodianFlag;
  int? registrationType;

  @override
  UserModel copyWith({AuthInfo? authInfo, String? forcePasswordChangeStatus}) {
    return UserModel(
        fullName: fullName,
        isActive: isActive,
        userName: userName,
        address: address,
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

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        userName,
        fullName,
        email,
        mobile,
        address,
        isActive,
        gender,
        dateOfBirth,
        clientIDForPartner,
        hasPin,
        forcePasswordChangeStatus,
        minimumPasswordAge,
        custodianFlag,
        registrationType,
      ];
}
