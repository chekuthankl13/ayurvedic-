import 'package:ayurvedic/features/register/domain/entity/branch_entity.dart';

class BranchEntityModel extends BranchEntity {
  BranchEntityModel({required super.id, required super.name, required super.patientsCount, required super.location, required super.phone, required super.mail, required super.address, required super.gst, required super.isActive});
  factory BranchEntityModel.fromJson(Map<String, dynamic> json) => BranchEntityModel(
    id: json["id"],
    name: json["name"].toString(),
    patientsCount: json["patients_count"].toString(),
    location: json["location"].toString(),
    phone: json["phone"].toString(),
    mail: json["mail"].toString(),
    address: json["address"].toString(),
    gst: json["gst"].toString(),
    isActive: json["is_active"],
  );
}