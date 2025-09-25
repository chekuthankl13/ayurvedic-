import 'package:ayurvedic/features/auth/domain/entity/auth_param.dart';

class AuthParamModel extends AuthParam {
  AuthParamModel({required super.username, required super.password});

  Map<String, String> toJson() => {"username": username, "password": password};

  factory AuthParamModel.fromEntity(AuthParam data) =>
      AuthParamModel(password: data.password, username: data.username);
}
