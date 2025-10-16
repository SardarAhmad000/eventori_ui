import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppTheme/widgets/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_button.dart';
import '../../../constants/custom_textfield.dart';
import '../../../constants/custom_validators.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';
import '../controller/sign_up_controller.dart';
import '../widget/password_requirement_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final emailSignUpController = TextEditingController();
final passwordSignUpController = TextEditingController();
final confirmPasswordController = TextEditingController();


    // @override
    // void onInit() {
    //   super.onInit();
    //   // Add listeners for real-time validation
    //   passwordSignUpController.addListener(() {
    //     validatePassword();
    //     checkPasswordsMatch();
    //   });
    //   confirmPasswordController.addListener(checkPasswordsMatch);
    // }
    //
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

    // // Validate password requirements
    // void validatePassword() {
    // final password = passwordSignUpController.text;
    // hasMinLength.value = password.length >= 8;
    // hasUppercase.value = password.contains(RegExp(r'[A-Z]'));
    // hasLowercase.value = password.contains(RegExp(r'[a-z]'));
    // hasNumber.value = password.contains(RegExp(r'[0-9]'));
    // hasSpecialChar.value =
    // password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    // }

    // // Check if confirm password matches the password
    // void checkPasswordsMatch() {
    // samePassword.value =
    // confirmPasswordController.text == passwordSignUpController.text &&
    // confirmPasswordController.text.isNotEmpty;
    // }
    // void clearForm() {
    // firstNameController.clear();
    // lastNameController.clear();
    // emailSignUpController.clear();
    // passwordSignUpController.clear();
    // confirmPasswordController.clear();
    // }


    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
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
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create your account',
                        style: AppTextStyle.TitleStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create your Eventori account to start planning, booking, or offering services.',
                        style: AppTextStyle.SubtitleStyle,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: firstNameController,
                        hintText: 'First Name',
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.firstName,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: lastNameController,
                        hintText: 'Last Name',
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.lastName,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: emailSignUpController,
                        hintText: 'Email Address',
                        prefixIcon: Image.asset(
                          AppAssets.mailIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.email,
                      ),
                      const SizedBox(height: 12),
                      //Password
                      Obx(
                            () => CustomTextField(
                          controller: passwordSignUpController,
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
                      const SizedBox(height: 12),
                      //ConfirmPassword
                      Obx(
                            () => CustomTextField(
                          controller: confirmPasswordController,
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
                            onPressed:
                            controller.toggleConfirmPasswordVisibility,
                          ),
                          validator: (value) =>
                              CustomValidator.confirmPassword(
                                value,
                                passwordSignUpController.text,
                              ),
                        ),
                      ),
                      const SizedBox(height: 12),
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
                      //     text:
                      //     'Include at least 1 special character (! @ # \$ % ^ & *)',
                      //     isValid: controller.hasSpecialChar.value,
                      //   ),
                      // ),
                      const SizedBox(height: 19),
                      CustomButton(
                          Text: 'Sign Up',
                          height: 48,
                          width: double.infinity,
                          buttonColor: AppTheme.buttonColor,
                          textColor: AppTheme.whiteColor,
                          textSize: 16,
                          onTap: (){

                          },
                        ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(color: AppTheme.dividerColor)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or Sign Up with',
                              style: AppTextStyle.btwDividerTextStyle,
                            ),
                          ),
                          Expanded(
                              child: Divider(color: AppTheme.dividerColor)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        Text: 'Sign up with Google',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.whiteColor,
                        textColor: AppTheme.blackColor,
                        textSize: 14,
                        borderColor: AppTheme.textfieldBorderColor,
                        isAuth: true,
                        isGoogle: true,
                        iconPath: AppAssets.googleIcon,
                        onTap: (){},
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        Text: 'Sign up with Facebook',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.whiteColor,
                        textColor: AppTheme.blackColor,
                        textSize: 14,
                        borderColor: AppTheme.textfieldBorderColor,
                        isAuth: true,
                        iconPath: AppAssets.facebookIcon,
                        onTap: (){},
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        Text: 'Sign up with Apple',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.whiteColor,
                        textColor: AppTheme.blackColor,
                        textSize: 14,
                        borderColor: AppTheme.textfieldBorderColor,
                        isAuth: true,
                        iconPath: AppAssets.appleIcon,
                        onTap: (){},
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",
                                  style: AppTextStyle.bottomtextStyle),
                              GestureDetector(
                                onTap: (){
                                  Get.toNamed(AppRoutes.loginScreen);
                                },
                                child: Text(
                                  'Login',
                                  style: AppTextStyle.bottomSignUptextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}