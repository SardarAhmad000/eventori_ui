import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../constants/app_fonts.dart';
import '../AppTheme/widgets/app_theme.dart';

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
    this.fontSize
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
          fontFamily: AppFonts.medium,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        constraints: BoxConstraints(minHeight: 48, minWidth: 90.w),
        fillColor: fillColor ?? AppTheme.whiteColor,
        filled: true,
        contentPadding: const EdgeInsets.only(left: 0, top: 15, bottom: 15, right: 10),
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
            color:AppTheme.textfieldBorderColor.withOpacity(.3),
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
          color:  AppTheme.redColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      hint: Text(
        hintText ?? '',
        style:  TextStyle(
            fontWeight: FontWeight.w400,
            fontSize:fontSize?? 14,  fontFamily: AppFonts.medium,color: hintTextColor??AppTheme.silverColor),
      ),
      style: TextStyle(
        fontSize:fontSize?? 16,
        fontFamily: "medium",
        color: inputTextColor ?? AppTheme.silverColor,
      ),
      iconStyleData: IconStyleData(
        icon:showSuffixIcon==false?Container(): Icon(Icons.keyboard_arrow_down, size: 30, color: dropdownIconColor ?? AppTheme.slateGreyColor),
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