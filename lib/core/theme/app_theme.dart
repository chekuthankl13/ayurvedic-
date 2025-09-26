import 'package:flutter/material.dart';

class AppTheme {
  ////////////////// colors ///////////////
  static const greenClr = Color(0xff006837);
  static const greyClr = Color.fromRGBO(217, 217, 217, 0.25);
  static const whiteClr = Color.fromRGBO(
    255,
    255,
    255,
    0.251,
  ); //background: rgba(64, 64, 64, 1);
  static const blackClr = Color(0xff404040); // Color.fromRGBO(64, 64, 64, 1);
  static const borderClr = Color.fromRGBO(
    0,
    0,
    0,
    .1,
  ); // Color.fromRGBO(64, 64, 64, 1);

  // static const fieldClr = Color(0x40D9D9D9); //rgba(217, 217, 217, 0.25)

  /////////////////////////////////////////

  static ThemeData theme = ThemeData(
    disabledColor: Colors.black12,
    fontFamily: "Poppins",
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    shadowColor: Colors.transparent,
    hoverColor: Colors.black12.withAlpha(5),
    // drawerTheme: DrawerThemeData(backgroundColor: Config.whiteClr),
    appBarTheme: AppBarTheme(
      // titleTextStyle: TextStyle(fontSize: 20, color: Config.blueClr),
      surfaceTintColor: Colors.transparent,
      // backgroundColor: Config.whiteClr,
      elevation: 10,
      // foregroundColor: Config.blueClr,
    ),
  );
}
