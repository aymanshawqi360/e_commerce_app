import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_svg_view.dart';
import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final String icon;

  const CategoriesItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffEBEFFF),
          ),
          alignment: Alignment.center,
          child: AppSvgView(
            assetName: icon,
            width: 20,
            height: 20,
          ),
        ),
        Text(title, style: AppTextStyles.font14GrayRegular,)
      ],
    );
  }
}
