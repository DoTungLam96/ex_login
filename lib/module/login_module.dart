import 'package:ex_module_core/ex_module_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../di/login_di.dart';
import '../screen/login_screen.dart';

class LoginModule extends BaseModule {
  @override
  void injectServices(GetIt getIt) {
    LoginDI.injectServices(getIt);
  }

  @override
  List<LocalizationsDelegate> localizationsDelegates() {
    return [];
  }

  @override
  String modulePath() {
    return "login";
  }

  @override
  Route onGenerateRoute(RouteSettings settings) {
    if ((settings.name ?? '').contains('login')) {
      return getPageRoute(const LoginScreen(), settings);
    }
    return DefaultRoute.notFound();
  }
}
