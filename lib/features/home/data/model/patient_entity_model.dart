import 'package:ayurvedic/features/home/domain/entity/patient_entity.dart';

class PatientEntityModel extends PatientEntity {
  PatientEntityModel({
    required super.id,
    required super.patientdetails,
    required super.branch,
    required super.user,
    required super.payment,
    required super.name,
    required super.phone,
    required super.address,
    required super.price,
    required super.totalAmount,
    required super.discountAmount,
    required super.advanceAmount,
    required super.balanceAmount,
    required super.dateNdTime,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory PatientEntityModel.fromJson(Map<String, dynamic> json) =>
      PatientEntityModel(
        id: json["id"],
        patientdetails: List<PatientDetailEntity>.from(
          json["patientdetails_set"].map(
            (x) => PatientDetailEntityModel.fromJson(x),
          ),
        ),
        branch: BranchEntityModel.fromJson(json["branch"]),
        user: json["user"].toString(),
        payment: json["payment"].toString(),
        name: json["name"].toString(),
        phone: json["phone"].toString(),
        address: json["address"].toString(),
        price: json["price"].toString(),
        totalAmount: json["total_amount"].toString(),
        discountAmount: json["discount_amount"].toString(),
        advanceAmount: json["advance_amount"].toString(),
        balanceAmount: json["balance_amount"].toString(),
        dateNdTime: json["date_nd_time"].toString(),
        isActive: json["is_active"],
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
      );
}

class PatientDetailEntityModel extends PatientDetailEntity {
  PatientDetailEntityModel({
    required super.id,
    required super.male,
    required super.female,
    required super.patient,
    required super.treatment,
    required super.treatmentName,
  });

  factory PatientDetailEntityModel.fromJson(Map<String, dynamic> json) =>
      PatientDetailEntityModel(
        id: json["id"],
        male: json["male"].toString(),
        female: json["female"].toString(),
        patient: json["patient"].toString(),
        treatment: json["treatment"].toString(),
        treatmentName: json["treatment_name"].toString(),
      );
}

class BranchEntityModel extends BranchEntity {
  BranchEntityModel({
    required super.id,
    required super.name,
    required super.patientsCount,
    required super.location,
    required super.phone,
    required super.mail,
    required super.address,
    required super.gst,
    required super.isActive,
  });

  factory BranchEntityModel.fromJson(Map<String, dynamic> json) =>
      BranchEntityModel(
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
