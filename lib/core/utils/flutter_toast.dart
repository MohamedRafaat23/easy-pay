import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static Future<bool?> showToastMessage({
    required String message,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 14,
    );
  }
}