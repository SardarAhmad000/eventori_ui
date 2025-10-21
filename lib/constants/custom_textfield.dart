// import 'package:flutter/material.dart';
// import '../AppTheme/widgets/app_theme.dart';
// import 'app_fonts.dart';
//
// /// Text Field
// class CustomTextField extends StatefulWidget {
//   final String? hintText;
//   final Widget? suffixIcon;
//   // final String? prefixIcon;
//   final Widget? prefixIcon;
//   final bool? isObscure;
//   final bool? isChangeErrorFont;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   final FormFieldValidator<String>? validator;
//   final onChanged;
//   final String? suffixText;
//   final String? prefixText;
//   final String? fieldName;
//   final inputFormatters;
//   final bool? enabled;
//   final String? heading;
//   final int? maxLines;
//   final Color? prefixIconColor;
//   final Color? suffixIconColor;
//   final Color? hintTextColor;
//   final Color? fieldBorderColor;
//   final Color? fillColor;
//   final Color? inputTextColor;
//   final double? scale;
//   final Function()? onTap;
//   final Function()? onTapSearchIcon;
//   final bool isEditProfileInfoScreen;
//   final FocusNode? focusNode;
//   final void Function(String)? onFieldSubmitted;
//   final TextAlign? textAlign;
//
//   const CustomTextField({
//     super.key,
//     this.isChangeErrorFont,
//     this.hintText,
//     this.suffixIcon,
//     this.isObscure,
//     this.prefixIcon,
//     this.validator,
//     this.keyboardType,
//     this.suffixText,
//     this.prefixText,
//     this.onChanged,
//     this.controller,
//     this.inputFormatters,
//     this.onTapSearchIcon,
//     this.heading,
//     this.textAlign,
//     this.focusNode,
//     this.onFieldSubmitted,
//     this.enabled,
//     this.maxLines,
//     this.prefixIconColor,
//     this.scale,
//     this.onTap,
//     this.fieldName,
//     this.hintTextColor,
//     this.fillColor,
//     this.inputTextColor,
//     this.fieldBorderColor,
//     this.suffixIconColor,
//     this.isEditProfileInfoScreen = false,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool showPassword = false;
//   late FocusNode _focusNode;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();
//     _focusNode.addListener(() {
//       setState(() {}); // rebuild to reflect focus change
//     });
//   }
//
//
//   @override
//   void dispose() {
//     if (widget.focusNode == null) {
//       _focusNode.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textAlign: widget.textAlign ?? TextAlign.start,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       focusNode: _focusNode,
//       readOnly: widget.enabled ?? false,
//       keyboardType: widget.keyboardType,
//       validator: widget.validator,
//       maxLines: widget.maxLines ?? 1,
//       onTap: widget.onTap,
//       obscureText: widget.isObscure ?? false,
//       obscuringCharacter: "*",
//       controller: widget.controller,
//       cursorColor:AppTheme.cyanColor,
//       cursorErrorColor: AppTheme.cyanColor,
//       onChanged: widget.onChanged,
//       inputFormatters: widget.inputFormatters ?? [],
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       style: TextStyle(
//         fontSize: 16,
//         fontFamily: AppFonts.medium,
//
//
//         color: widget.inputTextColor ?? AppTheme.darkpurpleColor,
//
//
//       ),
//       decoration: InputDecoration(
//         constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
//         fillColor: widget.fillColor ?? AppTheme.primaryColor,
//         filled: true,
//         suffixText: widget.suffixText ?? '',
//         prefixText: widget.prefixText ?? '',
//         prefixStyle: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 15,
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
//         focusedBorder: OutlineInputBorder(
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
//             width: 1.3,
//             color: widget.fieldBorderColor ??
//                 AppTheme.textfieldBorderColor.withOpacity(.3),
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
//             color: widget.isEditProfileInfoScreen
//                 ? AppTheme.textfieldBorderColor.withOpacity(.3)
//                 : AppTheme.textfieldBorderColor.withOpacity(.3),
//             width: 1.3,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 1.3,
//             color: widget.isEditProfileInfoScreen
//                 ? AppTheme.darkpurpleColor
//                 : AppTheme.darkpurpleColor,
//           ),
//         ),
//         hintText: widget.hintText,
//         errorStyle: TextStyle(
//           fontSize: widget.isChangeErrorFont == true ? 8 : 12,
//           color: Colors.red,
//           fontWeight: FontWeight.bold,
//         ),
//         errorMaxLines: 3,
//
//         hintStyle: TextStyle(
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//           fontFamily: AppFonts.medium,
//           color: widget.hintTextColor ?? AppTheme.textGreyColor,
//         ),
//
//         suffixIcon: widget.suffixIcon,
//         suffixIconColor: widget.suffixIconColor ?? AppTheme.textGreyColor,
//         prefixIcon: widget.prefixIcon == null
//             ? const SizedBox()
//             : Padding(
//           padding: const EdgeInsets.only(left: 8, right: 8),
//           child: SizedBox(
//             width: 20,
//             height: 20,
//             child: widget.prefixIcon!,
//           ),
//         ),
//
//         // prefixIcon: widget.prefixIcon == null
//         //     ? const Padding(
//         //   padding: EdgeInsets.only(left: 20.0),
//         //   child: SizedBox(),
//         // )
//         //     : Padding(
//         //   padding: const EdgeInsets.only(left: 20.0, right: 10),
//         //   child: SizedBox(
//         //     width: 20,
//         //     height: 20,
//         //     child: Image.asset(
//         //       widget.prefixIcon!,
//         //       width: 18,
//         //       height: 18,
//         //       color: widget.prefixIconColor ?? AppTheme.blackColor,
//         //       scale: widget.scale,
//         //     ),
//         //   ),
//         // ),
//         prefixIconConstraints: const BoxConstraints(
//           maxHeight: 30,
//           minHeight: 30,
//         ),
//         labelText: widget.fieldName,
//         labelStyle: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w400,
//           color: widget.hintTextColor ?? AppTheme.textGreyColor,
//           fontFamily: AppFonts.medium,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//
//         // focusedBorder: OutlineInputBorder(
//         //   borderRadius: BorderRadius.circular(8),
//         //   borderSide: BorderSide(
//         //     width: 1.8,
//         //     color: _focusNode.hasFocus
//         //         ? AppTheme.cyanColor
//         //         : (widget.fieldBorderColor ??
//         //         AppTheme.textfieldBorderColor.withOpacity(.3)),
//         //   ),
//         // ),
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../AppTheme/widgets/app_theme.dart';
import 'app_fonts.dart';

/// Custom Text Field Widget
class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isObscure;
  final bool? isChangeErrorFont;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final String? suffixText;
  final String? prefixText;
  final String? fieldName;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? heading;
  final int? maxLines;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? hintTextColor;
  final Color? fieldBorderColor;
  final Color? fillColor;
  final Color? inputTextColor;
  final double? scale;
  final Function()? onTap;
  final Function()? onTapSearchIcon;
  final bool isEditProfileInfoScreen;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextAlign? textAlign;

  const CustomTextField({
    super.key,
    this.isChangeErrorFont,
    this.hintText,
    this.suffixIcon,
    this.isObscure,
    this.prefixIcon,
    this.validator,
    this.keyboardType,
    this.suffixText,
    this.prefixText,
    this.onChanged,
    this.controller,
    this.inputFormatters,
    this.onTapSearchIcon,
    this.heading,
    this.textAlign,
    this.focusNode,
    this.onFieldSubmitted,
    this.enabled,
    this.maxLines,
    this.prefixIconColor,
    this.scale,
    this.onTap,
    this.fieldName,
    this.hintTextColor,
    this.fillColor,
    this.inputTextColor,
    this.fieldBorderColor,
    this.suffixIconColor,
    this.isEditProfileInfoScreen = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode!.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTheme.cyanColor, // Always cyan
          selectionColor: AppTheme.cyanColor,
          selectionHandleColor: AppTheme.cyanColor,
        ),
      ),
      child: TextFormField(
        textAlign: widget.textAlign ?? TextAlign.start,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: _focusNode,
        readOnly: widget.enabled ?? false,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        maxLines: widget.maxLines ?? 1,
        onTap: widget.onTap,
        obscureText: widget.isObscure ?? false,
        obscuringCharacter: "*",
        controller: widget.controller,
        cursorColor: AppTheme.cyanColor, // ✅ stays cyan even on error
        cursorErrorColor: AppTheme.cyanColor, // ✅ ensures error state doesn’t change it
        cursorWidth: 1.3,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters ?? [],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.medium,
          color: widget.inputTextColor ?? AppTheme.darkpurpleColor,
        ),
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
          fillColor: widget.fillColor ?? AppTheme.greyColor,
          filled: true,
          suffixText: widget.suffixText ?? '',
          prefixText: widget.prefixText ?? '',
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ??
                  AppTheme.textfieldBorderColor.withOpacity(.3),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.8,
              color: _focusNode?.hasFocus == true
                  ? AppTheme.cyanColor
                  : (widget.fieldBorderColor ??
                  AppTheme.textfieldBorderColor.withOpacity(.3)),
            ),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ??
                  AppTheme.textfieldBorderColor.withOpacity(.3),
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ??
                  AppTheme.textfieldBorderColor.withOpacity(.3),
            ),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppTheme.textfieldBorderColor.withOpacity(.3),
              width: 1.3,
            ),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: AppTheme.cyanColor, // ✅ cyan even in error
            ),
          ),

          hintText: widget.hintText,
          errorStyle: TextStyle(
            fontSize: widget.isChangeErrorFont == true ? 8 : 12,
            color: AppTheme.redColor,
            fontWeight: FontWeight.bold,
          ),
          errorMaxLines: 3,

          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: AppFonts.medium,
            color: widget.hintTextColor ?? AppTheme.silverColor,
          ),

          suffixIcon: widget.suffixIcon,
          suffixIconColor: widget.suffixIconColor ?? AppTheme.silverColor,

          prefixIcon: widget.prefixIcon == null
              ? const SizedBox()
              : Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 20,
              height: 20,
              child: widget.prefixIcon!,
            ),
          ),

          prefixIconConstraints:
          const BoxConstraints(maxHeight: 30, minHeight: 30),

          labelText: widget.fieldName,
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: _focusNode?.hasFocus == true
                ? AppTheme.cyanColor
                : (widget.hintTextColor ?? AppTheme.silverColor),
            fontFamily: AppFonts.medium,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}



