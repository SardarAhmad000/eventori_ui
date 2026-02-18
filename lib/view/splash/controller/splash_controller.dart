import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_routes.dart';
import '../../../services/shared_preferences/shared_preference.dart';
import '../../auth/controller/auth_controller.dart';

class SplashController extends GetxController {
  final RxDouble progress = 0.0.obs;
  Timer? _timer;


  maintainSessionAndNavigate() async {

    Map<String, dynamic> userStatus = await AuthPreference.instance.getUserLoggedIn();
    bool isLoggedIn = userStatus["isLoggedIn"];
    String role = userStatus["role"].toString();
    // String role = "Event_Vendor";

    if (isLoggedIn==true) {
      Get.put(AuthController()).accessToken.value = await AuthPreference.instance.getUserDataToken();
      var userData = await AuthPreference.instance.getUserData();
      print(userData);
      Get.put(AuthController()).userData.value = UserModel.fromJson(jsonDecode(userData));
      startProgressTimer(true,role);
    }else if(isLoggedIn==false){
      startProgressTimer(false,role);
    }
  }

  void startProgressTimer(bool isLoggedIn, String role) {
    const totalDuration = Duration(seconds: 2);
    const tick = Duration(milliseconds: 30);
    final step = tick.inMilliseconds / totalDuration.inMilliseconds;

    _timer = Timer.periodic(tick, (timer) {
      progress.value += step;
      if (progress.value >= 1.0) {
        progress.value = 1.0;
        timer.cancel();
        if(isLoggedIn){
          if(role == "Customer"){
            Get.offAndToNamed(AppRoutes.navBarScreen);
          } else if(role == 'Event_Vendor'){
            Get.toNamed(AppRoutes.vendorBottomNav);
          }
        }
        else{
          Get.offNamed(AppRoutes.loginScreen);
        }
      }
    });
  }

}


// import 'dart:async';
//
// import 'package:eventori/routes/app_routes.dart';
// import 'package:get/get.dart';
//
// import '../../onboarding/onboarding_screen.dart';
//
// class SplashController extends GetxController {
//   RxBool showText=false.obs;
//
//   void splashTimer(){
//     Timer(const Duration(seconds: 2), () {
//       // Get.off(() => const OnboardingScreen());
//      Get.toNamed( AppRoutes.onboradingScreen,
//      );
//     });
//   }
//
// }