// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CreateNewPasswordController extends GetxController {
//   // Form key
//   final formKey = GlobalKey<FormState>();
//
//   // Text editing controllers
//   final newPasswordController = TextEditingController();
//   final confirmNewPasswordController = TextEditingController();
//
//   // Observable password text (for reactive rebuilds)
//   var passwordText = ''.obs;
//
//   // Observable variables for password visibility
//   var obscureNewPassword = true.obs;
//   var obscureConfirmNewPassword = true.obs;
//
//   // Observable variables for password validation
//   var hasMinLength = false.obs;
//   var hasUppercase = false.obs;
//   var hasLowercase = false.obs;
//   var hasNumber = false.obs;
//   var hasSpecialChar = false.obs;
//
//   // Password strength level (0-5)
//   var passwordStrength = 0.obs;
//
//   // Loading state
//   var isLoading = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Add listener to password controller for real-time validation
//     newPasswordController.addListener(() {
//       passwordText.value = newPasswordController.text;
//       validatePassword();
//     });
//   }
//
//   @override
//   void onClose() {
//     newPasswordController.dispose();
//     confirmNewPasswordController.dispose();
//     super.onClose();
//   }
//
//   /// Toggle new password visibility
//   void toggleNewPasswordVisibility() {
//     obscureNewPassword.value = !obscureNewPassword.value;
//   }
//
//   /// Toggle confirm new password visibility
//   void toggleConfirmNewPasswordVisibility() {
//     obscureConfirmNewPassword.value = !obscureConfirmNewPassword.value;
//   }
//
//   /// Validate password requirements
//   void validatePassword() {
//     final password = newPasswordController.text;
//     hasMinLength.value = password.length >= 8;
//     hasUppercase.value = password.contains(RegExp(r'[A-Z]'));
//     hasLowercase.value = password.contains(RegExp(r'[a-z]'));
//     hasNumber.value = password.contains(RegExp(r'[0-9]'));
//     hasSpecialChar.value =
//         password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//     calculatePasswordStrength();
//   }
//
//   /// Calculate password strength (0–5)
//   void calculatePasswordStrength() {
//     int strength = 0;
//     if (hasMinLength.value) strength++;
//     if (hasUppercase.value) strength++;
//     if (hasLowercase.value) strength++;
//     if (hasNumber.value) strength++;
//     if (hasSpecialChar.value) strength++;
//     passwordStrength.value = strength;
//   }
//
//   /// Check if all requirements are met
//   bool arePasswordRequirementsMet() {
//     return hasMinLength.value &&
//         hasUppercase.value &&
//         hasLowercase.value &&
//         hasNumber.value &&
//         hasSpecialChar.value;
//   }
//
//   /// Create new password
//   Future<void> createNewPassword() async {
//     if (formKey.currentState!.validate()) {
//       if (passwordStrength.value < 3) {
//         Get.snackbar(
//           'Weak Password',
//           'Please create a stronger password (at least 3/5 requirements)',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.orange.withOpacity(0.1),
//           colorText: Colors.orange,
//           margin: const EdgeInsets.all(10),
//         );
//         return;
//       }
//
//       try {
//         isLoading.value = true;
//         await Future.delayed(const Duration(seconds: 2));
//         isLoading.value = false;
//
//         Get.snackbar(
//           'Success',
//           'Password updated successfully!',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green.withOpacity(0.1),
//           colorText: Colors.green,
//           margin: const EdgeInsets.all(10),
//         );
//
//         clearForm();
//       } catch (e) {
//         isLoading.value = false;
//         Get.snackbar(
//           'Error',
//           e.toString(),
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red.withOpacity(0.1),
//           colorText: Colors.red,
//           margin: const EdgeInsets.all(10),
//         );
//       }
//     }
//   }
//
//   /// Clear form
//   void clearForm() {
//     newPasswordController.clear();
//     confirmNewPasswordController.clear();
//     passwordText.value = '';
//     passwordStrength.value = 0;
//   }
// }
