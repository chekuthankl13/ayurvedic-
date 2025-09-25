import 'dart:convert';

import 'package:ayurvedic/core/config/config.dart';
import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/auth/data/model/auth_param_model.dart';
import 'package:ayurvedic/features/auth/data/model/user_entity_model.dart';
import 'package:http/http.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserEntityModel> login({required AuthParamModel param});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Client client;
  final DbService dbService;

  AuthRemoteDataSourceImpl({required this.client,required this.dbService});

  @override
  Future<UserEntityModel> login({required AuthParamModel param}) async {
    try {
      var res = await client.post(
        Uri.parse(Config.loginUrl),
        body: param.toJson(),
      );

      if (res.statusCode == 200) {
        var resBody = jsonDecode(res.body);
        if (resBody['success'] == true) {
          await dbService.saveCredentials(
            user: UserEntityModel.fromJson(resBody),
          );
          return UserEntityModel.fromJson(resBody);
        } else {
          throw CredentialFailure(error: resBody['message']);
        }
      } else {
        var i = jsonDecode(res.body);
        throw CredentialFailure(error: i['message']);
      }
    } on Exception catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
