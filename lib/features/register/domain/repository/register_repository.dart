import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<Failure, List<BranchEntity>>> loadBranch();

  Future<Either<Failure, List<TreatmentEntity>>> loadTreatment();

}
