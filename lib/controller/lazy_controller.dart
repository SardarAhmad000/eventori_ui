import 'package:get/get.dart';

import '../view/splash/controller/splash_controller.dart';

class LazyController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SplashController());

  }
}