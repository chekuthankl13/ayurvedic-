import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/auth/domain/entity/auth_param.dart';
import 'package:ayurvedic/features/auth/domain/entity/user_entity.dart';
import 'package:ayurvedic/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends Usecase<UserEntity, AuthParam> {
  final AuthRepository repository;

  LoginUsecase({required this.repository});
  @override
  Future<Either<Failure, UserEntity>> call(AuthParam param) async {
    return await repository.login(param: param);
  }
}
