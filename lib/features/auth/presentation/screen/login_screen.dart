import 'package:e_commerce_app/core/functions/spacing.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
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
      duration: Duration(seconds: 3),
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
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    StringManager.loginWithEmail,
                    style: TextStyles.font24BlackBold,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 48.h),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(StringManager.email),
                      ),

                      AppTextFormField(horizontal: 16.w, vertical: 14.h),
                      SizedBox(height: 16),

                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(StringManager.password),
                      ),
                      AppTextFormField(horizontal: 16.w, vertical: 14.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 19.w,
                            // height: 15.h,
                            child: Checkbox(
                              activeColor: ColorsManager.gruyDark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          Text("Forgot Password"),
                        ],
                      ),
                      verticalSpacing(48.h),
                      AppButton(
                        buttinName: StringManager.login,
                        style: TextStyles.font16WhiteBold,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
