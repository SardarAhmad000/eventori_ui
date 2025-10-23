import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../AppTheme/widgets/app_theme.dart';

class CustomDatePicker {
  // Default date format for the app
  static String defaultDateFormat = 'dd/MM/yyyy';

  // You can also define other formats if needed
  static String longDateFormat = 'MMMM dd, yyyy';
  static String shortDateFormat = 'dd-MM-yy';
  static String apiDateFormat = 'yyyy-MM-dd';


  static Future<String?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? dateFormat,
    Color? primaryColor,
    Color? onPrimary,
    Color? onSurface,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor ?? AppTheme.cyanColor,
              onPrimary: onPrimary ?? AppTheme.whiteColor,
              onSurface: onSurface ?? AppTheme.darkpurpleColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: primaryColor ?? AppTheme.cyanColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      return formatDate(pickedDate, format: dateFormat ?? defaultDateFormat);
    }
    return null;
  }

  static String formatDate(DateTime date, {String? format}) {
    final DateFormat formatter = DateFormat(format ?? defaultDateFormat);
    return formatter.format(date);
  }

  static DateTime? parseDate(String dateString, {String? format}) {
    try {
      final DateFormat formatter = DateFormat(format ?? defaultDateFormat);
      return formatter.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  /// Get today's date formatted
  static String getTodayFormatted({String? format}) {
    return formatDate(DateTime.now(), format: format);
  }

  /// Check if a date string is valid
  static bool isValidDate(String dateString, {String? format}) {
    return parseDate(dateString, format: format) != null;
  }

  /// Get the difference between two dates in days
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// Check if date is in the past
  static bool isPastDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkDate = DateTime(date.year, date.month, date.day);
    return checkDate.isBefore(today);
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is in the future
  static bool isFutureDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final checkDate = DateTime(date.year, date.month, date.day);
    return checkDate.isAfter(today);
  }
}

/// Custom Date TextField Widget for easy integration
class CustomDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? fieldBorderColor;
  final Widget? suffixIcon;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? dateFormat;
  final Color? primaryColor;
  final ValueChanged<String?>? onDateSelected;

  const CustomDateTextField({
    super.key,
    required this.controller,
    this.hintText = 'Select Date',
    this.fieldBorderColor,
    this.suffixIcon,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
    this.primaryColor,
    this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon ?? Icon(
          Icons.calendar_today,
          color: AppTheme.slateGreyColor,
          size: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: (fieldBorderColor ?? AppTheme.textfieldBorderColor).withOpacity(0.3),
            width: 1.3,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
            width: 1.3,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      onTap: () async {
        final selectedDate = await CustomDatePicker.showCustomDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          dateFormat: dateFormat,
          primaryColor: primaryColor,
        );

        if (selectedDate != null) {
          controller.text = selectedDate;
          onDateSelected?.call(selectedDate);
        }
      },
    );
  }
}