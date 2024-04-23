import 'package:ex_login/models/user_model.dart';
import 'package:ex_module_core/ex_module_core.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM ${Constants.userTableName} ')
  Future<UserModel?> getUser();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(UserModel userModel);

  @delete
  Future<void> deleteUser(UserModel userModel);
}
