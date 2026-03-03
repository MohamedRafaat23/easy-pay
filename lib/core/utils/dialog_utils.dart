import 'package:flutter/material.dart';
import 'package:easy_bay/core/utils/app_colors.dart';

class DialogUtils {
  DialogUtils._();

  // 🔄 Loading Dialog
  static void showLoading(
    BuildContext context, {
    String message = "Loading...",
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Row(
            children: [
              const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.darkgray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ❌ Error Dialog
  static void showError(
    BuildContext context, {
    required String message,
    String buttonText = "OK",
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Error",
          style: TextStyle(color: AppColors.red),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.darkgray),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Success Dialog
  static void showSuccess(
    BuildContext context, {
    required String message,
    String buttonText = "OK",
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          "Success",
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.darkgray),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              buttonText,
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  // ⚠ Confirm Dialog
  static Future<bool?> showConfirmDialog(
    BuildContext context, {
    required String message,
    String confirmText = "Yes",
    String cancelText = "No",
  }) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Text(
          message,
          style: const TextStyle(color: AppColors.darkgray),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              cancelText,
              style: const TextStyle(color: AppColors.gray),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  // 🧹 Hide current dialog
  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}