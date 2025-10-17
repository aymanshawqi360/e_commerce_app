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
  final String? buttinName;
  final TextStyle? style;

  final void Function() onTap;

  const AppButton({
    super.key,
    this.padding,
    this.style,
    this.width,
    this.color,
    this.widget,
    this.buttinName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                buttinName ?? StringManager.login,
                style:
                    style ??
                    TextStyles.font15WhiteMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
      ),
    );
  }
}
