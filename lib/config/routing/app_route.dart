import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/config/routing/transitions.dart';
import 'package:e_commerce_app/di/dependency_injection.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/forgot_password_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/login_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/otp_verification_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/password_update_default.dart';
import 'package:e_commerce_app/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:e_commerce_app/features/onboarding/presentation/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  Route? gernrateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
      case Routes.forgotPasswordScreen:
        return Transitions.buid(
          widget: BlocProvider(
            create: (context) => sl<AuthForgotPasswordCubit>(),
            child: ForgotPasswordScreen(),
          ),
        );
      case Routes.otpScreen:
        return Transitions.buid(widget: OtpVerificationScreen());
      case Routes.passwordUpdateDefault:
        return Transitions.buid(widget: PasswordUpdateDefault());

      default:
        return Transitions.buid(
          widget: Scaffold(body: Center(child: Text("Deafult Screen"))),
        );
    }
  }
}
