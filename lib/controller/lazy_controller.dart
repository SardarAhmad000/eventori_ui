import 'package:get/get.dart';

import '../view/auth/addprofilephoto/controller/add_profile_photo_page_controller.dart';
import '../view/onboarding/controller/Onboarding_controller.dart';
import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());
    Get.put(OnboardingController());
    // Get.put(AddProfilePhotoPageController());
    // Get.lazyPut<AddProfilePhotoPageController>(() => AddProfilePhotoPageController());
  }
}