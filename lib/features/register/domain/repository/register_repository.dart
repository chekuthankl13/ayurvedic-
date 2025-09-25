import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:dartz/dartz.dart';

import '../entity/register_param.dart';

abstract class RegisterRepository {
  Future<Either<Failure, List<BranchEntity>>> loadBranch();

  Future<Either<Failure, List<TreatmentEntity>>> loadTreatment();

  Future<Either<Failure, String>> register({required RegisterParam param});


}
