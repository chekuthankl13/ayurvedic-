import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/core/routes/app_routes.dart';
import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  await diInit();
  configLoading();
  runApp(const MainApp());
}


void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = AppTheme.greenClr
    ..textColor = AppTheme.whiteClr
    ..boxShadow = [BoxShadow(color: Colors.black38, blurRadius: 2)]
    ..backgroundColor = AppTheme.whiteClr
    ..progressColor = AppTheme.greenClr;
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: AppTheme.theme,
      initialRoute: "/splash",
      onGenerateRoute: AppRoutes().routes,
    );
  }
}
