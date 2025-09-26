import 'dart:convert';
import 'dart:developer';

import 'package:ayurvedic/features/auth/data/model/user_entity_model.dart';
import 'package:ayurvedic/features/auth/domain/entity/user_entity.dart';
import 'package:get_storage/get_storage.dart';

class DbService {
  final _storage = GetStorage();
  String getToken() => _storage.read("token") ?? "";

  UserDetailEntity? getUserDetail() {
    String i = _storage.read("user_detail") ?? "";

    log(i);

    if (i.isNotEmpty) {
      final userDetail = UserDetailEntityModel.fromJson(jsonDecode(i));
      return userDetail;
    } else {
      return null;
    }
  }

  //save login info
  saveCredentials({required UserEntity user}) async {
    await Future.wait([
      _storage.write("token", user.token),
      // _storage.write("experies_at",user. experiesAt),
      _storage.write(
        "user_detail",
        jsonEncode((user.userDetails as UserDetailEntityModel).toJson()),
      ),
    ]);
  }

  // remove all login info
  removeCredentials() async {
    await Future.wait([
      _storage.remove("token"),
      // _storage.remove("experies_at"),
      _storage.remove("user_detail"),
    ]);
  }
}
