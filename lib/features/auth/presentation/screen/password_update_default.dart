import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/password_update/password_update_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordUpdateDefault extends StatefulWidget {
  const PasswordUpdateDefault({super.key});

  @override
  _PasswordUpdateDefaultState createState() => _PasswordUpdateDefaultState();
}

class _PasswordUpdateDefaultState extends State<PasswordUpdateDefault>
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
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create New Password",
                    style: AppTextStyles.font25BlackBold,
                  ),

                  verticalSpacing(48.h),
                  PasswordUpdateForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
