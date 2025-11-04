import 'package:get/get.dart';
import '../view/auth/controller/auth_controller.dart';
import '../view/onboarding/controller/Onboarding_controller.dart';
import '../view/roles/customer/chat/controller/chat_detailed_controller.dart';
import '../view/roles/customer/event/controller/feature_event_controller.dart';
import '../view/roles/customer/home/controller/event_controller.dart';
import '../view/roles/customer/home/controller/vendor_controller.dart';
import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
    Get.put(OnboardingController());
    Get.put(AuthController());
    Get.put(VendorController());
    Get.put(EventController());
    Get.put(FeatureEventController());
    Get.put(ChatController());

  }
}