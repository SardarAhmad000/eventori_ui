import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/custom_textfield.dart';
import '../../../constants/custom_validators.dart';
import '../../onboarding/widgets/build_header.dart';
import '../controller/auth_controller.dart';
import '../widget/password_requirement_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  AuthController authController = Get.find();

  final newPasswordController = TextEditingController();
  final newConfirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  @override
  void initState() {
    super.initState();

    // Defer clearCreateNewPasswordForm() to after build phase completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.clearCreateNewPasswordForm();
    });

    // Add listeners for real-time validation
    newPasswordController.addListener(() {
      authController.validateCreateNewPassword(newPasswordController.text);
      authController.checkCreateNewPasswordsMatch(
        newPasswordController.text,
        newConfirmPasswordController.text,
      );
    });

    newConfirmPasswordController.addListener(() {
      authController.checkCreateNewPasswordsMatch(
        newPasswordController.text,
        newConfirmPasswordController.text,
      );
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    newConfirmPasswordController.dispose();
    super.dispose();
  }

  /// Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  /// Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  /// Check if all password fields are filled
  bool areAllPasswordFieldsFilled() {
    return newPasswordController.text.trim().isNotEmpty &&
        newConfirmPasswordController.text.trim().isNotEmpty;
  }

  /// Print password information
  void printPasswordInformation() {
    print('========== New Password Information ==========');
    print('Password: ${newPasswordController.text}');
    print('Confirm Password: ${newConfirmPasswordController.text}');
    print('==============================================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CustomHeader(
                  backgroundColor: AppTheme.whiteColor,
                  arrowColor: AppTheme.blackColor,
                  containerBackgroundColor: AppTheme.whiteColor,
                  borderColor: AppTheme.lightGrayishColor,
                  showLogo: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'Create new password',
                  style: AppTextStyle.f32W600DPColorTextStyle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Create a strong new password to secure your account.',
                  style: AppTextStyle.f16W400SIColorTextStyle,
                ),
                const SizedBox(height: 32),

                // Password Field
                Obx(
                      () => CustomTextField(
                        controller: newPasswordController,
                        hintText: 'Password',
                        isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.lockIcon,
                          color: AppTheme.silverColor,
                        ),
                        isObscure: obscurePassword.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppTheme.silverColor,
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                        validator: CustomValidator.password,
                      ),
                ),
                const SizedBox(height: 16),

                // Password Strength Label
                Obx(
                      () => Row(
                    children: [
                      Text(
                        'Password Strength: ',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      Text(
                        authController.getCreateNewPasswordStrengthText(),
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Progress Bar
                Obx(
                      () => ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: authController.getPasswordStrength(),
                      backgroundColor: AppTheme.lightGrayishColor,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        authController.getPasswordStrengthColor(),
                      ),
                      minHeight: 8,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password Requirements Checklist
                Obx(
                      () => PasswordRequirementWidget(
                    text: 'Same as Confirm Password',
                    isValid: authController.createPasswordSamePassword.value,
                  ),
                ),
                Obx(
                      () => PasswordRequirementWidget(
                    text: 'Be at least 8 characters long',
                    isValid: authController.createPasswordHasMinLength.value,
                  ),
                ),
                Obx(
                      () => PasswordRequirementWidget(
                    text: 'Include at least 1 uppercase letter (A-Z)',
                    isValid: authController.createPasswordHasUppercase.value,
                  ),
                ),
                Obx(
                      () => PasswordRequirementWidget(
                    text: 'Include at least 1 lowercase letter (a-z)',
                    isValid: authController.createPasswordHasLowercase.value,
                  ),
                ),
                Obx(
                      () => PasswordRequirementWidget(
                    text: 'Include at least 1 number (0-9)',
                    isValid: authController.createPasswordHasNumber.value,
                  ),
                ),
                Obx(
                      () => PasswordRequirementWidget(
                    text:
                    'Include at least 1 special character (! @ # \$ % ^ & *)',
                    isValid: authController.createPasswordHasSpecialChar.value,
                  ),
                ),
                const SizedBox(height: 24),

                // Confirm Password Field
                Obx(
                      () => CustomTextField(
                        controller: newConfirmPasswordController,
                        hintText: 'Confirm Password',
                        isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.lockIcon,
                          color: AppTheme.silverColor,
                        ),
                        isObscure: obscureConfirmPassword.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                        obscureConfirmPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.silverColor,
                      ),
                          onPressed: toggleConfirmPasswordVisibility,
                        ),
                        validator: (value) => CustomValidator.confirmPassword(
                      value,
                      newPasswordController.text,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Update Password Button
                CustomButton(
                  Text: 'Update Password',
                  width: double.infinity,
                  height: 48,
                  buttonColor: AppTheme.lightCyanColor,
                  textColor: AppTheme.whiteColor,
                  textSize: 16,
                  onTap: () {
                    // // Check if all fields are filled
                    // if (!areAllPasswordFieldsFilled()) {
                    //   Get.snackbar(
                    //     "Validation Error",
                    //     "Please fill all password fields",
                    //     snackPosition: SnackPosition.BOTTOM,
                    //     backgroundColor: AppTheme.redColor,
                    //     colorText: AppTheme.whiteColor,
                    //   );
                    //   return;
                    // }

                    // Validate form
                    if (formKey.currentState!.validate()) {

                      if (authController.areCreateNewPasswordRequirementsMet()) {
                        printPasswordInformation();
                        // Get.toNamed(AppRoutes.loginScreen);
                        Get.back();
                      } else {

                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}