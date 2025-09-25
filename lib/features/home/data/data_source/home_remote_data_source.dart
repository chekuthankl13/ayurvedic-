import 'dart:convert';

import 'package:ayurvedic/core/config/config.dart';
import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/core/error/exceptions.dart';
import 'package:ayurvedic/core/error/failure.dart';
import 'package:ayurvedic/features/home/data/model/patient_entity_model.dart';
import 'package:http/http.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<PatientEntityModel>> loadPatient();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Client client;
  final DbService dbService;

  HomeRemoteDataSourceImpl({required this.client, required this.dbService});
 
  getheaders(token) => {'Authorization': 'Bearer $token'};
 
 
  @override
  Future<List<PatientEntityModel>> loadPatient()async {
     try {
      List<PatientEntityModel> list = [];
      var res = await client.get(
        Uri.parse(Config.patientUrl),
        headers: getheaders(dbService.getToken()),
      );

      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        if ((body['patient'] as List).isNotEmpty) {
          var k = (body['patient'] as List)
              .map((i) => PatientEntityModel.fromJson(i))
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
}
