import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppLottieLoading extends StatelessWidget {
  final String? title;
  final double? width;
  final double? height;
  final Color? color;
  const AppLottieLoading({
    super.key,
    this.title,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      title ?? AssetsManager.loading,
      width: 30.w,
      height: 30.h,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(const [
            '**',
          ], value: color ?? ColorsManager.white),
        ],
      ),
    );
  }
}
