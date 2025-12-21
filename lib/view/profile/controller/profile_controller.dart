import 'dart:convert';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_services/api_exceptions.dart';
import '../../../api_services/data_api.dart';
import '../../../constants/custom_validators.dart';
import '../../../models/user_model.dart';
import '../../../services/shared_preferences/shared_preference.dart';
import '../../../utils/snackbar_util.dart';
import '../../auth/controller/base_controller.dart';

class ProfileController extends GetxController {
  // Observable variables
  // RxString selectedCountry = ''.obs;
  // RxBool allowNotifications = false.obs;
  // Observable properties
  var selectedCategory = Rxn<String>();
  var selectedCountry = Rxn<String>();
  var selectedCity = Rxn<String>();
  // var isNotSureChecked = false.obs;


  // Text editing controllers
  // final profileNameController = TextEditingController();
  final editEmailController = TextEditingController();
  final editPhoneController = TextEditingController();
  final editLocationController = TextEditingController();




  // Global keys
  final GlobalKey countryKey = GlobalKey();
  final GlobalKey cityKey = GlobalKey();


  // ValueNotifiers for country and city
  final ValueNotifier<CountryModel> countryVN = ValueNotifier(CountryModel());
  final ValueNotifier<CityModel> cityVN = ValueNotifier(CityModel());


  // Validation error messages
  var countryError = Rxn<String>();
  var cityError = Rxn<String>();


  // Observable variables for password visibility
  var obscureCurrentPassword = true.obs;
  var obscureNewPassword = true.obs;
  var obscureConfirmPassword = true.obs;




  final AuthPreference _authPreference = AuthPreference.instance;
  // Dropdown values
  RxString selectedGender = ''.obs;
  RxString accessToken = "".obs;
  final BaseController _baseController = BaseController.instance;
  RxString selectedImage = ''.obs;



  Future updateProfile(String city, String country, String gender, String phoneNumber, String image) async {
    _baseController.showLoading();
    Map<String,String> body = {
      "country":country,
      "city":city,
      "gender":gender,
      "phoneNumber":phoneNumber,

    };
    var response;
     if(image.toString().startsWith('http')){
       response = await DataApiService.instance
           .post('user-profile', body)
           .catchError((error) {
         if (error is BadRequestException) {
           var apiError = json.decode(error.message!);
           print("object...");
           SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
         }
         else {
           print("objsaghect...");
           _baseController.handleError(error);
         }
       });
     }else{
       response = await DataApiService.instance
           .multiPartImage('user-profile',[image],'image', body)
           .catchError((error) {
         if (error is BadRequestException) {
           var apiError = json.decode(error.message!);
           print("object...");
           SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
         }
         else {
           print("objsaghect...");
           _baseController.handleError(error);
         }
       });
     }

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {
      print( 'Profile Updated Api Call');
      await Get.put(AuthController().getUserData());
      Get.offAllNamed(AppRoutes.navBarScreen);
      // print(AuthController().userData.value!.image.toString()+"image fro profile");
    }
    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }


  Future changePassword( String oldPassword,String newPassword,) async {
    _baseController.showLoading();
    Map<String, String> body = {
      "oldPassword": oldPassword,
      "newPassword" : newPassword
    };

    var response = await DataApiService.instance
        .post('/change-password', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true" && result['message']=="Password changed successfully") {
      Get.offAllNamed(AppRoutes.loginScreen);

    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future changeNotificationStatus(bool status) async {
    _baseController.showLoading();
    Map<String,String> body = {
      "status":status==true?"True":'False'
    };

    var response = await DataApiService.instance
        .post('/set-notification-status', body)
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print("object...");
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
        print("objsaghect...");
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {

      // print('Notofication Status Changed');

    }
    else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  Future deleteUser() async {
    _baseController.showLoading();
    var response = await DataApiService.instance
        .delete('/user/delete')
        .catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        print("object...");
        SnackbarUtil.showSnackbar(message: apiError.toString(), type: SnackbarType.error);
      }
      else {
        print("objsaghect...");
        _baseController.handleError(error);
      }
    });

    update();
    _baseController.hideLoading();
    if (response == null) return;
    print(response + " responded");
    var result = json.decode(response);
    print(result['message']);
    print(result['success']);
    if (result['success'].toString()=="true") {
      Get.offAllNamed(AppRoutes.loginScreen);

    } else if(result['status'].toString()=="failed"&&result['error'].toString()=="true"){
      String message = result['data']['message'];
      SnackbarUtil.showSnackbar(message: message, type: SnackbarType.error);
    }
  }

  // Add these methods to your ProfileController class

// Validate all fields
  bool validateFields() {
    bool isValid = true;

    // Validate country
    final countryValidationError = CustomValidator.country(selectedCountry.value);
    if (countryValidationError != null) {
      countryError.value = countryValidationError;
      isValid = false;
    } else {
      countryError.value = null;
    }

    // Validate city
    final cityValidationError = CustomValidator.city(selectedCity.value);
    if (cityValidationError != null) {
      cityError.value = cityValidationError;
      isValid = false;
    } else {
      cityError.value = null;
    }

    return isValid;
  }

// Clear all validation errors
  void clearValidationErrors() {
    countryError.value = null;
    cityError.value = null;
  }

// Method to call when country is selected (update your existing listener)
  void onCountrySelected() {
    // Clear country error when a valid selection is made
    if (selectedCountry.value != null && selectedCountry.value!.isNotEmpty) {
      countryError.value = null;
    }

    // Reset city when country changes
    selectedCity.value = null;
    cityVN.value = CityModel();
    cityError.value = null;
  }

// Method to call when city is selected (update your existing listener)
  void onCitySelected() {
    // Clear city error when a valid selection is made
    if (selectedCity.value != null && selectedCity.value!.isNotEmpty) {
      cityError.value = null;
    }
  }

// Updated onInit method
  @override
  void onInit() {
    super.onInit();

    // Add listeners
    countryVN.addListener(() {
      selectedCountry.value = countryVN.value.name;
      onCountrySelected();
      print('listener called');
    });

    cityVN.addListener(() {
      selectedCity.value = cityVN.value.name;
      onCitySelected();
    });
  }
  // @override
  // void onInit() {
  //   super.onInit();
  //
  //   // Add listeners
  //   countryVN.addListener(() {
  //     selectedCountry.value = countryVN.value.name;
  //     countryError.value = null;
  //     // Reset city when country changes
  //     selectedCity.value = null;
  //     cityVN.value = CityModel();
  //     print('lister called');
  //   });
  //
  //   cityVN.addListener(() {
  //     selectedCity.value = cityVN.value.name;
  //     cityError.value = null;
  //   });
  // }


  void updateCountry(String country) {
    selectedCountry.value = country;
  }


  void updateGender(String? gender) {
    if (gender != null) {
      selectedGender.value = gender;
    }
  }


  void uploadProfilePicture() {
    // Add your logic to upload profile picture
    print('Upload profile picture');
  }

  void editProfile() {
    // Add your logic to enable editing
    print('Edit profile');
  }

  void saveChanges() {
    // Add your logic to save changes
    print('Save changes');
  }

  void logout() {
    Get.offAllNamed(AppRoutes.loginScreen);
    _authPreference.setUserLoggedIn(false);
    print('Logout');
  }


  void openPrivacyPolicy() {
    // Navigate to privacy policy screen
    print('Privacy policy');
  }

  void openTermsAndConditions() {
    // Navigate to terms and conditions screen
    print('Terms and conditions');
  }

  void contactUs() {
    // Navigate to contact us screen
    print('Contact us');
  }

  void rateUs() {
    // Open rate us dialog or navigate to store
    print('Rate us');
  }

  // Toggle password visibility
  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword.value = !obscureCurrentPassword.value;
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }


  @override
  void onClose() {
    // Dispose controllers if needed
    // firstNameController.dispose();
    // emailController.dispose();
    // phoneNoController.dispose();
    countryVN.dispose();
    cityVN.dispose();
    super.onClose();
  }
}