// import 'package:eventori/view/auth/widgets/password_requirement_widget.dart';
// import 'package:flutter/material.dart';
// import '../../../AppTheme/widgets/app_theme.dart';
// import '../../../constants/aap_assets.dart';
// import '../../../constants/app_text_style.dart';
// import '../../../constants/custom_button.dart';
// import '../../../constants/custom_textfield.dart';
// import '../../../constants/custom_validators.dart';
// import '../../onboarding/widgets/build_header.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailSignUpController = TextEditingController();
//   final TextEditingController passwordSignUpController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   bool _obscurePassword = true;
//   bool _obscureConfirmPassword = true;
//   bool _hasMinLength = false;
//   bool _hasUppercase = false;
//   bool _hasLowercase = false;
//   bool _hasNumber = false;
//   bool _hasSpecialChar = false;
//
//   @override
//   void initState() {
//     super.initState();
//     passwordSignUpController.addListener(_validatePassword);
//   }
//
//   void _validatePassword() {
//     final password = passwordSignUpController.text;
//     setState(() {
//       _hasMinLength = password.length >= 8;
//       _hasUppercase = password.contains(RegExp(r'[A-Z]'));
//       _hasLowercase = password.contains(RegExp(r'[a-z]'));
//       _hasNumber = password.contains(RegExp(r'[0-9]'));
//       _hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//     });
//   }
//
//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailSignUpController.dispose();
//     passwordSignUpController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.whiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           children: [
//             const SizedBox(height: 16),
//             CustomHeader(
//               backgroundColor: AppTheme.whiteColor,
//               arrowColor: AppTheme.blackColor,
//               containerBackgroundColor: AppTheme.whiteColor,
//               borderColor: AppTheme.backArrowBorderColor,
//               showLogo: true,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Create your account',
//                         style: AppTextStyle.addProfileTitleStyle,
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Create your Eventori account to start planning, booking, or offering services.',
//                         style: AppTextStyle.addProfileSubtitleStyle,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomTextField(
//                         controller: firstNameController,
//                         hintText: 'First Name',
//                         prefixIcon: Image.asset(
//                           AppAssets.userIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         validator: CustomValidator.firstName,
//                       ),
//                       const SizedBox(height: 12),
//                       CustomTextField(
//                         controller: lastNameController,
//                         hintText: 'Last Name',
//                         prefixIcon: Image.asset(
//                           AppAssets.userIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         validator: CustomValidator.lastName,
//                       ),
//                       const SizedBox(height: 12),
//                       CustomTextField(
//                         controller: emailSignUpController,
//                         hintText: 'Email Address',
//                         prefixIcon: Image.asset(
//                           AppAssets.mailIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         validator: CustomValidator.email,
//                       ),
//                       const SizedBox(height: 12),
//                       CustomTextField(
//                         controller: passwordSignUpController,
//                         hintText: 'Password',
//                         prefixIcon: Image.asset(
//                           AppAssets.lockIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         isObscure: _obscurePassword,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscurePassword
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: AppTheme.iconGreyColor,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         validator: CustomValidator.password,
//                         onChanged: (value) => _validatePassword(),
//                       ),
//                       const SizedBox(height: 12),
//                       CustomTextField(
//                         controller: confirmPasswordController,
//                         hintText: 'Confirm Password',
//                         prefixIcon: Image.asset(
//                           AppAssets.lockIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         isObscure: _obscureConfirmPassword,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureConfirmPassword
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: AppTheme.iconGreyColor,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureConfirmPassword = !_obscureConfirmPassword;
//                             });
//                           },
//                         ),
//                         validator: (value) => CustomValidator.confirmPassword(
//                           value,
//                           passwordSignUpController.text,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       PasswordRequirementWidget(
//                         text: 'Be at least 8 characters long',
//                         isValid: _hasMinLength,
//                       ),
//                       PasswordRequirementWidget(
//                         text: 'Include at least 1 uppercase letter (A-Z)',
//                         isValid: _hasUppercase,
//                       ),
//                       PasswordRequirementWidget(
//                         text: 'Include at least 1 lowercase letter (a-z)',
//                         isValid: _hasLowercase,
//                       ),
//                       PasswordRequirementWidget(
//                         text: 'Include at least 1 number (0-9)',
//                         isValid: _hasNumber,
//                       ),
//                       PasswordRequirementWidget(
//                         text: 'Include at least 1 special character (! @ # \$ % ^ & *)',
//                         isValid: _hasSpecialChar,
//                       ),
//                       const SizedBox(height: 19),
//                       CustomButton(
//                         Text: 'Sign Up',
//                         height: 48,
//                         width: double.infinity,
//                         buttonColor: AppTheme.buttonColor,
//                         textColor: AppTheme.whiteColor,
//                         textSize: 16,
//                         onTap: () {
//                           if (_formKey.currentState!.validate()) {
//                             // Handle sign up logic
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text('Account created successfully!'),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           Expanded(
//                               child: Divider(color: AppTheme.dividerColor)),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               'Or Sign Up with',
//                               style: AppTextStyle.btwDividerTextStyle,
//                             ),
//                           ),
//                           Expanded(
//                               child: Divider(color: AppTheme.dividerColor)),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//                       CustomButton(
//                         Text: 'Sign up with Google',
//                         height: 48,
//                         width: double.infinity,
//                         buttonColor: AppTheme.whiteColor,
//                         textColor: AppTheme.blackColor,
//                         textSize: 14,
//                         borderColor: AppTheme.textfieldBorderColor,
//                         isAuth: true,
//                         isGoogle: true,
//                         iconPath: AppAssets.googleIcon,
//                         onTap: () {
//                         },
//                       ),
//                       const SizedBox(height: 12),
//                       CustomButton(
//                         Text: 'Sign up with Facebook',
//                         height: 48,
//                         width: double.infinity,
//                         buttonColor: AppTheme.whiteColor,
//                         textColor: AppTheme.blackColor,
//                         textSize: 14,
//                         borderColor: AppTheme.textfieldBorderColor,
//                         isAuth: true,
//                         iconPath: AppAssets.facebookIcon,
//                         onTap: () {
//
//                         },
//                       ),
//                       const SizedBox(height: 12),
//                       CustomButton(
//                         Text: 'Sign up with Apple',
//                         height: 48,
//                         width: double.infinity,
//                         buttonColor: AppTheme.whiteColor,
//                         textColor: AppTheme.blackColor,
//                         textSize: 14,
//                         borderColor: AppTheme.textfieldBorderColor,
//                         isAuth: true,
//                         iconPath: AppAssets.appleIcon,
//                         onTap: () {
//                           // Handle Apple sign up
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       Center(
//                         child: Padding(
//                           padding:
//                           const EdgeInsets.only(top: 20.0, bottom: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                   "Already have an account? ",
//                                   style: AppTextStyle.bottomtextStyle),
//                               GestureDetector(
//                                 onTap: () {
//                                   // Get.toNamed(AppRoutes.signUpScreen);
//                                 },
//                                 child: Text(
//                                   'Login',
//                                   style: AppTextStyle.bottomSignUptextStyle,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:eventori/view/auth/widget/password_requirement_widget.dart';
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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

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
                        style: AppTextStyle.addProfileTitleStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create your Eventori account to start planning, booking, or offering services.',
                        style: AppTextStyle.addProfileSubtitleStyle,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: controller.firstNameController,
                        hintText: 'First Name',
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.firstName,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: controller.lastNameController,
                        hintText: 'Last Name',
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.lastName,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: controller.emailSignUpController,
                        hintText: 'Email Address',
                        prefixIcon: Image.asset(
                          AppAssets.mailIcon,
                          color: AppTheme.iconGreyColor,
                        ),
                        validator: CustomValidator.email,
                      ),
                      const SizedBox(height: 12),
                      Obx(
                            () => CustomTextField(
                          controller: controller.passwordSignUpController,
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
                          onChanged: (value) => controller.validatePassword(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(
                            () => CustomTextField(
                          controller: controller.confirmPasswordController,
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
                                controller.passwordSignUpController.text,
                              ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(
                            () => PasswordRequirementWidget(
                          text: 'Confirm password is matched',
                          isValid: controller.samePassword.value,
                        ),
                      ),
                      Obx(
                            () => PasswordRequirementWidget(
                          text: 'Be at least 8 characters long',
                          isValid: controller.hasMinLength.value,
                        ),
                      ),
                      Obx(
                            () => PasswordRequirementWidget(
                          text: 'Include at least 1 uppercase letter (A-Z)',
                          isValid: controller.hasUppercase.value,
                        ),
                      ),
                      Obx(
                            () => PasswordRequirementWidget(
                          text: 'Include at least 1 lowercase letter (a-z)',
                          isValid: controller.hasLowercase.value,
                        ),
                      ),
                      Obx(
                            () => PasswordRequirementWidget(
                          text: 'Include at least 1 number (0-9)',
                          isValid: controller.hasNumber.value,
                        ),
                      ),
                      Obx(
                            () => PasswordRequirementWidget(
                          text:
                          'Include at least 1 special character (! @ # \$ % ^ & *)',
                          isValid: controller.hasSpecialChar.value,
                        ),
                      ),
                      const SizedBox(height: 19),
                      Obx(
                            () => controller.isLoading.value
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : CustomButton(
                          Text: 'Sign Up',
                          height: 48,
                          width: double.infinity,
                          buttonColor: AppTheme.buttonColor,
                          textColor: AppTheme.whiteColor,
                          textSize: 16,
                          onTap: controller.signUp,
                        ),
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
                        // onTap: controller.signUpWithGoogle,
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
                        // onTap: controller.signUpWithFacebook,
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
                        // onTap: controller.signUpWithApple,
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
                                onTap: controller.navigateToLogin,
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