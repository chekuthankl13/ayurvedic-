import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ayurvedic/features/auth/data/model/auth_param_model.dart';
import 'package:ayurvedic/features/auth/domain/entity/auth_param.dart';
import 'package:ayurvedic/features/auth/domain/entity/user_entity.dart';
import 'package:ayurvedic/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> login({required AuthParam param}) async{
     try {
      var res = await remoteDataSource.login(
        param: AuthParamModel.fromEntity(param),
      );

      return Right(res);
    } on Failure catch (e) {
      return Left(e);
    } on ServerException catch (e) {
      return Left(ExceptionFailure(error: e.error.toString()));
    }
  }
}
