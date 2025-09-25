import 'package:ayurvedic/features/register/data/model/branch_entity_model.dart';
import 'package:ayurvedic/features/register/domain/entity/treatment_entity.dart';

class TreatmentEntityModel extends TreatmentEntity {
  TreatmentEntityModel({required super.id, required super.branches, required super.name, required super.duration, required super.price, required super.isActive, required super.createdAt, required super.updatedAt});
  

    factory TreatmentEntityModel.fromJson(Map<String, dynamic> json) => TreatmentEntityModel(
    id: json["id"],
    branches: List<BranchEntityModel>.from(
      json["branches"].map((x) => BranchEntityModel.fromJson(x)),
    ),
    name: json["name"].toString(),
    duration: json["duration"].toString(),
    price: json["price"].toString(),
    isActive: json["is_active"],
    createdAt: json["created_at"].toString(),
    updatedAt: json["updated_at"].toString(),
  );
}