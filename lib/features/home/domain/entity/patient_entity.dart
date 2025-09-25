abstract class PatientEntity {
  final int id;
  final List<PatientDetailEntity> patientdetails;
  final BranchEntity branch;
  final String user;
  final String payment;
  final String name;
  final String phone;
  final String address;
  final String price;
  final String totalAmount;
  final String discountAmount;
  final String advanceAmount;
  final String balanceAmount;
  final String dateNdTime;
  final bool isActive;
  final String createdAt;
  final String updatedAt;

  PatientEntity({required this.id, required this.patientdetails, required this.branch, required this.user, required this.payment, required this.name, required this.phone, required this.address, required this.price, required this.totalAmount, required this.discountAmount, required this.advanceAmount, required this.balanceAmount, required this.dateNdTime, required this.isActive, required this.createdAt, required this.updatedAt});
}

abstract class PatientDetailEntity {
   final int id;
  final String male;
  final String female;
  final String patient;
  final String treatment;
  final String treatmentName;

  PatientDetailEntity({required this.id, required this.male, required this.female, required this.patient, required this.treatment, required this.treatmentName});
}

abstract class BranchEntity {
   final int id;
  final String name;
  final String patientsCount;
  final String location;
  final String phone;
  final String mail;
  final String address;
  final String gst;
  final bool isActive;

  BranchEntity({required this.id, required this.name, required this.patientsCount, required this.location, required this.phone, required this.mail, required this.address, required this.gst, required this.isActive});
}