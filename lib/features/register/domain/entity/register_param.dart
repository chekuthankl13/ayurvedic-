abstract class RegisterParam {
  final String name;
  final String exceutive;
  final String payment;
  final String phone;
  final String address;
  final String totalAmount;
  final String discountAmount;
  final String balanceAmount;

  final String advanceAmount;
  final String dateEndTime;
  final String id;
  final List<String> male;
  final List<String> female;
  final String branch;
  final List<String> treatments;

  RegisterParam({
    required this.name,
    required this.balanceAmount,
    required this.exceutive,
    required this.payment,
    required this.phone,
    required this.address,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.dateEndTime,
    required this.id,
    required this.male,
    required this.female,
    required this.branch,
    required this.treatments,
  });
}
