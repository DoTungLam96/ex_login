import 'package:ex_module_core/ex_module_core.dart';

import '../models/auth_model.dart';
import '../models/user_model.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState.init() = Init;

  factory LoginState.loading() = Loading;

  factory LoginState.error(String? message) = Error;

  factory LoginState.loginSuccess(AuthModel? authModel, UserModel? user) =
      LoginSuccess;
}
