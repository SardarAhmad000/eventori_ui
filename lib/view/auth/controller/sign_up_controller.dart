import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // Form key
  final formKey = GlobalKey<FormState>();

  // Text editing controllers
  // final firstNameController = TextEditingController();
  // final lastNameController = TextEditingController();
  // final emailSignUpController = TextEditingController();
  // final passwordSignUpController = TextEditingController();
  // final confirmPasswordController = TextEditingController();

  // Observable variables for password visibility
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  // Observable variables for password validation
  var samePassword = false.obs;
  var hasMinLength = false.obs;
  var hasUppercase = false.obs;
  var hasLowercase = false.obs;
  var hasNumber = false.obs;
  var hasSpecialChar = false.obs;

  // Loading state
  var isLoading = false.obs;

  @override
  // void onInit() {
  //   super.onInit();
  //   // Add listeners for real-time validation
  //   passwordSignUpController.addListener(() {
  //     validatePassword();
  //     checkPasswordsMatch();
  //   });
  //   confirmPasswordController.addListener(checkPasswordsMatch);
  // }

  // @override
  // void onClose() {
  //   // Dispose controllers
  //   firstNameController.dispose();
  //   lastNameController.dispose();
  //   emailSignUpController.dispose();
  //   passwordSignUpController.dispose();
  //   confirmPasswordController.dispose();
  //   super.onClose();
  // }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  /// Validate password requirements
  // void validatePassword() {
  //   final password = passwordSignUpController.text;
  //   hasMinLength.value = password.length >= 8;
  //   hasUppercase.value = password.contains(RegExp(r'[A-Z]'));
  //   hasLowercase.value = password.contains(RegExp(r'[a-z]'));
  //   hasNumber.value = password.contains(RegExp(r'[0-9]'));
  //   hasSpecialChar.value =
  //       password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  // }

  /// Check if confirm password matches the password
  // void checkPasswordsMatch() {
  //   samePassword.value =
  //       confirmPasswordController.text == passwordSignUpController.text &&
  //           confirmPasswordController.text.isNotEmpty;
  // }

  /// Check if all password requirements are met
  bool arePasswordRequirementsMet() {
    return hasMinLength.value &&
        hasUppercase.value &&
        hasLowercase.value &&
        hasNumber.value &&
        hasSpecialChar.value &&
        samePassword.value;
  }

  /// Calculate password strength value (0.0 to 1.0)
  double getPasswordStrength() {
    int criteriaCount = 0;
    if(samePassword.value) criteriaCount++;
    if (hasMinLength.value) criteriaCount++;
    if (hasUppercase.value) criteriaCount++;
    if (hasLowercase.value) criteriaCount++;
    if (hasNumber.value) criteriaCount++;
    if (hasSpecialChar.value) criteriaCount++;

    return criteriaCount / 6;
  }

  /// Get strength text based on criteria met
  String getPasswordStrengthText() {
    int criteriaCount = 0;
    if(samePassword.value) criteriaCount++;
    if (hasMinLength.value) criteriaCount++;
    if (hasUppercase.value) criteriaCount++;
    if (hasLowercase.value) criteriaCount++;
    if (hasNumber.value) criteriaCount++;
    if (hasSpecialChar.value) criteriaCount++;

    if (criteriaCount <= 0) return '0%';
    if (criteriaCount <= 1) return '10%';
    if (criteriaCount <= 2) return '30%';
    if (criteriaCount <= 3) return '40%';
    if (criteriaCount <= 4) return '50%';
    if (criteriaCount <= 5) return '70%';
    return '100%';
  }

  /// Get strength color based on criteria met
  Color getPasswordStrengthColor() {
    int criteriaCount = 0;
    if(samePassword.value) criteriaCount++;
    if (hasMinLength.value) criteriaCount++;
    if (hasUppercase.value) criteriaCount++;
    if (hasLowercase.value) criteriaCount++;
    if (hasNumber.value) criteriaCount++;
    if (hasSpecialChar.value) criteriaCount++;

    if (criteriaCount <= 1) return AppTheme.cyanColor;
    if (criteriaCount <= 2) return AppTheme.cyanColor;
    if (criteriaCount <= 3) return AppTheme.cyanColor;
    if (criteriaCount <= 4) return AppTheme.cyanColor;
    if (criteriaCount <= 5) return AppTheme.cyanColor;
    return AppTheme.cyanColor;
  }

  /// Sign up with email and password
  // Future<void> signUp() async {
  //   if (formKey.currentState!.validate()) {
  //     if (!arePasswordRequirementsMet()) {
  //       Get.snackbar(
  //         'Validation Error',
  //         'Please meet all password requirements',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red.withOpacity(0.1),
  //         colorText: AppTheme.redColor,
  //         margin: const EdgeInsets.all(10),
  //       );
  //       return;
  //     }
  //
  //     try {
  //       isLoading.value = true;
  //
  //       // TODO: Implement your sign up API call here
  //       // Example:
  //       // final response = await AuthService.signUp(
  //       //   firstName: firstNameController.text,
  //       //   lastName: lastNameController.text,
  //       //   email: emailSignUpController.text,
  //       //   password: passwordSignUpController.text,
  //       // );
  //
  //       // Simulate API call
  //       await Future.delayed(const Duration(seconds: 2));
  //
  //       isLoading.value = false;
  //
  //       // Show success message
  //       Get.snackbar(
  //         'Success',
  //         'Account created successfully!',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green.withOpacity(0.1),
  //         colorText: Colors.green,
  //         margin: const EdgeInsets.all(10),
  //       );
  //
  //       // Navigate to next screen
  //       // Get.offAllNamed(AppRoutes.homeScreen);
  //
  //       // Clear form
  //       clearForm();
  //     } catch (e) {
  //       isLoading.value = false;
  //       Get.snackbar(
  //         'Error',
  //         e.toString(),
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red.withOpacity(0.1),
  //         colorText: Colors.red,
  //         margin: const EdgeInsets.all(10),
  //       );
  //     }
  //   }
  // }

  // /// Sign up with Google
  // Future<void> signUpWithGoogle() async {
  //   try {
  //     isLoading.value = true;
  //
  //     // TODO: Implement Google sign-in
  //     // Example:
  //     // final result = await AuthService.signInWithGoogle();
  //
  //     await Future.delayed(const Duration(seconds: 2));
  //
  //     isLoading.value = false;
  //
  //     Get.snackbar(
  //       'Success',
  //       'Signed up with Google successfully!',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green.withOpacity(0.1),
  //       colorText: Colors.green,
  //       margin: const EdgeInsets.all(10),
  //     );
  //
  //     // Navigate to next screen
  //     // Get.offAllNamed(AppRoutes.homeScreen);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Error',
  //       'Google sign-up failed: ${e.toString()}',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red.withOpacity(0.1),
  //       colorText: Colors.red,
  //       margin: const EdgeInsets.all(10),
  //     );
  //   }
  // }

  // /// Sign up with Facebook
  // Future<void> signUpWithFacebook() async {
  //   try {
  //     isLoading.value = true;
  //
  //     // TODO: Implement Facebook sign-in
  //     // Example:
  //     // final result = await AuthService.signInWithFacebook();
  //
  //     await Future.delayed(const Duration(seconds: 2));
  //
  //     isLoading.value = false;
  //
  //     Get.snackbar(
  //       'Success',
  //       'Signed up with Facebook successfully!',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green.withOpacity(0.1),
  //       colorText: Colors.green,
  //       margin: const EdgeInsets.all(10),
  //     );
  //
  //     // Navigate to next screen
  //     // Get.offAllNamed(AppRoutes.homeScreen);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Error',
  //       'Facebook sign-up failed: ${e.toString()}',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red.withOpacity(0.1),
  //       colorText: Colors.red,
  //       margin: const EdgeInsets.all(10),
  //     );
  //   }
  // }

  // /// Sign up with Apple
  // Future<void> signUpWithApple() async {
  //   try {
  //     isLoading.value = true;
  //
  //     // TODO: Implement Apple sign-in
  //     // Example:
  //     // final result = await AuthService.signInWithApple();
  //
  //     await Future.delayed(const Duration(seconds: 2));
  //
  //     isLoading.value = false;
  //
  //     Get.snackbar(
  //       'Success',
  //       'Signed up with Apple successfully!',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.green.withOpacity(0.1),
  //       colorText: Colors.green,
  //       margin: const EdgeInsets.all(10),
  //     );
  //
  //     // Navigate to next screen
  //     // Get.offAllNamed(AppRoutes.homeScreen);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.snackbar(
  //       'Error',
  //       'Apple sign-up failed: ${e.toString()}',
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red.withOpacity(0.1),
  //       colorText: Colors.red,
  //       margin: const EdgeInsets.all(10),
  //     );
  //   }
  // }

  /// Navigate to login screen
  void navigateToLogin() {
    // Get.offNamed(AppRoutes.loginScreen);
    Get.back();
  }

  /// Clear all fields
  void clearForm() {
    // firstNameController.clear();
    // lastNameController.clear();
    // emailSignUpController.clear();
    // passwordSignUpController.clear();
    // confirmPasswordController.clear();
    hasMinLength.value = false;
    hasUppercase.value = false;
    hasLowercase.value = false;
    hasNumber.value = false;
    hasSpecialChar.value = false;
    samePassword.value = false;
  }
}