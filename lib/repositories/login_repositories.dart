import 'dart:async';
import 'dart:convert';

import 'package:ex_module_core/ex_module_core.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../models/auth_model.dart';
import '../models/user_model.dart';
import '../services/login_services.dart';

abstract class LoginRepositories {
  Future<AuthModel?> login(String username, String password,
      {String? captchaToken, bool? isSaveLogin});

  Future<UserModel?> getMe();
}

final sl = GetIt.instance;

class LoginRepositoriesImpl implements LoginRepositories {
  LoginRepositoriesImpl({required this.loginServices});

  final SharedPreferencesManager sharedPreferencesManager = sl.get();

  LoginService loginServices;

  @override
  Future<AuthModel?> login(String username, String password,
      {String? captchaToken, bool? isSaveLogin}) async {
    try {
      final request = {'username': username, 'password': password};

      final response = await loginServices.login(request);

      await sharedPreferencesManager.putString(
          KEY_ACCESS_TOKEN, response.data!.accessToken);

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getMe() async {
    try {
      final response = await loginServices.getMe();
      final isSaved = await sharedPreferencesManager.saveDataWithExpiration(
        jsonEncode(response.data),
        const Duration(minutes: 2),
      );
      print("saved_me: ${isSaved}");
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
