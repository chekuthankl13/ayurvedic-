import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';
import 'package:ayurvedic/features/register/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class LoadTreatmentUsecase extends Usecase<List<TreatmentEntity>, NoParam> {
  final RegisterRepository repository;

  LoadTreatmentUsecase({required this.repository});
  @override
  Future<Either<Failure, List<TreatmentEntity>>> call(NoParam param) async {
    return await repository.loadTreatment();
  }
}
