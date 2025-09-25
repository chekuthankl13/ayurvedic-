import 'package:ayurvedic/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ayurvedic/features/auth/data/repository/auth_repository_impl.dart';
import 'package:ayurvedic/features/auth/domain/repository/auth_repository.dart';
import 'package:ayurvedic/features/auth/domain/usecase/login_usecase.dart';
import 'package:ayurvedic/features/auth/logic/auth_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> authDi(GetIt sl) async {
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl(), dbService: sl()),
  );
}
