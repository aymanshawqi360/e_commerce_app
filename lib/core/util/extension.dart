import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  MediaQueryData get paddingSize => MediaQuery.of(this);
  AppBar get appBar => AppBar();

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get appBarHeight => appBar.preferredSize.height;
  double get bodyHeight =>
      screenHeight - paddingSize.padding.top - appBarHeight;
  EdgeInsets get customPadding => EdgeInsets.only(
    left: screenWidth / 13,
    top: screenHeight / 50,
    right: screenWidth / 13,
    bottom: screenHeight / 20,
  );
}

extension StringExtension on String? {
  bool isNullOrEmp() => this == null || this == "";
  bool isNotNullOrEmp() => this != null;
}
