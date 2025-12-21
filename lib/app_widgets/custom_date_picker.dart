// Custom Date Picker Class
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../AppTheme/app_theme.dart';

class CustomDatePicker {
  static Future<String?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
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

    if (pickedDate != null) {
      // Return UI Format: dd/MM/yy (e.g., 22/12/25)
      return DateFormat('dd/MM/yy').format(pickedDate);
    }

    return null;
  }
}



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../AppTheme/app_theme.dart';
// import '../constants/app_fonts.dart';
//
// class CustomDatePicker {
//   // Default date format for the app
//   static String defaultDateFormat = 'dd/MM/yyyy';
//
//   // You can also define other formats if needed
//   static String longDateFormat = 'MMMM dd, yyyy';
//   static String shortDateFormat = 'dd-MM-yy';
//   static String apiDateFormat = 'yyyy-MM-dd';
//
//
//
//   static String formatDate(DateTime date, {String? format}) {
//     final DateFormat formatter = DateFormat(format ?? defaultDateFormat);
//     return formatter.format(date);
//   }
//
//   static DateTime? parseDate(String dateString, {String? format}) {
//     try {
//       final DateFormat formatter = DateFormat(format ?? defaultDateFormat);
//       return formatter.parse(dateString);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   /// Get today's date formatted
//   static String getTodayFormatted({String? format}) {
//     return formatDate(DateTime.now(), format: format);
//   }
//
//   /// Check if a date string is valid
//   static bool isValidDate(String dateString, {String? format}) {
//     return parseDate(dateString, format: format) != null;
//   }
//
//   /// Get the difference between two dates in days
//   static int daysBetween(DateTime from, DateTime to) {
//     from = DateTime(from.year, from.month, from.day);
//     to = DateTime(to.year, to.month, to.day);
//     return (to.difference(from).inHours / 24).round();
//   }
//
//   /// Check if date is in the past
//   static bool isPastDate(DateTime date) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final checkDate = DateTime(date.year, date.month, date.day);
//     return checkDate.isBefore(today);
//   }
//
//   /// Check if date is today
//   static bool isToday(DateTime date) {
//     final now = DateTime.now();
//     return date.year == now.year &&
//         date.month == now.month &&
//         date.day == now.day;
//   }
//
//   /// Check if date is in the future
//   static bool isFutureDate(DateTime date) {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final checkDate = DateTime(date.year, date.month, date.day);
//     return checkDate.isAfter(today);
//   }
// }
//
// /// Custom Date TextField Widget for easy integration
// class CustomDateTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final Color? fieldBorderColor;
//   final Color? fillColor;
//   final Color? activeFillColor;
//   final Color? inactiveFillColor;
//   final Color? selectedFillColor;
//   final Color? hintTextColor;
//   final Color? inputTextColor;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final DateTime? initialDate;
//   final DateTime? firstDate;
//   final DateTime? lastDate;
//   final String? dateFormat;
//   final Color? primaryColor;
//   final ValueChanged<String?>? onDateSelected;
//   final FormFieldValidator<String>? validator;
//   final bool enabled;
//   void Function() onTapSuffixIcon;
//
//    CustomDateTextField({
//     super.key,
//     required this.controller,
//     this.hintText = 'Select Date',
//     this.fieldBorderColor,
//     this.fillColor,
//     this.activeFillColor,
//     this.inactiveFillColor,
//     this.selectedFillColor,
//     this.hintTextColor,
//     this.inputTextColor,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.initialDate,
//     this.firstDate,
//     this.lastDate,
//     this.dateFormat,
//     this.primaryColor,
//     this.onDateSelected,
//     this.validator,
//     this.enabled = true,
//     required this.onTapSuffixIcon,
//   });
//
//   @override
//   State<CustomDateTextField> createState() => _CustomDateTextFieldState();
// }
//
// class _CustomDateTextFieldState extends State<CustomDateTextField> {
//   late FocusNode _focusNode;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//     _focusNode.addListener(() {
//       if (mounted) setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
//
//   Color _getFillColor() {
//     // Check if field has focus (active/selected)
//     if (_focusNode.hasFocus) {
//       return widget.activeFillColor ??
//           widget.selectedFillColor ??
//           widget.fillColor ??
//           AppTheme.whiteColor;
//     }
//
//     // Check if field has text (selected state)
//     if (widget.controller.text.isNotEmpty) {
//       return widget.selectedFillColor ??
//           widget.fillColor ??
//           AppTheme.whiteColor;
//     }
//
//     // Inactive state
//     return widget.inactiveFillColor ??
//         widget.fillColor ??
//         AppTheme.whiteColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       focusNode: _focusNode,
//       readOnly: true,
//       enabled: widget.enabled,
//       validator: widget.validator,
//       style: TextStyle(
//         fontSize: 16,
//         fontFamily: AppFonts.regular,
//         color: widget.inputTextColor ?? AppTheme.darkpurpleColor,
//       ),
//       decoration: InputDecoration(
//         constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
//         fillColor: _getFillColor(),
//         filled: true,
//         hintText: widget.hintText,
//         hintStyle: TextStyle(
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//           fontFamily: AppFonts.regular,
//           color: widget.hintTextColor ?? AppTheme.silverColor,
//         ),
//         suffixIcon: widget.suffixIcon ??
//             Icon(
//               Icons.calendar_today,
//               color: AppTheme.silverColor,
//               size: 20,
//             ),
//         prefixIcon: widget.prefixIcon == null
//             ? null
//             : Padding(
//           padding: const EdgeInsets.only(left: 12, right: 8),
//           child: widget.prefixIcon!,
//         ),
//         prefixIconConstraints: const BoxConstraints(
//           maxHeight: 24,
//           minHeight: 24,
//           maxWidth: 44,
//           minWidth: 44,
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 1.3,
//             color: widget.fieldBorderColor ??
//                 AppTheme.textfieldBorderColor.withOpacity(.3),
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             color: widget.fieldBorderColor ??
//                 AppTheme.textfieldBorderColor.withOpacity(0.3),
//             width: 1.3,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 1.8,
//             color: _focusNode.hasFocus
//                 ? AppTheme.lightCyanColor
//                 : (widget.fieldBorderColor ??
//                 AppTheme.textfieldBorderColor.withOpacity(.3)),
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 1.3,
//             color: widget.fieldBorderColor ??
//                 AppTheme.textfieldBorderColor.withOpacity(.3),
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             color: AppTheme.textfieldBorderColor.withOpacity(.3),
//             width: 1.3,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 1.3,
//             color: AppTheme.lightCyanColor,
//           ),
//         ),
//         errorStyle: TextStyle(
//           fontSize: 12,
//           color: AppTheme.redColor,
//           fontWeight: FontWeight.bold,
//         ),
//         errorMaxLines: 3,
//       ),
//       onTap: widget.onTapSuffixIcon
//
//     );
//   }
// }