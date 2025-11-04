import 'dart:async';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppTheme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    splashController.splashTimer();
  }

  SplashController splashController=Get.find();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkpurpleColor,
      body:  Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
            AppAssets.onlyAppLogo,
          width: 80,
          height: 80,
        ),
        Text(
          'eventori',
          style: AppTextStyle.f32W600LCColorTextStyle,
        ),
      ],
    ),
      )
    );
  }
}