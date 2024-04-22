import 'dart:async';

import 'package:ex_login/cubit/login_state.dart';
import 'package:ex_module_core/ex_module_core.dart';

import '../repositories/login_repositories.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  LoginRepositories loginRepositories = GetIt.instance.get();

  void login({required String username, required String password}) async {
    try {
      if (username.isEmpty) {
        emit(LoginState.error("Username is not empty"));
        return;
      }
      if (password.isEmpty) {
        emit(LoginState.error("Password is not empty"));
        return;
      }
      emit(LoginState.loading());

      final response = await loginRepositories.login(
        username,
        password,
      );
      final userResponse = await loginRepositories.getMe();

      if (response != null && userResponse != null) {
        emit(LoginState.loginSuccess(response, userResponse));
      }
    } on DioError catch (dioError) {
      emit(LoginState.error(dioError.errorMessage));
    }
  }
}
