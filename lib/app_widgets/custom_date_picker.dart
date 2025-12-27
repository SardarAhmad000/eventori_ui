import 'package:flutter/material.dart';
import '../AppTheme/app_theme.dart';

class CustomDatePicker {
  static Future<DateTime?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: today, // ✅ This line makes past dates blurred/low opacity
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColor,
              onPrimary: AppTheme.whiteColor,
              onSurface: AppTheme.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}