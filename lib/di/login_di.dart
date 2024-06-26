import 'package:ex_module_core/ex_module_core.dart';

import '../cubit/login_cubit.dart';
import '../database/app_database.dart';
import '../repositories/db_repository.dart';
import '../repositories/login_repositories.dart';
import '../services/login_services.dart';

class LoginDI {
  static injectServices(GetIt getIt) async {
    final dio = getIt.get<Dio>();
    final Network network = getIt.get();

    //register services
    getIt.registerLazySingleton(
        () => LoginService(dio, baseUrl: network.domain.tAPIUrl));

    //register repositories
    getIt.registerLazySingleton<LoginRepositories>(
      () => LoginRepositoriesImpl(
        loginServices: getIt.get(),
      ),
    );

    getIt.registerFactory<LoginCubit>(() => LoginCubit());

//register local database
    final db =
        await $FloorAppDatabase.databaseBuilder(Constants.databaseName).build();
    getIt.registerSingleton<AppDatabase>(db);

    getIt.registerSingleton<DatabaseRepository>(
      DatabaseRepositoryImpl(
        getIt<AppDatabase>(),
      ),
    );
  }
}
