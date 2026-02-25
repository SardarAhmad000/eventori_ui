import 'package:eventori/view/bottom_nav_bar/controller/nav_bar_controller.dart';
import 'package:eventori/view/roles/customer/search/controller/vendor_booking_controller.dart';
import 'package:get/get.dart';
import '../view/auth/controller/auth_controller.dart';
import '../view/auth/controller/social_sign_in_controller.dart';
import '../view/profile/controller/profile_controller.dart';
import '../view/roles/customer/Dashboard/controller/dashboard_controller.dart';
import '../view/roles/customer/chat/controller/chat_controller.dart';
import '../view/roles/customer/event/controller/event_controller.dart';
import '../view/roles/customer/home/controller/home_controller.dart';
import '../view/roles/vendor/bottom_nav_bar/controller/bottom_nav_controller.dart';
import '../view/roles/vendor/complete_profile_vendor/controller/complete_profile_vendor_controller.dart';
import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
    Get.put(AuthController());
    Get.put(SocialSignInController());
    Get.put(EventController());
    Get.put(ChatController());
    Get.put(ProfileController());
    Get.put(HomeController());
    Get.put(VendorBookingController());
    Get.put(NavBarController());
    Get.put(DashboardController());


    // EVENT VENDOR CONTROLLERS
    Get.put(CompleteProfileVendorController());
    Get.put(BottomNavController());


  }
}