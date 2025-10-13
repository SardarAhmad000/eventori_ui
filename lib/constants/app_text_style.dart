import 'dart:ui';
import 'package:flutter/material.dart';
import '../AppTheme/widgets/app_theme.dart';

class AppTextStyle{

  static const String fontFamily = "Outfit";
  //Splash Screen Title

  static  TextStyle titleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.textTitle,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  //OnBoardingScreen

  static  TextStyle onBoardingTitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );


  static  TextStyle onBoardingSubTitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );


  static  TextStyle onBoardingitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );


  static  TextStyle AlreadyTextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle loginTextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.loginTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  //Selection Screen

  static  TextStyle selectionTitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.greyColor,
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );

  static  TextStyle selectionSubtitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );







}