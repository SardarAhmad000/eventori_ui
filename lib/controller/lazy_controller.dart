import 'package:eventori/view/bottom_nav_bar/controller/nav_bar_controller.dart';
import 'package:eventori/view/roles/customer/search/controller/vendor_booking_controller.dart';
import 'package:get/get.dart';
import '../view/auth/controller/auth_controller.dart';
import '../view/auth/controller/social_sign_in_controller.dart';
import '../view/onboarding/controller/Onboarding_controller.dart';
import '../view/profile/controller/profile_controller.dart';
import '../view/roles/customer/chat/controller/chat_controller.dart';
import '../view/roles/customer/event/controller/event_controller.dart';
import '../view/roles/customer/home/controller/home_controller.dart';
import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
    Get.put(OnboardingController());
    Get.put(AuthController());
    Get.put(SocialSignInController());
    // Get.put(VendorController());
    // Get.put(EventController());
    Get.put(EventController());
    Get.put(ChatController());
    Get.put(ProfileController());
    Get.put(HomeController());
    Get.put(VendorBookingController());
    Get.put(NavBarController());
    // Get.put(SearchController());

  }
}