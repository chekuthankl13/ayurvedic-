import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

sW(context) => MediaQuery.of(context).size.width;
sH(context) => MediaQuery.of(context).size.height;

Widget spaceHeight(val) => SizedBox(height: double.parse(val.toString()));
spaceWidth(val) => SizedBox(width: double.parse(val.toString()));

errorToast(context, {msg}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

error(String error, {required onPressed}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: Size(120, 40),
            foregroundColor: Colors.white,
            backgroundColor: AppTheme.greenClr,
          ),
          label: Text("Retry"),
          icon: Icon(Icons.restore_outlined, color: Colors.white),
        ),
        Text(error, textAlign: TextAlign.center),
      ],
    ),
  );
}

scafolderror(String error, txt, {required onPressed}) {
  return Scaffold(
    appBar: AppBar(title: Text(txt)),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(120, 40),
                foregroundColor: Colors.white,
                backgroundColor: AppTheme.greenClr,
              ),
              label: Text("Retry"),
              icon: Icon(Icons.restore_outlined, color: Colors.white),
            ),
            Text(error, textAlign: TextAlign.center),
          ],
        ),
      ),
    ),
  );
}

Widget loading({clr =  AppTheme.greenClr}) => Center(
  child: CircularProgressIndicator(
    strokeWidth: .5,
    strokeAlign: 10,
    color: clr,
  ),
);

Widget scafoldloading({clr, txt}) => Scaffold(
  appBar: AppBar(title: Text(txt)),
  body: Center(
    child: CircularProgressIndicator(
      strokeWidth: .5,
      strokeAlign: 10,
      color: clr,
    ),
  ),
);

Widget empty() => SizedBox();

Widget itemEmpty(context, txt, {isCenter = true}) => Column(
  spacing: 20,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    isCenter ? spaceHeight(sH(context) / 3) : empty(),
    Center(child: Text(txt)),
  ],
);

isTab(context) => sW(context) >= 700 && sW(context) <= 1200 ? true : false;

isDesktop(context) => sW(context) >= 1200 ? true : false;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool onWillPop(context, lastPressed) {
  final now = DateTime.now();
  if (lastPressed == null ||
      now.difference(lastPressed!) > const Duration(seconds: 2)) {
    lastPressed = now;
    errorToast(context, msg: "press again to exit");
    return false; // don't exit
  }
  return true; // exit app
}



bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}
