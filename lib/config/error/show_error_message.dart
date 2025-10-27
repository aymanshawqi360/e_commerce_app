import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowErrorMessage {
  static showErrorMessage({
    required BuildContext context,
    required String message,
  }) => showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          "Error",
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: 12.sp, color: Colors.black87),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancel",
              style: TextStyle(color: ColorsManager.onyx, fontSize: 12.sp),
            ),
          ),
        ],
      );
    },
  );
}
