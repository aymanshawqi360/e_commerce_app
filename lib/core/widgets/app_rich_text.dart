import 'package:e_commerce_app/core/util/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  final String fristText;
  final String lateText;
  final void Function()? onTap;
  const AppRichText({
    super.key,
    required this.fristText,
    required this.lateText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              style: AppTextStyles.font14OnyxBold,
              text: lateText,
            ),
          ],

          style: AppTextStyles.font14GrayRegular,
          text: fristText,
        ),
      ),
    );
  }
}
