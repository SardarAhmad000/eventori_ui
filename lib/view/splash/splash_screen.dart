import 'dart:async';

import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppTheme/widgets/app_theme.dart';
import '../onboarding/onboarding_screen.dart';

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
      backgroundColor: AppTheme.splashBackgroundScreen,
      body:  Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Icon(
           Icons.calendar_month_outlined,
           size: 80,
         ),
         // Obx(()=> Text(
         //     splashController.showText.value==true?"Umer":"AHmad",
         //   style: TextStyle(color: Colors.white),)),
         // GestureDetector(
         //   onTap: (){
         //     splashController.toggleText();
         //   },
         //   child: Text("Click",style: TextStyle(color: Colors.white),),
         // ),
        Text(
          'eventori',
          style: AppTextStyle.titleStyle,
        ),
      ],
    ),
      )
    );
  }
}