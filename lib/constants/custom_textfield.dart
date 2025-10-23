//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../AppTheme/widgets/app_theme.dart';
// import 'app_fonts.dart';
//
// /// Custom Text Field Widget
// class CustomTextField extends StatefulWidget {
//   final String? hintText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final bool? isObscure;
//   final bool? isChangeErrorFont;
//   final TextEditingController? controller;
//   final TextInputType? keyboardType;
//   final FormFieldValidator<String>? validator;
//   final Function(String)? onChanged;
//   final String? suffixText;
//   final String? prefixText;
//   final String? fieldName;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool? enabled;
//   final String? heading;
//   final int? maxLines;
//   final Color? prefixIconColor;
//   final Color? suffixIconColor;
//   final Color? hintTextColor;
//   final Color? fieldBorderColor;
//   final Color? fillColor;
//   final Color? activeFillColor;      // New parameter
//   final Color? inactiveFillColor;    // New parameter
//   final Color? selectedFillColor;    // New parameter
//   final Color? inputTextColor;
//   final double? scale;
//   final Function()? onTap;
//   final Function()? onTapSearchIcon;
//   final bool isEditProfileInfoScreen;
//   final FocusNode? focusNode;
//   final void Function(String)? onFieldSubmitted;
//   final TextAlign? textAlign;
//   final EdgeInsetsGeometry? hintTextPadding;
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
//     this.activeFillColor,      // New parameter
//     this.inactiveFillColor,    // New parameter
//     this.selectedFillColor,    // New parameter
//     this.inputTextColor,
//     this.fieldBorderColor,
//     this.suffixIconColor,
//     this.isEditProfileInfoScreen = false,
//     this.hintTextPadding,
//   });
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   FocusNode? _focusNode;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();
//     _focusNode!.addListener(() {
//       if (mounted) setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     if (widget.focusNode == null) _focusNode?.dispose();
//     super.dispose();
//   }
//
//   EdgeInsetsGeometry _getContentPadding() {
//     if (widget.prefixIcon == null) {
//       return const EdgeInsets.only(left: 30, right: 20, top: 15, bottom: 15);
//     }
//
//     const defaultPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);
//
//     if (widget.hintTextPadding == null) {
//       return defaultPadding;
//     }
//
//     final hintPadding = widget.hintTextPadding!.resolve(TextDirection.ltr);
//
//     return EdgeInsets.symmetric(
//       horizontal: 20 + hintPadding.left,
//       vertical: 15,
//     );
//   }
//
//   Color _getFillColor() {
//     // Check if field has focus (active/selected)
//     if (_focusNode?.hasFocus == true) {
//       return widget.activeFillColor ??
//           widget.selectedFillColor ??
//           widget.fillColor ??
//           AppTheme.greyColor;
//     }
//
//     // Check if field has text (selected state)
//     if (widget.controller?.text.isNotEmpty == true) {
//       return widget.selectedFillColor ??
//           widget.fillColor ??
//           AppTheme.greyColor;
//     }
//
//     // Inactive state
//     return widget.inactiveFillColor ??
//         widget.fillColor ??
//         AppTheme.greyColor;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         textSelectionTheme: TextSelectionThemeData(
//           cursorColor: AppTheme.cyanColor,
//           selectionColor: AppTheme.cyanColor,
//           selectionHandleColor: AppTheme.cyanColor,
//         ),
//       ),
//       child: TextFormField(
//         textAlign: widget.textAlign ?? TextAlign.start,
//         onFieldSubmitted: widget.onFieldSubmitted,
//         focusNode: _focusNode,
//         readOnly: widget.enabled ?? false,
//         keyboardType: widget.keyboardType,
//         validator: widget.validator,
//         maxLines: widget.maxLines ?? 1,
//         onTap: widget.onTap,
//         obscureText: widget.isObscure ?? false,
//         obscuringCharacter: "*",
//         controller: widget.controller,
//         cursorColor: AppTheme.cyanColor,
//         cursorErrorColor: AppTheme.cyanColor,
//         cursorWidth: 1.3,
//         onChanged: widget.onChanged,
//         inputFormatters: widget.inputFormatters ?? [],
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         style: TextStyle(
//           fontSize: 16,
//           fontFamily: AppFonts.medium,
//           color: widget.inputTextColor ?? AppTheme.darkpurpleColor,
//         ),
//         decoration: InputDecoration(
//           constraints: const BoxConstraints(minHeight: 48, minWidth: 90),
//           fillColor: _getFillColor(),
//           filled: true,
//           suffixText: widget.suffixText ?? '',
//           prefixText: widget.prefixText ?? '',
//           prefixStyle: const TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//           contentPadding: _getContentPadding(),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               width: 1.3,
//               color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               width: 1.8,
//               color: _focusNode?.hasFocus == true
//                   ? AppTheme.cyanColor
//                   : (widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3)),
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               width: 1.3,
//               color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
//             ),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               width: 1.3,
//               color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
//             ),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: AppTheme.textfieldBorderColor.withOpacity(.3),
//               width: 1.3,
//             ),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               width: 1.3,
//               color: AppTheme.cyanColor,
//             ),
//           ),
//           hintText: widget.hintText,
//           errorStyle: TextStyle(
//             fontSize: widget.isChangeErrorFont == true ? 8 : 12,
//             color: AppTheme.redColor,
//             fontWeight: FontWeight.bold,
//           ),
//           errorMaxLines: 3,
//           hintStyle: TextStyle(
//             fontWeight: FontWeight.w400,
//             fontSize: 14,
//             fontFamily: AppFonts.medium,
//             color: widget.hintTextColor ?? AppTheme.silverColor,
//           ),
//           suffixIcon: widget.suffixIcon,
//           suffixIconColor: widget.suffixIconColor ?? AppTheme.silverColor,
//           prefixIcon: widget.prefixIcon == null
//               ? const Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: SizedBox(width: 0, height: 0),
//           )
//               : Padding(
//             padding: const EdgeInsets.only(left: 8, right: 8),
//             child: SizedBox(
//               width: 20,
//               height: 20,
//               child: widget.prefixIcon!,
//             ),
//           ),
//           prefixIconConstraints: const BoxConstraints(maxHeight: 30, minHeight: 30),
//           labelText: widget.fieldName,
//           labelStyle: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: _focusNode?.hasFocus == true
//                 ? AppTheme.cyanColor
//                 : (widget.hintTextColor ?? AppTheme.silverColor),
//             fontFamily: AppFonts.medium,
//           ),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//         ),
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

  // Defaulted to white
  final Color? activeFillColor;
  final Color? inactiveFillColor;
  final Color? selectedFillColor;

  final Color? inputTextColor;
  final double? scale;
  final Function()? onTap;
  final Function()? onTapSearchIcon;
  final bool isEditProfileInfoScreen;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? hintTextPadding;

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
    this.activeFillColor = Colors.white,
    this.inactiveFillColor = Colors.white,
    this.selectedFillColor = Colors.white,
    this.inputTextColor,
    this.fieldBorderColor,
    this.suffixIconColor,
    this.isEditProfileInfoScreen = false,
    this.hintTextPadding,
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

  EdgeInsetsGeometry _getContentPadding() {
    if (widget.prefixIcon == null) {
      return const EdgeInsets.only(left: 30, right: 20, top: 15, bottom: 15);
    }

    const defaultPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);

    if (widget.hintTextPadding == null) {
      return defaultPadding;
    }

    final hintPadding = widget.hintTextPadding!.resolve(TextDirection.ltr);

    return EdgeInsets.symmetric(
      horizontal: 20 + hintPadding.left,
      vertical: 15,
    );
  }

  Color _getFillColor() {
    // Check if field has focus (active/selected)
    if (_focusNode?.hasFocus == true) {
      return widget.activeFillColor ?? widget.selectedFillColor ?? widget.fillColor ?? AppTheme.greyColor;
    }

    // Check if field has text (selected state)
    if (widget.controller?.text.isNotEmpty == true) {
      return widget.selectedFillColor ?? widget.fillColor ?? AppTheme.greyColor;
    }

    // Inactive state
    return widget.inactiveFillColor ?? widget.fillColor ?? AppTheme.greyColor;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTheme.cyanColor,
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
        cursorColor: AppTheme.cyanColor,
        cursorErrorColor: AppTheme.cyanColor,
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
          fillColor: _getFillColor(),
          filled: true,
          suffixText: widget.suffixText ?? '',
          prefixText: widget.prefixText ?? '',
          prefixStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          contentPadding: _getContentPadding(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.8,
              color: _focusNode?.hasFocus == true
                  ? AppTheme.cyanColor
                  : (widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3)),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1.3,
              color: widget.fieldBorderColor ?? AppTheme.textfieldBorderColor.withOpacity(.3),
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
            borderSide:  BorderSide(
              width: 1.3,
              color: AppTheme.cyanColor,
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
              ? const Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(width: 0, height: 0),
          )
              : Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: SizedBox(
              width: 20,
              height: 20,
              child: widget.prefixIcon!,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 30, minHeight: 30),
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
