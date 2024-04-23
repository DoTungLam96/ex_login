import 'dart:async';
import 'dart:convert';

import 'package:ex_login/cubit/login_state.dart';
import 'package:ex_login/models/user_model.dart';
import 'package:ex_module_core/ex_module_core.dart';

import '../repositories/db_repository.dart';
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

      final userLocal =
          await GetIt.instance<DatabaseRepository>().getSavedUser();
      if (userLocal?.userName != null) {
        emit(
          LoginState.loginSuccess(
            response,
            userLocal,
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
