import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/core/usecase/usecase.dart';
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:ayurvedic/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class LoadPatientUsecase extends Usecase<List<PatientEntity>, NoParam> {
  final HomeRepository repository;

  LoadPatientUsecase({required this.repository});
  @override
  Future<Either<Failure, List<PatientEntity>>> call(NoParam param) async {
    return await repository.loadPatient();
  }
}
