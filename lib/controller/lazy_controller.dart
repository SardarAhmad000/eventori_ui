import 'package:get/get.dart';
import '../view/auth/controller/sign_up_controller.dart';
import '../view/onboarding/controller/Onboarding_controller.dart';
import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
    Get.put(OnboardingController());
    Get.put(SignUpController());
    // Get.put(AddProfilePhotoPageController());
    // Get.lazyPut<AddProfilePhotoPageController>(() => AddProfilePhotoPageController());
  }
}