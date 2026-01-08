import 'dart:convert';
import 'dart:io';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../../api_services/api_exceptions.dart';
import '../../../../../api_services/data_api.dart';
import '../../../../../utils/snackbar_util.dart';
import '../../../../auth/controller/base_controller.dart';

class CompleteProfileVendorController extends GetxController {
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
  // RxString selectedEventCategoryId = ''.obs;
  final Rx<String?> selectedEventCategory = Rx<String?>(null);
  final Rx<String?> selectedEventCategoryId = Rx<String?>(null);


  // final Rx<String?> selectedService = Rx<String?>(null);
  // final Rx<String?> selectedServiceId = Rx<String?>(null);

  var selectedServiceIds = <String>[].obs;
  var selectedServices = <dynamic>[].obs;


  RxList<String> teamMembers = <String>[].obs;

  var countryError = Rxn<String>();
  var cityError = Rxn<String>();

  final Rx<String?> selectedNotice = Rx<String?>(null);

  // Image and File picker variables
  Rx<File?> logo = Rx<File?>(null);
  RxList<File> portfolio = <File>[].obs;
  Rx<File?> businessDocument = Rx<File?>(null);
  RxString documentFileName = ''.obs;

  // NEW: Error state management for validation
  var documentError = Rxn<String>();
  var portfolioError = Rxn<String>();
  var logoError = Rxn<String>();
  var serviceDescriptionError = Rxn<String>();
  var travelSettingsError = Rxn<String>();
  var pricingTierError = Rxn<String>();
  var noticePeriodError = Rxn<String>();


  var preferredContactError = Rxn<String>();
  var ageConfirmationError = Rxn<String>();
  var termsAcceptanceError = Rxn<String>();

  final BaseController _baseController = BaseController.instance;


  RxString storedCompanyOwnerNameForReuse = ''.obs;
  RxString storedBusinessNameForReuse =''.obs;
  RxString storedOperatingAddressForReuse =''.obs;
  RxString storedCategoryForReuse =''.obs;
  RxString storedServicesProvidedForReuse =''.obs;
  RxString storedCountryForReuse =''.obs;
  RxString storedCityForReuse =''.obs;
  RxString storedServiceDescriptionForReuse =''.obs;
  RxString storedTravelSettingForReuse =''.obs;
  RxString storedPricingTierForReuse =''.obs;
  RxString storedAvailableNowForReuse =''.obs;
  RxString storedAvailabilityTimeForReuse =''.obs;
  RxString storedPreferredContactForReuse =''.obs;
  RxString storedTeamMembersForReuse =''.obs;
  RxString storedSocialLinksForReuse =''.obs;
  RxString storedNoticePeriodForReuse =''.obs;




  Future completeProfile() async {
    _baseController.showLoading();
    Map<String, String> body = {
      'companyOwnerName': storedCompanyOwnerNameForReuse.value,
      'businessName': storedBusinessNameForReuse.value,
      'operatingAddress': storedOperatingAddressForReuse.value,
      'category': storedCategoryForReuse.value,
      'servicesProvided': storedServicesProvidedForReuse.value,
      'country': storedCountryForReuse.value,
      'city': storedCityForReuse.value,
      'serviceDescription': storedServiceDescriptionForReuse.value,
      'travelSetting': storedTravelSettingForReuse.value,
      'pricingTier': storedPricingTierForReuse.value,
      'availableNow': 'false',
      'availabilityTime': storedAvailabilityTimeForReuse.value,
      'preferredContact': storedPreferredContactForReuse.value,
      'teamMembers': storedTeamMembersForReuse.value,
      'socialLinks': storedSocialLinksForReuse.value,
      'noticePeriod': storedNoticePeriodForReuse.value
    };
    print(body);
    // var  response = await DataApiService.instance
    //     .post('/complete-profile', body)
    //     .catchError((error) {
    //   if (error is BadRequestException) {
    //     var apiError = json.decode(error.message!);
    //     SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
    //   } else {
    //     _baseController.handleError(error);
    //   }
    // });

    update();
    _baseController.hideLoading();
    // if (response == null) return;
    // print(response + " responded");
    // var result = json.decode(response);
    // print(result['message']);
    // print(result['success']);
    //
    // if (result['success'].toString()=="true" && result['message']=="Successful") {
    //
    //
    // }
    //
    // else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
    //   String message = result['data']['message'];
    //   SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    // }
  }






  @override
  void onInit() {
    super.onInit();
    // Initialize the ValueNotifiers with empty models
    countryVN = ValueNotifier<CountryModel>(CountryModel());
    cityVN = ValueNotifier<CityModel>(CityModel());

    // Add listeners to update selected values
    countryVN.addListener(() {
      if (countryVN.value.name != null && countryVN.value.name!.isNotEmpty) {
        selectedCountry.value = countryVN.value.name;
        countryError.value = null;
        selectedCity.value = null;
        cityVN.value = CityModel();
      }
    });

    cityVN.addListener(() {
      if (cityVN.value.name != null && cityVN.value.name!.isNotEmpty) {
        selectedCity.value = cityVN.value.name;
        cityError.value = null;
      }
    });
  }

  @override
  void onClose() {
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }

  void toggleReminder(bool value) {
    isReminderEnabled.value = value;
    print('Toggle changed: $value');
  }

  void updateTravelAvailability(String availability) {
    selectedTravelAvailability.value = availability;
    travelSettingsError.value = null; // Clear error when selection is made
  }

  void updatePricingTier(String pricing) {
    selectedPricingTier.value = pricing;
    pricingTierError.value = null; // Clear error when selection is made
  }

  void updatePreferredContact(String pricing) {
    selectedPreferredContact.value = pricing;
  }

  void updateNotice(String? notice) {
    selectedNotice.value = notice;
    noticePeriodError.value = null; // Clear error when selection is made
  }

  void setLogoImage(File? image) {
    logo.value = image;
    if (image != null) {
      logoError.value = null; // Clear error when image is set
    }
  }

  void setDocumentFile(File? file, String fileName) {
    businessDocument.value = file;
    documentFileName.value = fileName;
    if (file != null) {
      documentError.value = null; // Clear error when document is set
    }
  }

  void setPortfolioImages(List<File> images) {
    if (images.length <= 6) {
      portfolio.value = images;
      if (images.isNotEmpty) {
        portfolioError.value = null; // Clear error when images are added
      }
    } else {
      portfolio.value = images.take(6).toList();
      Get.snackbar(
        'Image Limit',
        'Maximum 6 images allowed',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removePortfolioImage(int index) {
    portfolio.removeAt(index);
  }

  void clearAllImages() {
    logo.value = null;
    businessDocument.value = null;
    documentFileName.value = '';
    portfolio.clear();
  }

  // NEW: Clear all validation errors
  void clearAllErrors() {
    documentError.value = null;
    portfolioError.value = null;
    logoError.value = null;
    serviceDescriptionError.value = null;
    travelSettingsError.value = null;
    pricingTierError.value = null;
    noticePeriodError.value = null;
  }

  // NEW: Validate all identity verification fields
  bool validateIdentityVerification(String serviceDescription) {
    clearAllErrors();
    bool isValid = true;

    // Validate document
    if (businessDocument.value == null) {
      documentError.value = 'Please upload a document (PDF)';
      isValid = false;
    }

    // Validate portfolio
    if (portfolio.isEmpty) {
      portfolioError.value = 'Please upload at least one portfolio image';
      isValid = false;
    }

    // Validate logo
    if (logo.value == null) {
      logoError.value = 'Please upload a logo';
      isValid = false;
    }

    // Validate service description
    if (serviceDescription.trim().isEmpty) {
      serviceDescriptionError.value = 'Service description is required';
      isValid = false;
    } else if (serviceDescription.trim().length < 20) {
      serviceDescriptionError.value = 'Description must be at least 20 characters';
      isValid = false;
    } else if (serviceDescription.trim().length > 500) {
      serviceDescriptionError.value = 'Description cannot exceed 500 characters';
      isValid = false;
    }

    // Validate travel settings
    if (selectedTravelAvailability.value == null ||
        selectedTravelAvailability.value!.isEmpty) {
      travelSettingsError.value = 'Please select a travel setting';
      isValid = false;
    }

    // Validate pricing tier
    if (selectedPricingTier.value == null ||
        selectedPricingTier.value!.isEmpty) {
      pricingTierError.value = 'Please select a pricing tier';
      isValid = false;
    }

    // Validate notice period
    if (selectedNotice.value == null || selectedNotice.value!.isEmpty) {
      noticePeriodError.value = 'Please select a notice period';
      isValid = false;
    }

    return isValid;
  }
}