import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedCategoryIndex = 0.obs;

  final List<String> vendorCategories = [
    'PHOTOGRAPHER',
    'CATERING',
    'VENUE',
    'DECORATION',
    'MUSIC',
  ];

  void selectVendorCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${vendorCategories[index]}');
  }

  final List<String> eventCategories = [
    'All Events',
    'Weddings',
    'Festivals',
    'Corporate',
    'Birthday',
  ];

  void selectEventCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${eventCategories[index]}');
  }

  final List<String> forumCategories = [
    'All Forums',
    'Trending Topics',
    'New topics',
    'followings',
  ];

  void selectForumCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${forumCategories[index]}');
  }

}