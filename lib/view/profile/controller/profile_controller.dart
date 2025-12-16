import 'dart:convert';

import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api_services/api_exceptions.dart';
import '../../../api_services/data_api.dart';
import '../../../services/shared_preferences/shared_preference.dart';
import '../../../utils/snackbar_util.dart';
import '../../auth/controller/base_controller.dart';

class ProfileController extends GetxController {
  // Observable variables
  RxString selectedCountry = ''.obs;
  RxBool allowNotifications = false.obs;

  // Text editing controllers
  final profileNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final phoneNoController = TextEditingController();


  final AuthPreference _authPreference = AuthPreference.instance;

  // Dropdown values
  RxString selectedGender = ''.obs;


  RxString accessToken = "".obs;
  final BaseController _baseController = BaseController.instance;

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


  // Methods
  void updateCountry(String country) {
    selectedCountry.value = country;
  }

  void toggleNotifications(bool value) {
    allowNotifications.value = value;
  }

  void updateGender(String? gender) {
    if (gender != null) {
      selectedGender.value = gender;
    }
  }

  void removeProfilePicture() {
    // Add your logic to remove profile picture
    print('Remove profile picture');
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

  void changePassword() {
    // Navigate to change password screen
    print('Change password');
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


  @override
  void onClose() {
    // Dispose controllers if needed
    // firstNameController.dispose();
    // emailController.dispose();
    // phoneNoController.dispose();
    super.onClose();
  }
}