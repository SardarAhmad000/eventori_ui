import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  // var selectedAccountType = Rxn<String>();
 RxString selectedAccountType=''.obs;

  void selectAccountType(String accountId) {
    selectedAccountType.value = accountId;
  }

}