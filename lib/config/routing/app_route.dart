import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/config/routing/transitions.dart';
import 'package:e_commerce_app/di/dependency_injection.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/login_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route? gernrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.onboarding:
      //   return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.onboarding:
        return Transitions.buid(
          widget: OnboardingScreen(),
          requestFocus: false,
        );
      case Routes.login:
        return Transitions.buid(
          widget: BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUp:
        return Transitions.buid(
          widget: BlocProvider(
            create: (context) => sl<SignupCubit>(),
            child: SignUpScreen(),
          ),
        );

      default:
        return Transitions.buid(
          widget: Scaffold(body: Center(child: Text("Deafult Screen"))),
        );
    }
  }
}
