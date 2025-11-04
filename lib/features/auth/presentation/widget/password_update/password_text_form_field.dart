import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/widgets/app_svg_view.dart';
import 'package:e_commerce_app/core/widgets/app_test_form_field.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final Function(String?) validator;
  const PasswordTextFormField({super.key, required this.validator});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: StringManager.enterYourNewPassword,
      obscureText: _obscureText,

      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Transform.scale(
          scale: 0.5,
          child: AppSvgView(
            assetName: _obscureText
                ? AssetsManager.visibilityOff
                : AssetsManager.visibility,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
