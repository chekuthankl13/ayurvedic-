

import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';

abstract class TreatmentEntity {
  final int id;
  final List<BranchEntity> branches;
  final String name;
  final String duration;
  final String price;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  TreatmentEntity({required this.id, required this.branches, required this.name, required this.duration, required this.price, required this.isActive, required this.createdAt, required this.updatedAt});
}