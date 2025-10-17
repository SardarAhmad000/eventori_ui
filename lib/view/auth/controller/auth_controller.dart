// import 'dart:ui';
//
// import 'package:get/get.dart';
//
// import '../../../AppTheme/widgets/app_theme.dart';
//
// class AuthController extends GetxController {
//   // Reactive states
//   var obscurePassword = true.obs;
//   var obscureConfirmPassword = true.obs;
//
//   var samePassword = false.obs;
//   var hasMinLength = false.obs;
//   var hasUppercase = false.obs;
//   var hasLowercase = false.obs;
//   var hasNumber = false.obs;
//   var hasSpecialChar = false.obs;
//
//   var isLoading = false.obs;
//
//   /// Validate password requirements
//   void validatePassword(String password) {
//     hasMinLength.value = password.length >= 8;
//     hasUppercase.value = password.contains(RegExp(r'[A-Z]'));
//     hasLowercase.value = password.contains(RegExp(r'[a-z]'));
//     hasNumber.value = password.contains(RegExp(r'[0-9]'));
//     hasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//   }
//
//   /// Check if passwords match
//   void checkPasswordsMatch(String password, String confirmPassword) {
//     samePassword.value =
//         confirmPassword == password && confirmPassword.isNotEmpty;
//   }
//
//   /// Toggle visibility
//   void togglePasswordVisibility() {
//     obscurePassword.value = !obscurePassword.value;
//   }
//
//   void toggleConfirmPasswordVisibility() {
//     obscureConfirmPassword.value = !obscureConfirmPassword.value;
//   }
//
//   /// Check if all password requirements are met
//   bool arePasswordRequirementsMet() {
//     return hasMinLength.value &&
//         hasUppercase.value &&
//         hasLowercase.value &&
//         hasNumber.value &&
//         hasSpecialChar.value &&
//         samePassword.value;
//   }
//
//
// //
// // / Check if all password requirements are met
// //   bool arePasswordRequirementsMet() {
// //     return hasMinLength.value &&
// //         hasUppercase.value &&
// //         hasLowercase.value &&
// //         hasNumber.value &&
// //         hasSpecialChar.value &&
// //         samePassword.value;
// //   }
//
//   /// Calculate password strength value (0.0 to 1.0)
//   double getPasswordStrength() {
//     int criteriaCount = 0;
//     if(createPasswordSamePassword.value) criteriaCount++;
//     if (createPasswordHasMinLength.value) criteriaCount++;
//     if (createPasswordHasUppercase.value) criteriaCount++;
//     if (createPasswordHasLowercase.value) criteriaCount++;
//     if (createPasswordHasNumber.value) criteriaCount++;
//     if (createPasswordHasSpecialChar.value) criteriaCount++;
//
//     return criteriaCount / 6;
//   }
//
//
//
//   /// Get strength text based on criteria met
//   String getPasswordStrengthText() {
//     int criteriaCount = 0;
//     if(samePassword.value) criteriaCount++;
//     if (hasMinLength.value) criteriaCount++;
//     if (hasUppercase.value) criteriaCount++;
//     if (hasLowercase.value) criteriaCount++;
//     if (hasNumber.value) criteriaCount++;
//     if (hasSpecialChar.value) criteriaCount++;
//
//     if (criteriaCount <= 0) return '0%';
//     if (criteriaCount <= 1) return '10%';
//     if (criteriaCount <= 2) return '30%';
//     if (criteriaCount <= 3) return '40%';
//     if (criteriaCount <= 4) return '50%';
//     if (criteriaCount <= 5) return '70%';
//     return '100%';
//   }
//
//
// /// Get strength color based on criteria met
// Color getPasswordStrengthColor() {
//   int criteriaCount = 0;
//   if(createPasswordSamePassword.value) criteriaCount++;
//   if (createPasswordHasMinLength.value) criteriaCount++;
//   if (createPasswordHasUppercase.value) criteriaCount++;
//   if (createPasswordHasLowercase.value) criteriaCount++;
//   if (createPasswordHasNumber.value) criteriaCount++;
//   if (createPasswordHasSpecialChar.value) criteriaCount++;
//
//   if (criteriaCount <= 1) return AppTheme.cyanColor;
//   if (criteriaCount <= 2) return AppTheme.cyanColor;
//   if (criteriaCount <= 3) return AppTheme.cyanColor;
//   if (criteriaCount <= 4) return AppTheme.cyanColor;
//   if (criteriaCount <= 5) return AppTheme.cyanColor;
//   return AppTheme.cyanColor;
// }

//
//
//
//
//
//   void clearForm() {
//     hasMinLength.value = false;
//     hasUppercase.value = false;
//     hasLowercase.value = false;
//     hasNumber.value = false;
//     hasSpecialChar.value = false;
//     samePassword.value = false;
//   }
//
//
//
//
//
// }


import 'dart:ui';
import 'package:get/get.dart';
import '../../../AppTheme/widgets/app_theme.dart';

class AuthController extends GetxController {
  // SignUp Screen States
  var signUpSamePassword = false.obs;
  var signUpHasMinLength = false.obs;
  var signUpHasUppercase = false.obs;
  var signUpHasLowercase = false.obs;
  var signUpHasNumber = false.obs;
  var signUpHasSpecialChar = false.obs;

  // Create New Password Screen States
  var createPasswordSamePassword = false.obs;
  var createPasswordHasMinLength = false.obs;
  var createPasswordHasUppercase = false.obs;
  var createPasswordHasLowercase = false.obs;
  var createPasswordHasNumber = false.obs;
  var createPasswordHasSpecialChar = false.obs;

  // Password Visibility
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  var isLoading = false.obs;

  /// Validate SignUp password requirements
  void validateSignUpPassword(String password) {
    signUpHasMinLength.value = password.length >= 8;
    signUpHasUppercase.value = password.contains(RegExp(r'[A-Z]'));
    signUpHasLowercase.value = password.contains(RegExp(r'[a-z]'));
    signUpHasNumber.value = password.contains(RegExp(r'[0-9]'));
    signUpHasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  /// Validate CreateNewPassword password requirements
  void validateCreateNewPassword(String password) {
    createPasswordHasMinLength.value = password.length >= 8;
    createPasswordHasUppercase.value = password.contains(RegExp(r'[A-Z]'));
    createPasswordHasLowercase.value = password.contains(RegExp(r'[a-z]'));
    createPasswordHasNumber.value = password.contains(RegExp(r'[0-9]'));
    createPasswordHasSpecialChar.value = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  /// Check if SignUp passwords match
  void checkSignUpPasswordsMatch(String password, String confirmPassword) {
    signUpSamePassword.value = confirmPassword == password && confirmPassword.isNotEmpty;
  }

  /// Check if CreateNewPassword passwords match
  void checkCreateNewPasswordsMatch(String password, String confirmPassword) {
    createPasswordSamePassword.value = confirmPassword == password && confirmPassword.isNotEmpty;
  }

  /// Toggle visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  /// Check if all SignUp password requirements are met
  bool areSignUpPasswordRequirementsMet() {
    return signUpHasMinLength.value &&
        signUpHasUppercase.value &&
        signUpHasLowercase.value &&
        signUpHasNumber.value &&
        signUpHasSpecialChar.value &&
        signUpSamePassword.value;
  }

  /// Check if all CreateNewPassword password requirements are met
  bool areCreateNewPasswordRequirementsMet() {
    return createPasswordHasMinLength.value &&
        createPasswordHasUppercase.value &&
        createPasswordHasLowercase.value &&
        createPasswordHasNumber.value &&
        createPasswordHasSpecialChar.value &&
        createPasswordSamePassword.value;
  }

  /// Calculate CreateNewPassword strength (0.0 to 1.0)
  double getCreateNewPasswordStrength() {
    int criteriaCount = 0;
    if (createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;
    return criteriaCount / 6;
  }


  /// Get CreateNewPassword strength text
  String getCreateNewPasswordStrengthText() {
    int criteriaCount = 0;
    if (createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;

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
    return AppTheme.cyanColor;
  }

  /// Clear all SignUp form fields
  void clearSignUpForm() {
    signUpHasMinLength.value = false;
    signUpHasUppercase.value = false;
    signUpHasLowercase.value = false;
    signUpHasNumber.value = false;
    signUpHasSpecialChar.value = false;
    signUpSamePassword.value = false;
  }

  /// Clear all CreateNewPassword form fields
  void clearCreateNewPasswordForm() {
    createPasswordHasMinLength.value = false;
    createPasswordHasUppercase.value = false;
    createPasswordHasLowercase.value = false;
    createPasswordHasNumber.value = false;
    createPasswordHasSpecialChar.value = false;
    createPasswordSamePassword.value = false;
  }


  /// Calculate password strength value (0.0 to 1.0)
  double getPasswordStrength() {
    int criteriaCount = 0;
    if(createPasswordSamePassword.value) criteriaCount++;
    if (createPasswordHasMinLength.value) criteriaCount++;
    if (createPasswordHasUppercase.value) criteriaCount++;
    if (createPasswordHasLowercase.value) criteriaCount++;
    if (createPasswordHasNumber.value) criteriaCount++;
    if (createPasswordHasSpecialChar.value) criteriaCount++;

    return criteriaCount / 6;
  }


}





