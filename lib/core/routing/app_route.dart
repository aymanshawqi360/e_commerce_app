import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/login_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route? gernrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      default:
        deafultScreen();
    }
  }

  MaterialPageRoute<dynamic> deafultScreen() => MaterialPageRoute(
    builder: (_) => Scaffold(body: Center(child: Text("Deafult Screen"))),
  );
}
