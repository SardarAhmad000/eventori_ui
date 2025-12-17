import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/custom_textfield.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_validators.dart';
import '../controller/profile_controller.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController oldPasswordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    ProfileController profileController = Get.find();

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
        bottom: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: 75,
              height: 6,
              decoration: BoxDecoration(
                color: AppTheme.slateGreyColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(900),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Change Password",
                    style: AppTextStyle.f20W600BColorTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Keep your account secure by updating your password",
                    style: AppTextStyle.f14W400SGColorTextStyle,
                  ),
                  const SizedBox(height: 24),
                  Obx(() => CustomTextField(
                    controller: oldPasswordController,
                    hintText: 'Enter Current Password',
                    prefixIcon: Image.asset(
                      AppAssets.lockIcon,
                      color: AppTheme.slateGreyColor,
                    ),
                    isObscure: profileController.obscureCurrentPassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        profileController.obscureCurrentPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.slateGreyColor,
                      ),
                      onPressed: profileController.toggleCurrentPasswordVisibility,
                    ),
                    validator: CustomValidator.password,
                  )),
                  const SizedBox(height: 16),
                  Obx(() => CustomTextField(
                    controller: newPasswordController,
                    hintText: 'New password',
                    prefixIcon: Image.asset(
                      AppAssets.lockIcon,
                      color: AppTheme.slateGreyColor,
                    ),
                    isObscure: profileController.obscureNewPassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        profileController.obscureNewPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.slateGreyColor,
                      ),
                      onPressed: profileController.toggleNewPasswordVisibility,
                    ),
                    validator: CustomValidator.newPassword,
                  )),
                  const SizedBox(height: 16),
                  Obx(() => CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm New password',
                    prefixIcon: Image.asset(
                      AppAssets.lockIcon,
                      color: AppTheme.slateGreyColor,
                    ),
                    isObscure: profileController.obscureConfirmPassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        profileController.obscureConfirmPassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppTheme.slateGreyColor,
                      ),
                      onPressed: profileController.toggleConfirmPasswordVisibility,
                    ),
                    validator: (value) => CustomValidator.confirmPassword(
                      value,
                      newPasswordController.text,
                    ),
                  )),
                  const SizedBox(height: 24),
                  CustomButton(
                    Text: 'Change Password',
                    textColor: AppTheme.whiteColor,
                    buttonColor: AppTheme.lightCyanColor,
                    onTap: () {
                      if (!formKey.currentState!.validate()) {
                        print("validator called");
                        return;
                      }
                      profileController.changePassword(
                        oldPasswordController.text,
                        newPasswordController.text,
                      );

                      print('=== Change Password Request ===');
                      print('Current Password: ${oldPasswordController.text}');
                      print('New Password: ${newPasswordController.text}');
                      print('Confirm Password: ${confirmPasswordController.text}');
                      print('===============================');

                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}