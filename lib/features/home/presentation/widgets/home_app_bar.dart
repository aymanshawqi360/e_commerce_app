import 'package:flutter/material.dart';

import '../../../../core/util/assets_manager.dart';
import '../../../../core/util/style.dart';
import '../../../../core/widgets/app_svg_view.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Location', style: AppTextStyles.font14GrayRegular),
      subtitle: Text(
        'Dhaka,Bangladesh',
        style: AppTextStyles.font14BlackRegular.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: AppSvgView(
        assetName: AssetsManager.bell,
        height: 20,
        width: 20,
      ),
    );
  }
}
