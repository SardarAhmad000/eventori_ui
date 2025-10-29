import 'package:get/get.dart';

class FeatureEventController extends GetxController {
  var selectedPromotionPlan = '7day'.obs;
  var selectedPaymentMethod = 'paypal'.obs;

  void selectPromotionPlan(String plan) {
    selectedPromotionPlan.value = plan;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void handlePayment() {
    // Add your payment logic here
    print('Selected Plan: ${selectedPromotionPlan.value}');
    print('Selected Payment Method: ${selectedPaymentMethod.value}');
  }

  @override
  void onClose() {
    super.onClose();
  }
}