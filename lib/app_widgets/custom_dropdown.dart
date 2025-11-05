import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../constants/app_fonts.dart';
import '../AppTheme/app_theme.dart';

class CustomDropdownField extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final bool? showSuffixIcon;
  final String? fieldName;
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final Function(String?)? onChanged;
  final FormFieldValidator<String>? validator;
  final Color? hintTextColor;
  final Color? fieldBorderColor;
  final Color? fillColor;
  final Color? inputTextColor;
  final Color? dropdownIconColor;
  final bool isEditProfileInfoScreen;
  final String? prefixIcon;

  const CustomDropdownField({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value,
    this.hintText,
    this.showSuffixIcon,
    this.fieldName,
    this.validator,
    this.hintTextColor,
    this.fieldBorderColor,
    this.fillColor,
    this.inputTextColor,
    this.dropdownIconColor,
    this.isEditProfileInfoScreen = false,
    this.fontSize,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: value,
      items: items,
      onChanged: onChanged,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: fieldName,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: hintTextColor ?? AppTheme.silverColor,
          fontFamily: AppFonts.regular,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: BoxConstraints(minHeight: 48, minWidth: 90.w),
        fillColor: fillColor ?? AppTheme.whiteColor,
        filled: true,
        contentPadding: EdgeInsets.only(
          left: prefixIcon != null ? 0 : 0,
          top: 15,
          bottom: 15,
          right: 10,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            prefixIcon!,
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        )
            : null,
        prefixIconConstraints: prefixIcon != null
            ? const BoxConstraints(
          minWidth: 0,
          maxWidth: 40,
          minHeight: 20,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.3,
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.3,
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.3,
            color: fieldBorderColor ?? AppTheme.textfieldBorderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.3,
            color: AppTheme.textfieldBorderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.3,
            color: AppTheme.textfieldBorderColor,
          ),
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          color: AppTheme.redColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      hint: Text(
        hintText ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? 16,
            fontFamily: AppFonts.regular,
            color: hintTextColor ?? AppTheme.silverColor),
      ),
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontFamily: AppFonts.fontFamily,
        color: inputTextColor ?? AppTheme.blackColor,
      ),
      iconStyleData: IconStyleData(
        icon: showSuffixIcon == false
            ? Container()
            : Icon(Icons.keyboard_arrow_down,
            size: 20, color: dropdownIconColor ?? AppTheme.slateGreyColor),
        iconSize: 30,
        iconEnabledColor: dropdownIconColor ?? AppTheme.slateGreyColor,
        iconDisabledColor: Colors.grey,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        // width: 91.w, // Adjust dropdown menu width
        offset: const Offset(0, -4), // Adjust dropdown position
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: fillColor ?? AppTheme.whiteColor,
        ),
      ),
      validator: validator,
      buttonStyleData: ButtonStyleData(
        height: 27,
        padding: const EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}