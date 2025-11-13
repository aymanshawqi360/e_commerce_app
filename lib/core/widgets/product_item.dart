import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/core/widgets/app_svg_view.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.08), blurRadius: 4),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AssetsManager.product,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portable Neck Fan Hands Free Fan',
                      style: AppTextStyles.font12BlackMedium.copyWith(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$40  ',
                            style: AppTextStyles.font18BlackBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: '\$60',
                            style: AppTextStyles.font14GrayRegular.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppSvgView(assetName: AssetsManager.star),
                        SizedBox(width: 8),
                        Text(
                          '4.8 (120)',
                          style: AppTextStyles.font15GruyDarkMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 24,
              height: 24,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.favorite_border, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
