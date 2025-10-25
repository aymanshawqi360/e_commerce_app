import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final double? vertical;
  final double? horizontal;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;
  final BorderSide? borderSide;
  final bool? filled;
  final Color? fillColor;
  final Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Widget? prefixIcon;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? errorText;
  final OutlineInputBorder? error;
  const AppTextFormField({
    super.key,
    this.hintText,
    this.vertical,
    this.horizontal,
    this.borderRadius,
    this.controller,
    this.borderSide,
    this.filled,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.keyboardType,
    this.errorText,
    this.error,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontal ?? context.screenWidth / 20,
          vertical: vertical ?? context.screenHeight / 60,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          borderSide: borderSide ?? BorderSide(color: ColorsManager.softGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          borderSide: borderSide ?? BorderSide(color: ColorsManager.softGray),
        ),
        errorBorder:
            error ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
        focusedErrorBorder:
            error ??
            OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
        hintText: hintText ?? "Email/Phone Number",
        hintStyle: TextStyles.font12SoftGrayRegular,
        // font14GrayRegular,
        filled: filled ?? true,
        fillColor: fillColor ?? Color(0xFFFBFBFC),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ),
      obscureText: obscureText ?? false,
      cursorColor: ColorsManager.black,
      cursorErrorColor: ColorsManager.black,
      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
