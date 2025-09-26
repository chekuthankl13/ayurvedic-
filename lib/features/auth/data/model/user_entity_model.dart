import 'package:ayurvedic/features/auth/domain/entity/user_entity.dart';

class UserEntityModel extends UserEntity {
  UserEntityModel({required super.status, required super.message, required super.token, required super.isSuperuser, required super.userDetails});
    factory UserEntityModel.fromJson(Map<String, dynamic> json) => UserEntityModel(
    status: json["status"],
    message: json["message"].toString(),
    token: json["token"].toString(),
    isSuperuser: json["is_superuser"],
    userDetails: UserDetailEntityModel.fromJson(json["user_details"]),
  );

    Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "is_superuser": isSuperuser,
    "user_details": (userDetails as UserDetailEntityModel).toJson(),
  };
}

class UserDetailEntityModel extends UserDetailEntity {
  UserDetailEntityModel({required super.id, required super.lastLogin, required super.name, required super.phone, required super.address, required super.mail, required super.username, required super.password, required super.passwordText, required super.admin, required super.isAdmin, required super.isActive, required super.createdAt, required super.updatedAt, required super.branch});
  
  factory UserDetailEntityModel.fromJson(Map<String, dynamic> json) => UserDetailEntityModel(
    id: json["id"].toString(),
    lastLogin: json["last_login"].toString(),
    name: json["name"].toString(),
    phone: json["phone"].toString(),
    address: json["address"].toString(),
    mail: json["mail"].toString(),
    username: json["username"].toString(),
    password: json["password"].toString(),
    passwordText: json["password_text"].toString(),
    admin: json["admin"].toString(),
    isAdmin: json["is_admin"],
    isActive: json["is_active"],
    createdAt:json["created_at"].toString(),
    updatedAt:json["updated_at"].toString(),
    branch: json["branch"].toString(),
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "last_login": lastLogin,
    "name": name,
    "phone": phone,
    "address": address,
    "mail": mail,
    "username": username,
    "password": password,
    "password_text": passwordText,
    "admin": admin,
    "is_admin": isAdmin,
    "is_active": isActive,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "branch": branch,
  };

}