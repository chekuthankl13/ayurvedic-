import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<PatientEntity>>> loadPatient();
}
