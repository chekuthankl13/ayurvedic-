import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/core/routes/app_routes.dart';
import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:ayurvedic/features/register/logic/int_cubit.dart';
import 'package:ayurvedic/features/register/logic/sex_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
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
    ..textColor = AppTheme.greenClr
    // ..boxShadow = [BoxShadow(color: Colors.black38, blurRadius: 2)]
    ..backgroundColor = const Color.fromARGB(255, 251, 251, 251)
    ..progressColor = AppTheme.whiteClr;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SexCubit>()),
        BlocProvider(create: (context) => sl<IntCubit2>()),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: AppTheme.theme,
        initialRoute: "/splash",
        onGenerateRoute: AppRoutes().routes,
      ),
    );
  }
}
