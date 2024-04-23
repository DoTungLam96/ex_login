import 'dart:async';
import 'dart:convert';

import 'package:ex_login/cubit/login_state.dart';
import 'package:ex_login/models/user_model.dart';
import 'package:ex_module_core/ex_module_core.dart';

import '../repositories/login_repositories.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.init());

  LoginRepositories loginRepositories = GetIt.instance.get();

  void login({required String username, required String password}) async {
    try {
      if (username.isEmpty) {
        emit(
          LoginState.error(ILocale.current.username_not_empty),
        );
        return;
      }
      if (password.isEmpty) {
        emit(
          LoginState.error(ILocale.current.password_not_empty),
        );
        return;
      }
      emit(LoginState.loading());

      final response = await loginRepositories.login(
        username,
        password,
      );

      final String? jsonData = await GetIt.instance
          .get<SharedPreferencesManager>()
          .getDataIfNotExpired();
      if (jsonData != null) {
        final userModel = jsonDecode(jsonData) as Map<String, dynamic>;
        emit(
          LoginState.loginSuccess(
            response,
            UserModel.fromJson(userModel),
          ),
        );
      } else {
        final userResponse = await loginRepositories.getMe();

        if (response != null && userResponse != null) {
          emit(
            LoginState.loginSuccess(response, userResponse),
          );
        }
      }
    } on DioError catch (dioError) {
      emit(LoginState.error(dioError.errorMessage));
    }
  }
}
