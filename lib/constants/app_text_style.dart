import 'dart:ui';
import 'package:flutter/material.dart';
import '../AppTheme/widgets/app_theme.dart';

class AppTextStyle{

  //Splash Screen Title

  static  TextStyle titleStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.textTitle,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  //OnBoardingScreen

  static  TextStyle onBoardingTitleStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.whiteColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );


  static  TextStyle onBoardingSubTitleStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );


  static  TextStyle onBoardingitleStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );


  static  TextStyle AlreadyTextStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle loginTextStyle = TextStyle(
    fontFamily: 'Outfit',
    color: AppTheme.loginTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );






}