import 'package:ex_login/models/user_model.dart';

import '../database/app_database.dart';

abstract class DatabaseRepository {
  Future<UserModel?> getSavedUser();

  Future<void> insertUser(UserModel userModel);

  Future<void> removeUser(UserModel userModel);
}

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<void> removeUser(UserModel userModel) {
    return _appDatabase.userDao.deleteUser(userModel);
  }

  @override
  Future<void> insertUser(UserModel userModel) {
    return _appDatabase.userDao.insertUser(userModel);
  }

  @override
  Future<UserModel?> getSavedUser() {
    return _appDatabase.userDao.getUser();
  }
}
