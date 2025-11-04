import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeTaypingPage extends StatelessWidget {
  const OtpCodeTaypingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      // controller: controllerCode,
      // context.read<VerificationCodeCubit>().controllerCode,
      keyboardType: TextInputType.number,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: ColorsManager.purple,
      cursorHeight: 20.h,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(13),
        fieldHeight: 56.h,
        fieldWidth: 53.w,
        activeFillColor: ColorsManager.white,
        activeColor: ColorsManager.lightGray,

        // (state is ConfirmVerifyCodeSuccess)
        //     ? ColorsManager.lightGray
        //     : Colors.red,
        inactiveColor: ColorsManager.lightGray,
        inactiveFillColor: ColorsManager.white,
        selectedColor: ColorsManager.lightGray,
        selectedFillColor: ColorsManager.white,
        // errorBorderColor:
        // disabledColor: Colors.amber,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,

      // onChanged: (value) {},
      appContext: context,
    );
  }
}
