// Custom Date TextField Widget
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color? fieldBorderColor;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final bool readOnly;

  const CustomDateTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.fieldBorderColor,
    this.validator,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.readOnly = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.lightCyanColor,
            width: 2,
          ),
        ),
        suffixIcon: onTapSuffixIcon != null
            ? GestureDetector(
          onTap: onTapSuffixIcon,
          child: suffixIcon,
        )
            : suffixIcon,
      ),
    );
  }
}