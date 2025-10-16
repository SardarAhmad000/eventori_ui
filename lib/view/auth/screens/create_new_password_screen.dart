import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppTheme/widgets/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_button.dart';
import '../../../constants/custom_textfield.dart';
import '../../../constants/custom_validators.dart';
import '../../onboarding/widgets/build_header.dart';
import '../controller/sign_up_controller.dart';
import '../widget/password_requirement_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final controller = Get.put(SignUpController());


  final passwordCreteNewController = TextEditingController();
  final confirmPasswordCreteNewController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomHeader(
                backgroundColor: AppTheme.whiteColor,
                arrowColor: AppTheme.blackColor,
                containerBackgroundColor: AppTheme.whiteColor,
                borderColor: AppTheme.backArrowBorderColor,
                showLogo: true,
              ),
              const SizedBox(height: 20),
              Text(
                'Create new password',
                style: AppTextStyle.TitleStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Create a strong new password to secure your account.',
                style: AppTextStyle.SubtitleStyle,
              ),
              const SizedBox(height: 32),

              // Password Field
              Obx(
                    () => CustomTextField(
                  controller: passwordCreteNewController,
                  hintText: 'Password',
                  prefixIcon: Image.asset(
                    AppAssets.lockIcon,
                    color: AppTheme.iconGreyColor,
                  ),
                  isObscure: controller.obscurePassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppTheme.iconGreyColor,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  validator: CustomValidator.password,
                  // onChanged: (value) => controller.validatePassword(),
                ),
              ),
              const SizedBox(height: 16),

              // Password Strength Label
              // Obx(
              //       () => Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Password Strength: ',
              //         style: AppTextStyle.strenghtTextStyle,
              //       ),
              //       Text(
              //         controller.getPasswordStrengthText(),
              //         style: AppTextStyle.strenghtTextStyle,
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 8),

              // Progress Bar
              // Obx(
              //       () => ClipRRect(
              //     borderRadius: BorderRadius.circular(4),
              //     child: LinearProgressIndicator(
              //       value: controller.getPasswordStrength(),
              //       backgroundColor: AppTheme.progressIndicatorColor,
              //       valueColor: AlwaysStoppedAnimation<Color>(
              //         controller.getPasswordStrengthColor(),
              //       ),
              //       minHeight: 8,
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),

              // // Password Requirements Checklist
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Same as Confirm Password',
              //     isValid: controller.samePassword.value,
              //   ),
              // ),
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Be at least 8 characters long',
              //     isValid: controller.hasMinLength.value,
              //   ),
              // ),
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Include at least 1 uppercase letter (A-Z)',
              //     isValid: controller.hasUppercase.value,
              //   ),
              // ),
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Include at least 1 lowercase letter (a-z)',
              //     isValid: controller.hasLowercase.value,
              //   ),
              // ),
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Include at least 1 number (0-9)',
              //     isValid: controller.hasNumber.value,
              //   ),
              // ),
              // Obx(
              //       () => PasswordRequirementWidget(
              //     text: 'Include at least 1 special character (! @ # \$ % ^ & *)',
              //     isValid: controller.hasSpecialChar.value,
              //   ),
              // ),
              const SizedBox(height: 24),

              // Confirm Password Field
              Obx(
                    () => CustomTextField(
                  controller: confirmPasswordCreteNewController,
                  hintText: 'Confirm Password',
                  prefixIcon: Image.asset(
                    AppAssets.lockIcon,
                    color: AppTheme.iconGreyColor,
                  ),
                  isObscure: controller.obscureConfirmPassword.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.obscureConfirmPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppTheme.iconGreyColor,
                    ),
                    onPressed: controller.toggleConfirmPasswordVisibility,
                  ),
                  validator: (value) => CustomValidator.confirmPassword(
                    value,
                    passwordCreteNewController.text,
                  ),
                  // onChanged: (value) => controller.validatePassword(),
                ),
              ),
              const SizedBox(height: 24),

              // Update Password Button
              CustomButton(
                Text: 'Update Password',
                width: double.infinity,
                height: 48,
                buttonColor: AppTheme.buttonCyanColor,
                textColor: Colors.white,
                textSize: 16,
                onTap: () {

                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}