import 'package:country_picker_bkb/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CompleteProfileVendorController extends GetxController{

  // Using ValueNotifier for compatibility with country_picker_bkb
  late final ValueNotifier<CountryModel> countryVN;
  late final ValueNotifier<CityModel> cityVN;

  // Filter State Management
  final Rx<String?> selectedCountry = Rx<String?>(null);
  final Rx<String?> selectedCity = Rx<String?>(null);

  final Rx<String?> selectedTravelAvailability = Rx<String?>(null);
  final Rx<String?> selectedPricingTier = Rx<String?>(null);
  final Rx<String?> selectedPreferredContact = Rx<String?>(null);

  var isReminderEnabled = false.obs;

  RxBool isAgeConfirmed = false.obs;
  RxBool isTermsAccepted = false.obs;






  void toggleReminder(bool value) {
    isReminderEnabled.value = value;
    print('Toggle changed: $value');
  }

  // Update Travel Availability
  void updateTravelAvailability(String availability) {
    selectedTravelAvailability.value = availability;
  }
  // Update Pricing Tier Availability
  void updatePricingTier(String pricing) {
    selectedPricingTier.value = pricing;
  }

  void updatePreferredContact(String pricing) {
    selectedPreferredContact.value = pricing;
  }

}