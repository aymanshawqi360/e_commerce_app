import 'package:e_commerce_app/config/functions/spacing.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppForgotPasswordAndDescription extends StatelessWidget {
  final String? title;
  final String? description;
  const AppForgotPasswordAndDescription({
    super.key,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? StringManager.forgotPassword,
          style: TextStyles.font25BlackBold,
        ),
        verticalSpacing(8.h),
        Text(
          description ?? StringManager.descriptionForgotPassword,
          style: TextStyles.font14BlackRegular.copyWith(fontSize: 13.7.sp),
        ),
      ],
    );
  }
}
