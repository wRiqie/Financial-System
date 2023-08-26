import 'package:financial_system/data/datasources/auth/auth_data_source.dart';
import 'package:financial_system/data/datasources/auth/auth_data_source_mock_imp.dart';
import 'package:financial_system/data/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

class Inject {
  Inject._();

  static void init() {
    final getIt = GetIt.I;

    // datasources
    getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSourceMockImp());

    // repositories
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
  }
}
