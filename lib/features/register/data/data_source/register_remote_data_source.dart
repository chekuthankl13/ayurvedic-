import 'dart:convert';

import 'package:ayurvedic/core/config/config.dart';
import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/register/data/model/branch_entity_model.dart';
import 'package:ayurvedic/features/register/data/model/treatment_entity_model.dart';
import 'package:http/http.dart';

import '../model/register_param_model.dart';

abstract interface class RegisterRemoteDataSource {
  Future<List<BranchEntityModel>> branch();
  Future<List<TreatmentEntityModel>> treatment();

  Future<String> register({required RegisterParamModel param});

}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final DbService dbService;
  final Client client;

  RegisterRemoteDataSourceImpl({required this.dbService, required this.client});
  getheaders(token) => {'Authorization': 'Bearer $token'};
 
 
  @override
  Future<List<BranchEntityModel>> branch() async{
    try {
      List<BranchEntityModel> list = [];
      var res = await client.get(
        Uri.parse(Config.branchUrl),
        headers: getheaders(dbService.getToken()),
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if ((body['branches'] as List).isNotEmpty) {
          var k = (body['branches'] as List)
              .map((i) => BranchEntityModel.fromJson(i))
              .toList();
          return k;
        } else {
          return list;
        }
      } else {
        throw ServerFailure(error: res.body);
      }
    } on Exception catch (e) {
      throw ServerException(error: e.toString());
    }
  }

  @override
  Future<List<TreatmentEntityModel>> treatment() async{
    try {
      List<TreatmentEntityModel> list = [];
      var res = await client.get(
        Uri.parse(Config.treatmentUrl),
        headers: getheaders(dbService.getToken()),
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if ((body['treatments'] as List).isNotEmpty) {
          var k = (body['treatments'] as List)
              .map((i) => TreatmentEntityModel.fromJson(i))
              .toList();
          return k;
        } else {
          return list;
        }
      } else {
        throw ServerFailure(error: res.body);
      }
    } on Exception catch (e) {
      throw ServerException(error: e.toString());
    }
  }
  
  @override
  Future<String> register({required RegisterParamModel param})async {
     try {
      var res = await client.post(
        Uri.parse(Config.registerUrl),
        body: param.toJson(),
        headers: getheaders(dbService.getToken()),
      );
     
      if (res.statusCode == 200 || res.statusCode == 201) {
        return "ok";
      } else {
        throw ServerFailure(error: res.body);
      }
    } on Exception catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
