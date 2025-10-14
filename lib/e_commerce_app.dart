import 'package:e_commerce_app/core/routing/app_route.dart';
import 'package:e_commerce_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  final AppRoute appRoute;
  const ECommerceApp({super.key, required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, child) {
        return MaterialApp(
          title: "Development",
          debugShowCheckedModeBanner: false,

          initialRoute: Routes.onboarding,
          onGenerateRoute: appRoute.gernrateRoute,
        );
      },
    );
  }
}
