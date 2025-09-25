import 'dart:async';

import 'package:ayurvedic/core/db/db_service.dart';
import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
Timer(Duration(seconds: 1), () async {
      // await  sl<DbService>().removeCredentials();
      String token = sl<DbService>().getToken();
      if (token.isEmpty) {
        navigatorKey.currentState!.pushReplacementNamed("/login");
      } else {
        navigatorKey.currentState!.pushReplacementNamed("/home");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Image.asset(
            "assets/images/splash_full.png",
            height: sH(context),
            width: sW(context),
            fit:BoxFit.cover
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset("assets/images/logo_small.png"),
          ),
        ],
      
    );
  }
}
