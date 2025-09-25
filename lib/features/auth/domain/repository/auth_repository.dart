import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/auth/domain/entity/auth_param.dart';
import 'package:ayurvedic/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({required AuthParam param});
}
