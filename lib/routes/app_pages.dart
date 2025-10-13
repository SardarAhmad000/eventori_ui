import 'package:eventori/view/onboarding/onboarding_screen_2.dart';
import 'package:get/get.dart';

import '../view/onboarding/onboarding_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () =>  SplashScreen()),
    GetPage(name: AppRoutes.onboradingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: AppRoutes.selectionScreen, page: () =>  SelectionScreen()),

  ];
}