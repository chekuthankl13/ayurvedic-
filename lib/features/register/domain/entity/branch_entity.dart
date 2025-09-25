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