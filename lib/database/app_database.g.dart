// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_table` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userName` TEXT, `fullName` TEXT, `email` TEXT, `mobile` TEXT, `address` TEXT, `isActive` INTEGER, `gender` TEXT, `dateOfBirth` TEXT, `clientIDForPartner` TEXT, `hasPin` INTEGER, `forcePasswordChangeStatus` TEXT, `minimumPasswordAge` INTEGER, `custodianFlag` TEXT, `registrationType` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userModelInsertionAdapter = InsertionAdapter(
            database,
            'user_table',
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'userName': item.userName,
                  'fullName': item.fullName,
                  'email': item.email,
                  'mobile': item.mobile,
                  'address': item.address,
                  'isActive':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'gender': item.gender,
                  'dateOfBirth': item.dateOfBirth,
                  'clientIDForPartner': item.clientIDForPartner,
                  'hasPin': item.hasPin == null ? null : (item.hasPin! ? 1 : 0),
                  'forcePasswordChangeStatus': item.forcePasswordChangeStatus,
                  'minimumPasswordAge': item.minimumPasswordAge,
                  'custodianFlag': item.custodianFlag,
                  'registrationType': item.registrationType
                }),
        _userModelDeletionAdapter = DeletionAdapter(
            database,
            'user_table',
            ['id'],
            (UserModel item) => <String, Object?>{
                  'id': item.id,
                  'userName': item.userName,
                  'fullName': item.fullName,
                  'email': item.email,
                  'mobile': item.mobile,
                  'address': item.address,
                  'isActive':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'gender': item.gender,
                  'dateOfBirth': item.dateOfBirth,
                  'clientIDForPartner': item.clientIDForPartner,
                  'hasPin': item.hasPin == null ? null : (item.hasPin! ? 1 : 0),
                  'forcePasswordChangeStatus': item.forcePasswordChangeStatus,
                  'minimumPasswordAge': item.minimumPasswordAge,
                  'custodianFlag': item.custodianFlag,
                  'registrationType': item.registrationType
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserModel> _userModelInsertionAdapter;

  final DeletionAdapter<UserModel> _userModelDeletionAdapter;

  @override
  Future<UserModel?> getUser() async {
    return _queryAdapter.query('SELECT * FROM user_table',
        mapper: (Map<String, Object?> row) => UserModel(
            userName: row['userName'] as String?,
            id: row['id'] as int?,
            fullName: row['fullName'] as String?,
            email: row['email'] as String?,
            mobile: row['mobile'] as String?,
            address: row['address'] as String?,
            isActive:
                row['isActive'] == null ? null : (row['isActive'] as int) != 0,
            dateOfBirth: row['dateOfBirth'] as String?,
            clientIDForPartner: row['clientIDForPartner'] as String?,
            gender: row['gender'] as String?,
            hasPin: row['hasPin'] == null ? null : (row['hasPin'] as int) != 0,
            minimumPasswordAge: row['minimumPasswordAge'] as int?,
            custodianFlag: row['custodianFlag'] as String?,
            registrationType: row['registrationType'] as int?,
            forcePasswordChangeStatus:
                row['forcePasswordChangeStatus'] as String?));
  }

  @override
  Future<void> insertUser(UserModel userModel) async {
    await _userModelInsertionAdapter.insert(
        userModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUser(UserModel userModel) async {
    await _userModelDeletionAdapter.delete(userModel);
  }
}
