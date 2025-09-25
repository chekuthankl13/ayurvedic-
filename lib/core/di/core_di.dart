import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/features/auth/di/auth_di.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
var sl = GetIt.instance;

Future<void> diInit() async {
  sl.registerLazySingleton(() => DbService());
  sl.registerLazySingleton(() => http.Client());

  //auth
  await authDi(sl);
  
}
