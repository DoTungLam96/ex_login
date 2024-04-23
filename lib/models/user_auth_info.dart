import 'package:ex_module_core/ex_module_core.dart';

part 'user_auth_info.g.dart';

@JsonSerializable()
class AuthInfo extends Equatable {
  const AuthInfo({this.registrationType, this.twoFAType});

  factory AuthInfo.fromJson(Map<String, dynamic> json) {
    return _$AuthInfoFromJson(json);
  }
  final int? registrationType;
  final int? twoFAType;

  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);

  @override
  List<Object?> get props => [registrationType, twoFAType];
}
