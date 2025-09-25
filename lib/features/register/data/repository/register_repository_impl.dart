import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/register/data/data_source/register_remote_data_source.dart';
import 'package:ayurvedic/features/register/data/model/register_param_model.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/register_param.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  RegisterRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<BranchEntity>>> loadBranch() async {
    try {
      var res = await remoteDataSource.branch();
      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(error: e.error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TreatmentEntity>>> loadTreatment() async {
    try {
      var res = await remoteDataSource.treatment();
      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(error: e.error.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required RegisterParam param,
  }) async {
    try {
      var res = await remoteDataSource.register(
        param: RegisterParamModel.fromEntity(param),
      );
      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(error: e.error.toString()));
    }
  }
}
