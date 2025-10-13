import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/font_weight_helper.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font29BLackMedium = TextStyle(
    color: ColorsManager.black,
    fontSize: 29.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SatoshiBold",
  );
  static TextStyle font15GruyDarkMedium = TextStyle(
    color: ColorsManager.gruyDark,
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: StringManager.satoshiMedium,
  );

  static TextStyle font15WihteMedium = TextStyle(
    color: Color(0xffFBFBFC),
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: StringManager.satoshiMedium,
  );
}
