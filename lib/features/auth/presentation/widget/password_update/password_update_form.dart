import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:e_commerce_app/features/auth/presentation/widget/password_update/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordUpdateForm extends StatelessWidget {
  const PasswordUpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.newPassword,
              style: AppTextStyles.font12BlackMedium,
            ),
          ),
          verticalSpacing(4.h),
          PasswordTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
              return null;
            },
          ),
          verticalSpacing(16.h),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              StringManager.confirmPassword,
              style: AppTextStyles.font12BlackMedium,
            ),
          ),
          verticalSpacing(4.h),
          PasswordTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please confirm your password";
              }
              return null;
            },
          ),
          verticalSpacing(48.h),
          AppButton(onTap: () {}, buttinName: StringManager.updatePassword),
        ],
      ),
    );
  }
}
