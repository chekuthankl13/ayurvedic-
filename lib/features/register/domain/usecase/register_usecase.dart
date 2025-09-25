import 'package:ayurvedic/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../entity/register_param.dart';
import '../repository/register_repository.dart';

class RegisterUsecase extends Usecase<String,RegisterParam> {
  final RegisterRepository repository;

  RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(RegisterParam param) async{
    return await repository.register(param: param);
  }
 
}