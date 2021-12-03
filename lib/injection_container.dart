import 'package:clean_architecture_tdd/core/services/error_service.dart';
import 'package:clean_architecture_tdd/core/services/navigation_service.dart';
import 'package:clean_architecture_tdd/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/repositories/auth_repository.dart';
import 'package:clean_architecture_tdd/features/authentication/domain/use_cases/sign_in_uc.dart';
import 'package:clean_architecture_tdd/features/authentication/presentation/notifiers/auth_model_impl.dart';
import 'package:get_it/get_it.dart';

import 'core/services/network_service.dart';
import 'features/authentication/domain/use_cases/sign_up_uc.dart';
import 'features/authentication/presentation/notifiers/auth_model.dart';

final sl = GetIt.instance;

void init() {
  // Features
  sl.registerFactory<AuthModel>(
    () => AuthModelImpl(
      signInUC: sl(),
      signUpUC: sl(),
      navigationService: sl(),
      errorService: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => SignInUC(
    repository: sl()),
  );
  sl.registerLazySingleton( () => SignUpUC(
    repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
    remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
    networkService: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkService>(() => NetworkService());
  sl.registerLazySingleton<NavigationService>(() => NavigationService());
  sl.registerLazySingleton<ErrorService>(() => ErrorService(sl()));

  // External
}
