import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.email,
              style: TextStyles.font12BlackMedium,
            ),
          ),
          verticalSpacing(4.h),
          AppTextFormField(
            hintText: StringManager.enterYourEmail,
            validator: (value) {
              if (value?.isEmpty ?? value == null) {
                return "Please enter valid email address";
              }
            },
          ),
          verticalSpacing(48.h),
          AppButton(
            // padding: EdgeInsets.symmetric(
            //   horizontal: 16.w,
            //   vertical: 14.h,
            // ),
            onTap: () {
              context.pushNamed(Routes.otpScreen);
            },
            buttinName: StringManager.continueForgotPassword,
          ),
        ],
      ),
    );
  }
}
