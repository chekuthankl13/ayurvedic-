import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/home/data/data_source/home_remote_data_source.dart';
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:ayurvedic/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<PatientEntity>>> loadPatient() async {
    try {
      var res = await remoteDataSource.loadPatient();
      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(error: e.error.toString()));
    }
  }
}
