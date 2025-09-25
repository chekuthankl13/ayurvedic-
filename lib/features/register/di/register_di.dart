import 'package:ayurvedic/features/register/data/data_source/register_remote_data_source.dart';
import 'package:ayurvedic/features/register/data/repository/register_repository_impl.dart';
import 'package:ayurvedic/features/register/domain/repository/register_repository.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_branch_usecase.dart';
import 'package:ayurvedic/features/register/domain/usecase/load_treatment_usecase.dart';
import 'package:ayurvedic/features/register/domain/usecase/register_usecase.dart';
import 'package:ayurvedic/features/register/logic/register_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDi(GetIt sl) async {
  sl.registerFactory(() => RegisterCubit(sl(), sl(),sl()));
  sl.registerLazySingleton(() => LoadBranchUsecase(repository: sl()));
  sl.registerLazySingleton(() => LoadTreatmentUsecase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUsecase(repository: sl()));


  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(client: sl(), dbService: sl()),
  );
}
