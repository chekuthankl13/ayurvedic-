import 'package:ayurvedic/core/di/core_di.dart';
import 'package:ayurvedic/features/auth/logic/auth_cubit.dart';
import 'package:ayurvedic/features/auth/presentation/login_screen.dart';
import 'package:ayurvedic/features/home/logic/home_cubit.dart';
import 'package:ayurvedic/features/home/presentation/home_screen.dart';
import 'package:ayurvedic/features/register/logic/register_cubit.dart';
import 'package:ayurvedic/features/register/logic/treatment_cubit.dart';
import 'package:ayurvedic/features/register/presentation/register_screen.dart';
import 'package:ayurvedic/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  Route? routes(RouteSettings settings) {
    switch (settings.name) {
      case "/splash":
        return goToPage(SplashScreen());
      case "/login":
        return goToPage(
          BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const LoginScreen(),
          ),
        );
      case "/home":
        return goToPage(
          BlocProvider(
            create: (context) => sl<HomeCubit>()..loadPatient(),
            child: HomeScreen(),
          ),
        );
      case "/register":
        return goToPage(
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => sl<RegisterCubit>()),
              BlocProvider(create: (context) => sl<TreatmentCubit>()),
            ],
            child: RegisterScreen(),
          ),
        );
      default:
        return null;
    }
  }

  PageTransition<dynamic> goToPage(child) =>
      PageTransition(type: PageTransitionType.rightToLeft, child: child);
}
