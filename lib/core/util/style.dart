import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/font_weight_helper.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle font29BLackMedium = TextStyle(
    color: ColorsManager.black,
    fontSize: 29.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: "SatoshiBold",
  );
  static TextStyle font15GruyDarkMedium = TextStyle(
    color: ColorsManager.greyDark,
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    fontFamily: StringManager.satoshiMedium,
  );
  static TextStyle font16BlackBold = TextStyle(
    color: ColorsManager.black,
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiMedium,
  );

  static TextStyle font14WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiBold,
  );
  static TextStyle font12SoftGrayRegular = TextStyle(
    color: ColorsManager.softGray,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: StringManager.satoshiRegular,
  );
  static TextStyle font24BlackBold = TextStyle(
    color: ColorsManager.black,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiMedium,
  );
  static TextStyle font13WhiteBold = TextStyle(
    color: ColorsManager.white,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiBold,
  );
  static TextStyle font12PurpleLight = TextStyle(
    color: ColorsManager.purple,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.light,
    fontFamily: StringManager.satoshiMedium,
  );
  static TextStyle font12BlackLight = TextStyle(
    color: ColorsManager.black,
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.light,
    fontFamily: StringManager.satoshiMedium,
  );

  static TextStyle font14OnyxBold = TextStyle(
    decoration: TextDecoration.underline,
    color: ColorsManager.onyx,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiBold,
  );
  static TextStyle font14GrayRegular = TextStyle(
    color: ColorsManager.gray,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    fontFamily: StringManager.satoshiMedium,
  );
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.black,
    height: 1.4,
    fontWeight: FontWeightHelper.regular,
    fontFamily: StringManager.satoshiRegular,
  );
  static TextStyle font25BlackBold = TextStyle(
    fontSize: 25.sp,
    color: ColorsManager.black,
    fontWeight: FontWeightHelper.bold,
    fontFamily: StringManager.satoshiBold,
  );
  static TextStyle font12BlackMedium = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.black,
    fontFamily: StringManager.satoshiMedium,
  );

  static TextStyle font18BlackBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
    fontFamily: StringManager.satoshiMedium,
  );
}
