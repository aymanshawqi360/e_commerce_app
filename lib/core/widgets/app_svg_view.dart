import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgView extends StatelessWidget {
  final BoxFit? fit;
  final double? height;
  final double? width;
  final String assetName;
  const AppSvgView({
    super.key,
    required this.assetName,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      fit: fit ?? BoxFit.contain,
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
