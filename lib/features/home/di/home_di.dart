import 'package:ayurvedic/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ayurvedic/features/home/data/repository/home_repository_impl.dart';
import 'package:ayurvedic/features/home/domain/repository/home_repository.dart';
import 'package:ayurvedic/features/home/domain/usecase/load_patient_usecase.dart';
import 'package:ayurvedic/features/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> homeDi(GetIt sl) async {
  sl.registerFactory(() => HomeCubit(sl()));
  sl.registerLazySingleton(() => LoadPatientUsecase(repository: sl()));

  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: sl(), dbService: sl()),
  );
}
