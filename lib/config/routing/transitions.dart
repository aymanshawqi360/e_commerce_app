import 'package:flutter/material.dart';

class Transitions {
  static buid({
    required Widget widget,
    bool? allowSnapshotting,
    bool? maintainState,
    bool? requestFocus,
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (context) => widget,
      settings: settings,
      allowSnapshotting: allowSnapshotting ?? false,
      barrierDismissible: true,
      maintainState: maintainState ?? false,
      requestFocus: requestFocus ?? true,
    );
  }
}
