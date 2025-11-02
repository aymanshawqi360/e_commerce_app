import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/widgets/app_rich_text.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/login/login_bloc_listener.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFBFBFC),
      body: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: EdgeInsets.only(
              left: context.screenWidth / 20,
              right: context.screenWidth / 20,
              top: context.screenHeight / 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginForm(),
                LoginBlocListener(),

                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: AppRichText(
                    onTap: () => context.pushNamedAndRemoveUntil(
                      Routes.signUp,
                      predicate: (_) => false,
                    ),
                    fristText: StringManager.dontHaveAnAccount,
                    lateText: StringManager.signUp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
