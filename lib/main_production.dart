import 'package:e_commerce_app/config/routing/app_route.dart';
import 'package:e_commerce_app/e_commerce_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(ECommerceApp(appRoute: AppRoute()));
}
