import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../AppTheme/app_theme.dart';


class AppFonts{
  static const bold = 'bold'; // use regular
  static const light = 'bold';
  static const medium = 'bold';
  static const regular = 'bold';

//FontFamily
  static const String fontFamily = "Plus Jakarta Sans";

  // Text Styles
  static TextStyle StylePara({double fontSize = 14, Color? color,FontWeight fontWeight = FontWeight.w400,}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color ?? AppTheme.whiteColor,
      fontWeight: fontWeight,
    );
  }

}