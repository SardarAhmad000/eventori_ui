import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:country_picker_bkb/model/country_model.dart';

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

  // Filter State Management
  final Rx<String?> selectedCountry = Rx<String?>(null);
  final Rx<String?> selectedCity = Rx<String?>(null);

  // Using ValueNotifier for compatibility with country_picker_bkb
  late final ValueNotifier<CountryModel> countryVN;
  late final ValueNotifier<CityModel> cityVN;

  final Rx<String?> selectedNotice = Rx<String?>(null);
  final Rx<String?> selectedRating = Rx<String?>(null);
  final Rx<String?> selectedTravelAvailability = Rx<String?>(null);

  final RxBool isCateringSelected = false.obs;
  final RxBool isDjSelected = false.obs;
  final RxBool isPhotographySelected = false.obs;
  final RxBool isFloralSelected = false.obs;
  final RxBool isVerifiedIdSelected = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize ValueNotifiers
    countryVN = ValueNotifier(CountryModel());
    cityVN = ValueNotifier(CityModel());

    // Add listeners to sync with Rx variables
    countryVN.addListener(() {
      selectedCountry.value = countryVN.value.name;
      // Reset city when country changes
      selectedCity.value = null;
      cityVN.value = CityModel();
    });

    cityVN.addListener(() {
      selectedCity.value = cityVN.value.name;
    });
  }

  @override
  void onClose() {
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }

  // Update Rating
  void updateRating(String rating) {
    selectedRating.value = rating;
  }

  // Update Notice
  void updateNotice(String? notice) {
    selectedNotice.value = notice;
  }

  // Update Travel Availability
  void updateTravelAvailability(String availability) {
    selectedTravelAvailability.value = availability;
  }

  // Toggle Services
  void toggleCatering() {
    isCateringSelected.value = !isCateringSelected.value;
  }

  void toggleDj() {
    isDjSelected.value = !isDjSelected.value;
  }

  void togglePhotography() {
    isPhotographySelected.value = !isPhotographySelected.value;
  }

  void toggleFloral() {
    isFloralSelected.value = !isFloralSelected.value;
  }

  void toggleVerifiedId() {
    isVerifiedIdSelected.value = !isVerifiedIdSelected.value;
  }

  // Clear All Filters
  void clearAllFilters() {
    selectedCountry.value = null;
    selectedCity.value = null;
    countryVN.value = CountryModel();
    cityVN.value = CityModel();
    selectedNotice.value = null;
    selectedRating.value = null;
    selectedTravelAvailability.value = null;
    isCateringSelected.value = false;
    isDjSelected.value = false;
    isPhotographySelected.value = false;
    isFloralSelected.value = false;
    isVerifiedIdSelected.value = false;
  }

  // Get Filter Results
  Map<String, dynamic> getFilterResults() {
    return {
      'country': selectedCountry.value,
      'city': selectedCity.value,
      'notice': selectedNotice.value,
      'rating': selectedRating.value,
      'travelAvailability': selectedTravelAvailability.value,
      'catering': isCateringSelected.value,
      'dj': isDjSelected.value,
      'photography': isPhotographySelected.value,
      'floral': isFloralSelected.value,
      'verifiedId': isVerifiedIdSelected.value,
    };
  }
}