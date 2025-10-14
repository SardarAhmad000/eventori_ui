import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  // var selectedAccountType = Rxn<String>();
 RxString selectedAccountType=''.obs;
 RxInt age=18.obs;
 RxBool showPassword=false.obs;



  void selectAccountType(String accountId) {
    selectedAccountType.value = accountId;
  }


  void onGetStarted() {
    if (selectedAccountType.value != null) {

      print('Selected: ${selectedAccountType.value}');
      Get.toNamed( AppRoutes.addProfilePhotoPage);
    }
  }
}