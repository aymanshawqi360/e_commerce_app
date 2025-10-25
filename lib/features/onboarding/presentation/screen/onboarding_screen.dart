import 'package:e_commerce_app/config/routing/routes.dart';
import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/extension.dart';
import 'package:e_commerce_app/core/util/string_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AssetsManager.onboarding,
              height: 350.h,
              width: 350.w,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: context.screenWidth * 0.92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringManager.title,
                    textAlign: TextAlign.center,
                    style: TextStyles.font29BLackMedium,
                  ),
                  Text(
                    StringManager.description,
                    textAlign: TextAlign.center,
                    style: TextStyles.font15GruyDarkMedium.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 62.h),

                  AppButton(
                    buttinName: StringManager.getStarted,
                    onTap: () => context.pushNamedAndRemoveUntil(
                      Routes.login,
                      predicate: (_) => false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
