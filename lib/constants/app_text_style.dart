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
  static  TextStyle cyanColorStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.cyanColor,
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

  static  TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle cardDescp = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.whiteColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  //Add Profile Screen
  static  TextStyle addProfileTitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.darkpurpleColor,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle addProfileSubtitleStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.textSubTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static  TextStyle skipStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.skipTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );



  //Login Screen
  static  TextStyle btwDividerTextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.btwDividerTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );


  static  TextStyle bottomtextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.darkpurpleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static  TextStyle bottomSignUptextStyle = TextStyle(
    fontFamily: fontFamily,
    color: AppTheme.cyanColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  //SIGNUP SCREEN
  // static  TextStyle passwordRequirmentTextStyle = TextStyle(
  //   fontFamily: fontFamily,
  //   color: isValid ? AppTheme.buttonColor : AppTheme.textGreyColor,
  //   fontSize: 12,
  //   fontWeight: FontWeight.w400,
  // );


}