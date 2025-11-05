import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // Observable variables
  RxString selectedCountry = ''.obs;
  RxBool allowNotifications = false.obs;

  // Text editing controllers
  final profileNameController = TextEditingController();
  final profileEmailController = TextEditingController();
  final phoneNoController = TextEditingController();

  // Dropdown values
  RxString selectedGender = ''.obs;

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
    // Add your logout logic
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

  void deleteAccount() {
    // Add your delete account logic
    print('Delete account');
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