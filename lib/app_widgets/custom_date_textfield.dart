import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
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
      style: TextStyle(
        color: AppTheme.blackColor,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.whiteColor,
        hintText: hintText,
        hintStyle: AppTextStyle.f16W400SColorTextStyle,
        errorStyle: AppTextStyle.f12W600BColorTextStyle.copyWith(color: AppTheme.redColor),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
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