abstract class UserEntity {
  final bool status;
  final String message;
  final String token;
  final bool isSuperuser;
  final UserDetailEntity userDetails;

  UserEntity({required this.status, required this.message, required this.token, required this.isSuperuser, required this.userDetails});
}

abstract class UserDetailEntity {
  final String id;
  final String lastLogin;
  final String name;
  final String phone;
  final String address;
  final String mail;
  final String username;
  final String password;
  final String passwordText;
  final String admin;
  final bool isAdmin;
  final bool isActive;
  final String createdAt;
  final String updatedAt;
  final String branch;

  UserDetailEntity({
    required this.id,
    required this.lastLogin,
    required this.name,
    required this.phone,
    required this.address,
    required this.mail,
    required this.username,
    required this.password,
    required this.passwordText,
    required this.admin,
    required this.isAdmin,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.branch,
  });
}
