import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:e_commerce_app/core/widgets/app_rich_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/functions/spacing.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
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
      backgroundColor: const Color(0xFFFBFBFC),
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
                Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        StringManager.signupwithEmail,
                        style: TextStyles.font24BlackBold,
                      ),
                    ),
                    verticalSpacing(48.h),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(StringManager.email),
                    ),
                    verticalSpacing(2.h),
                    AppTextFormField(horizontal: 16.w, vertical: 14.h),
                    verticalSpacing(15.h),

                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(StringManager.password),
                    ),
                    verticalSpacing(2.h),
                    AppTextFormField(horizontal: 16.w, vertical: 14.h),

                    verticalSpacing(15.h),
                    const Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(StringManager.confirmPassword),
                    ),
                    verticalSpacing(2.h),
                    AppTextFormField(horizontal: 16.w, vertical: 14.h),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 19.w,
                          child: Checkbox(
                            activeColor: ColorsManager.gruyDark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                        horizontalSpacing(5.w),
                        Text(
                          StringManager.agreeWith,
                          style: TextStyles.font12BlackLight,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            StringManager.termsCondition,
                            style: TextStyles.font12PurpleLight,
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(48.h),
                    AppButton(
                      buttinName: StringManager.signUp,
                      style: TextStyles.font13WhiteBold,
                      onTap: () {},
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: AppRichText(
                    onTap: () => context.pushNamedAndRemoveUntil(
                      Routes.login,
                      predicate: (_) => false,
                    ),
                    fristText: StringManager.alreadyHaveAnAccount,
                    lateText: StringManager.login,
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
