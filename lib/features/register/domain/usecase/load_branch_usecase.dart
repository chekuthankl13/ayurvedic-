import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class LoadBranchUsecase extends Usecase<List<BranchEntity>,NoParam> {
  final RegisterRepository repository;

  LoadBranchUsecase({required this.repository});
  @override
  Future<Either<Failure, List<BranchEntity>>> call(NoParam param) async {
    return await repository.loadBranch();
  }
}
