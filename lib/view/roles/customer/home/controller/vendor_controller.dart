import 'package:get/get.dart';

class VendorController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;

  final List<String> categories = [
    'PHOTOGRAPHER',
    'CATERING',
    'VENUE',
    'DECORATION',
    'MUSIC',
  ];

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${categories[index]}');
  }
}