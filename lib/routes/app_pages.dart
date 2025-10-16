import 'package:eventori/view/auth/screens/add_profile_photo_screen.dart';
import 'package:get/get.dart';
import '../view/auth/screens/create_new_password_screen.dart';
import '../view/auth/screens/forgot_password_screen.dart';
import '../view/auth/screens/login_screen.dart';
import '../view/auth/screens/sign_up_screen.dart';
import '../view/auth/screens/verify_account_screen.dart';
import '../view/auth/screens/password_otp_screen.dart';
import '../view/onboarding/onboarding_screen.dart';
import '../view/onboarding/selection_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.splash, page: () =>  SplashScreen()),
    GetPage(name: AppRoutes.onboradingScreen, page: () =>  OnboardingScreen()),
    GetPage(name: AppRoutes.selectionScreen, page: () =>  SelectionScreen()),
    GetPage(name: AppRoutes.addProfilePhotoPage, page: () =>  AddProfilePhotoPage()),
    GetPage(name: AppRoutes.loginScreen, page: () =>  LoginScreen()),
    GetPage(name: AppRoutes.signUpScreen, page: () =>  SignUpScreen()),
    GetPage(name: AppRoutes.verifyAccountScreen, page: () =>  VerifyAccountScreen()),
    GetPage(name: AppRoutes.forgotPasswordScreen, page: () =>  ForgotPasswordScreen()),
    GetPage(name: AppRoutes.verifyOTPScreen, page: () =>  PasswordOTPScreen()),
    GetPage(name: AppRoutes.createNewPasswordScreen, page: () =>  CreateNewPasswordScreen()),

  ];
}