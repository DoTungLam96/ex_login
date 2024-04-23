import 'package:ex_module_core/ex_module_core.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  AuthModel(
      {required this.username,
      required this.accessToken,
      required this.refreshToken});

  String username;
  String accessToken;
  String refreshToken;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
