// import 'package:country_picker_bkb/model/country_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EventController extends GetxController {
//   // Existing properties
//   var selectedPromotionPlan = '7day'.obs;
//   var selectedPaymentMethod = 'paypal'.obs;
//
//   // Form key and controllers
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController eventNameController = TextEditingController();
//   final TextEditingController eventdateController = TextEditingController();
//
//   // Observable properties
//   var selectedCategory = Rxn<String>();
//   var selectedCountry = Rxn<String>();
//   var selectedCity = Rxn<String>();
//   var isNotSureChecked = false.obs;
//   var isNotSureDate = false.obs;
//   var isReminderEnabled = false.obs;
//
//   // ValueNotifiers for country and city
//   final ValueNotifier<CountryModel> countryVN = ValueNotifier(CountryModel());
//   final ValueNotifier<CityModel> cityVN = ValueNotifier(CityModel());
//
//   // Global keys
//   final GlobalKey countryKey = GlobalKey();
//   final GlobalKey cityKey = GlobalKey();
//
//   // Validation error messages
//   var countryError = Rxn<String>();
//   var cityError = Rxn<String>();
//
//   // Event categories list
//   final List<String> eventCategories = [
//     'Conference',
//     'Workshop',
//     'Seminar',
//     'Meeting',
//     'Concert',
//     'Exhibition',
//     'Party',
//     'Sports',
//     'Other',
//   ];
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Add listeners
//     countryVN.addListener(() {
//       selectedCountry.value = countryVN.value.name;
//       countryError.value = null;
//       // Reset city when country changes
//       selectedCity.value = null;
//       cityVN.value = CityModel();
//     });
//
//     cityVN.addListener(() {
//       selectedCity.value = cityVN.value.name;
//       cityError.value = null;
//     });
//   }
//
//   // Methods
//   void selectPromotionPlan(String plan) {
//     selectedPromotionPlan.value = plan;
//   }
//
//   void selectPaymentMethod(String method) {
//     selectedPaymentMethod.value = method;
//   }
//
//   void updateCategory(String? category) {
//     selectedCategory.value = category;
//   }
//
//   void toggleNotSureLocation(bool value) {
//     isNotSureChecked.value = value;
//     if (value) {
//       countryError.value = null;
//       cityError.value = null;
//     }
//   }
//
//   void toggleNotSureDate(bool value) {
//     isNotSureDate.value = value;
//   }
//
//   void toggleReminder(bool value) {
//     isReminderEnabled.value = value;
//     print('Toggle changed: $value');
//   }
//
//   bool validateForm() {
//     bool isValid = true;
//
//     // Validate form fields
//     if (!formKey.currentState!.validate()) {
//       isValid = false;
//     }
//
//     // Validate country if "Not sure" is not checked
//     if (!isNotSureChecked.value) {
//       final countryValidation = _validateCountry(selectedCountry.value);
//       if (countryValidation != null) {
//         countryError.value = countryValidation;
//         isValid = false;
//       }
//
//       // Validate city if "Not sure" is not checked
//       final cityValidation = _validateCity(selectedCity.value);
//       if (cityValidation != null) {
//         cityError.value = cityValidation;
//         isValid = false;
//       }
//     }
//
//     // Validate date if "Not sure" is not checked
//     if (!isNotSureDate.value && eventdateController.text.isEmpty) {
//       isValid = false;
//     }
//
//     return isValid;
//   }
//
//   String? _validateCountry(String? country) {
//     if (country == null || country.isEmpty) {
//       return 'Please select a country';
//     }
//     return null;
//   }
//
//   String? _validateCity(String? city) {
//     if (city == null || city.isEmpty) {
//       return 'Please select a city';
//     }
//     return null;
//   }
//
//   void handlePayment() {
//     print('Selected Plan: ${selectedPromotionPlan.value}');
//     print('Selected Payment Method: ${selectedPaymentMethod.value}');
//   }
//
//   void createEvent() {
//     if (validateForm()) {
//       print('Event Name: ${eventNameController.text}');
//       print('Category: ${selectedCategory.value}');
//       print('Country: ${selectedCountry.value}');
//       print('City: ${selectedCity.value}');
//       print('Date: ${eventdateController.text}');
//       print('Not Sure Location: ${isNotSureChecked.value}');
//       print('Not Sure Date: ${isNotSureDate.value}');
//       print('Reminder: ${isReminderEnabled.value}');
//     } else {
//       print('Form validation failed');
//     }
//   }
//
//   @override
//   void onClose() {
//     eventNameController.dispose();
//     eventdateController.dispose();
//     countryVN.dispose();
//     cityVN.dispose();
//     super.onClose();
//   }
// }
import 'dart:io';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  // Existing properties
  var selectedPromotionPlan = '7day'.obs;
  var selectedPaymentMethod = 'paypal'.obs;

  // Form key and controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventdateController = TextEditingController();

  // Observable properties
  var selectedCategory = Rxn<String>();
  var selectedCountry = Rxn<String>();
  var selectedCity = Rxn<String>();
  var isNotSureChecked = false.obs;
  var isNotSureDate = false.obs;
  var isReminderEnabled = false.obs;

  // Image selection property
  final Rx<File?> selectedEventImage = Rx<File?>(null);

  // ValueNotifiers for country and city
  final ValueNotifier<CountryModel> countryVN = ValueNotifier(CountryModel());
  final ValueNotifier<CityModel> cityVN = ValueNotifier(CityModel());

  // Global keys
  final GlobalKey countryKey = GlobalKey();
  final GlobalKey cityKey = GlobalKey();

  // Validation error messages
  var countryError = Rxn<String>();
  var cityError = Rxn<String>();

  // Event categories list
  final List<String> eventCategories = [
    'Conference',
    'Workshop',
    'Seminar',
    'Meeting',
    'Concert',
    'Exhibition',
    'Party',
    'Sports',
    'Other',
  ];

  @override
  void onInit() {
    super.onInit();

    // Add listeners
    countryVN.addListener(() {
      selectedCountry.value = countryVN.value.name;
      countryError.value = null;
      // Reset city when country changes
      selectedCity.value = null;
      cityVN.value = CityModel();
    });

    cityVN.addListener(() {
      selectedCity.value = cityVN.value.name;
      cityError.value = null;
    });
  }

  // Methods
  void selectPromotionPlan(String plan) {
    selectedPromotionPlan.value = plan;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void updateCategory(String? category) {
    selectedCategory.value = category;
  }

  void toggleNotSureLocation(bool value) {
    isNotSureChecked.value = value;
    if (value) {
      countryError.value = null;
      cityError.value = null;
    }
  }

  void toggleNotSureDate(bool value) {
    isNotSureDate.value = value;
  }

  void toggleReminder(bool value) {
    isReminderEnabled.value = value;
    print('Toggle changed: $value');
  }

  // Method to set event image
  void setEventImage(File? image) {
    selectedEventImage.value = image;
  }

  // Method to remove event image
  void removeEventImage() {
    selectedEventImage.value = null;
  }

  bool validateForm() {
    bool isValid = true;

    // Validate form fields
    if (!formKey.currentState!.validate()) {
      isValid = false;
    }

    // Validate country if "Not sure" is not checked
    if (!isNotSureChecked.value) {
      final countryValidation = _validateCountry(selectedCountry.value);
      if (countryValidation != null) {
        countryError.value = countryValidation;
        isValid = false;
      }

      // Validate city if "Not sure" is not checked
      final cityValidation = _validateCity(selectedCity.value);
      if (cityValidation != null) {
        cityError.value = cityValidation;
        isValid = false;
      }
    }

    // Validate date if "Not sure" is not checked
    if (!isNotSureDate.value && eventdateController.text.isEmpty) {
      isValid = false;
    }

    return isValid;
  }

  String? _validateCountry(String? country) {
    if (country == null || country.isEmpty) {
      return 'Please select a country';
    }
    return null;
  }

  String? _validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'Please select a city';
    }
    return null;
  }

  void handlePayment() {
    print('Selected Plan: ${selectedPromotionPlan.value}');
    print('Selected Payment Method: ${selectedPaymentMethod.value}');
  }

  void createEvent() {
    if (validateForm()) {
      print('Event Name: ${eventNameController.text}');
      print('Category: ${selectedCategory.value}');
      print('Country: ${selectedCountry.value}');
      print('City: ${selectedCity.value}');
      print('Date: ${eventdateController.text}');
      print('Not Sure Location: ${isNotSureChecked.value}');
      print('Not Sure Date: ${isNotSureDate.value}');
      print('Reminder: ${isReminderEnabled.value}');
      print('Event Image: ${selectedEventImage.value?.path ?? "No image selected"}');
    } else {
      print('Form validation failed');
    }
  }

  // Method to reset form
  void resetForm() {
    eventNameController.clear();
    eventdateController.clear();
    selectedCategory.value = null;
    selectedCountry.value = null;
    selectedCity.value = null;
    isNotSureChecked.value = false;
    isNotSureDate.value = false;
    isReminderEnabled.value = false;
    selectedEventImage.value = null;
    countryError.value = null;
    cityError.value = null;
  }

  @override
  void onClose() {
    eventNameController.dispose();
    eventdateController.dispose();
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }
}