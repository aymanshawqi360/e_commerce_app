import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? width;
  final Color? color;
  final Widget? widget;
  final String buttinName;
  const AppButton({
    super.key,
    this.padding,
    this.width,
    this.color,
    this.widget,
    required this.buttinName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 14.h),
      width: width ?? context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? Color(0xff452CE8),
      ),
      child:
          widget ??
          Center(
            child: Text(
              textAlign: TextAlign.center,
              buttinName,
              style: TextStyles.font15WihteMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
    );
  }
}
