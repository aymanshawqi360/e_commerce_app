import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/style.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/categories_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/font_weight_helper.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Fashion', 'icon': AssetsManager.fashion},
    {'title': 'Fitness', 'icon': AssetsManager.fitness},
    {'title': 'Living', 'icon': AssetsManager.living},
    {'title': 'Games', 'icon': AssetsManager.games},
    {'title': 'Stationery', 'icon': AssetsManager.stationery},
    {'title': 'Stationery', 'icon': AssetsManager.stationery},
    {'title': 'Stationery', 'icon': AssetsManager.stationery},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories', style: AppTextStyles.font18BlackBold),
            Text(
              'View All',
              style: AppTextStyles.font14GrayRegular.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoriesItem(
                title: categories[index]['title'],
                icon: categories[index]['icon'],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }
}
