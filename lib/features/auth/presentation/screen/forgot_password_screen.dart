import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/widgets/app_forgot_password_and_description.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/forgot_password/forgot_password_bloc_listener.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/forgot_password/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgotPasswordScreen>
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

      body: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(35.h),
                AppForgotPasswordAndDescription(),
                verticalSpacing(48.h),

                ForgotPasswordForm(),
                ForgotPasswordBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
