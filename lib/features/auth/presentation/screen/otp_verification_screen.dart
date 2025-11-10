import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_forgot_password_and_description.dart';
import 'package:e_commerce_app/core/widgets/app_rich_text.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/otp_code/otp_code_tayping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<OtpVerificationScreen>
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
                const AppForgotPasswordAndDescription(
                  title: StringManager.enter4DigitCode,
                  description:
                      StringManager.descriptionOtp + "(Sdsddsds@gmail.com)",
                ),
                verticalSpacing(48.h),
                const OtpCodeTaypingPage(),
                verticalSpacing(49.h),
                const AppRichText(
                  fristText: "Email not received?",
                  lateText: " Resend Code",
                ),

                verticalSpacing(49.h),
                AppButton(
                  onTap: () {
                    context.pushNamed(Routes.passwordUpdateDefault);
                  },
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringManager.continueForgotPassword,
                        style: AppTextStyles.font13WhiteBold,
                      ),
                      horizontalSpacing(7.w),
                      Text('59', style: AppTextStyles.font13WhiteBold),
                    ],
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
