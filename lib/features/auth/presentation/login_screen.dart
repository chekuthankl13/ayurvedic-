import 'package:ayurvedic/core/theme/app_theme.dart';
import 'package:ayurvedic/core/utils/utils.dart';
import 'package:ayurvedic/features/auth/logic/auth_cubit.dart';
import 'package:ayurvedic/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameCntr = TextEditingController();
  TextEditingController passwordCntr = TextEditingController();

  @override
  void dispose() {
    nameCntr.dispose();
    passwordCntr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: sH(context),
        width: sW(context),
        child: SingleChildScrollView(
          child: Column(
            spacing: 5,
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    width: sW(context),
                    height: sH(context) / 3,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Image.asset("assets/images/logo_small.png"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      "Login Or Register To Book Your Appoinments",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.blackClr,
                      ),
                    ),
                    spaceHeight(30),
                    field(
                      hint: "Enter your UserName",
                      txt: "UserName",
                      cntr: nameCntr,
                    ),
          
                    field(
                      hint: "Enter your Password",
                      txt: "Password",
                      cntr: passwordCntr,
                    ),
          
                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is Success) {
                          EasyLoading.showSuccess("Login Successfull ...");
                
                          navigatorKey.currentState!.pushReplacementNamed(
                            "/home",
                          );
                        }
                        if (state is Error) {
                          EasyLoading.showError(state.error);
                        }
                      },
                      builder: (context, state) {
                        switch (state) {
                          case Loading _:
                            return loadingBtn(size: Size(sW(context) / 2, 35));
                          default:
                            return normalBtn(
                              size: Size(sW(context) / 2, 35),
                              txt: "Login",
                              onpressed: () async {
                                if (nameCntr.text.isEmpty) {
                                  errorToast(
                                    context,
                                    msg: "Please Enter UserName ...",
                                  );
                                } else if (passwordCntr.text.isEmpty) {
                                  errorToast(
                                    context,
                                    msg: "Please Enter Password",
                                  );
                                } else {
                                  context.read<AuthCubit>().login(
                                    email: nameCntr.text,
                                    password: passwordCntr.text,
                                  );
                                }
                              },
                            );
                        }
                      },
                    ),
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      // fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'By creating or logging into an account you are agreeing with ',
                      ),
                      TextSpan(
                        text: 'our Terms',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 40, 252, 1),
                        ), //rgba(0, 40, 252, 1)
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Color.fromRGBO(0, 40, 252, 1)),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
