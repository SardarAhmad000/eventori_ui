// Custom Date Picker Class
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../AppTheme/app_theme.dart';

class CustomDatePicker {
  static Future<DateTime?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
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