import 'package:ayurvedic/core/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(height: sH(context),
      width: sW(context),
      child: Column(
        spacing: 5,
        children: [
        Stack(
          children: [
            Image.asset("assets/images/login.png",width: sW(context),
            height: sH(context)/3,
            fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset("assets/images/logo_small.png"))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text("Login Or Register To Book Your Appoinments",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ],),),
    );
  }
}
