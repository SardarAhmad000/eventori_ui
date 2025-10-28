import 'package:get/get.dart';

class EventController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;

  final List<String> categories = [
    'All Events',
    'Weddings',
    'Festivals',
    'Corporate',
    'Birthday',
  ];

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${categories[index]}');
  }
}