import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/widgets/app_svg_view.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpTextFormField extends StatefulWidget {
  final TextEditingController? passwordController;
  const SignUpTextFormField({super.key, required this.passwordController});

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  late bool _isPasswordVisible;
  @override
  void initState() {
    super.initState();
    _isPasswordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      obscureText: _isPasswordVisible,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: Transform.scale(
          scale: 0.5,
          child: AppSvgView(
            assetName: _isPasswordVisible
                ? AssetsManager.visibilityOff
                : AssetsManager.visibility,
          ),
        ),
      ),
      controller: widget.passwordController,
      horizontal: 16.w,
      vertical: 14.h,
      hintText: StringManager.enterYourPassword,
      validator: (value) {
        if (value?.isEmpty ?? value == null) {
          return "password must not be empty";
        }
      },
    );
  }
}
