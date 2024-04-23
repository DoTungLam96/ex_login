import 'dart:async';

import 'package:ex_login/database/dao/user_dao.dart';
import 'package:ex_login/models/user_model.dart';
import 'package:ex_module_core/ex_module_core.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [UserModel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}
