import 'dart:async';

import 'package:eventori/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../onboarding/onboarding_screen.dart';

class SplashController extends GetxController {
  RxBool showText=false.obs;
  RxString name='talha'.obs;
  RxInt age=12.obs;
  void toggleText(){
    showText.value=!showText.value;
  }

  void splashTimer(){
    Timer(const Duration(seconds: 2), () {
      // Get.off(() => const OnboardingScreen());
     Get.toNamed( AppRoutes.onboradingScreen,
     );
    });
  }

}