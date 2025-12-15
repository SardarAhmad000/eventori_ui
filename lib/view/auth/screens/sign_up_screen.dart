// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../AppTheme/widgets/app_theme.dart';
// import '../../../constants/aap_assets.dart';
// import '../../../constants/app_text_style.dart';
// import '../../../constants/custom_button.dart';
// import '../../../constants/custom_textfield.dart';
// import '../../../constants/custom_validators.dart';
// import '../../../routes/app_routes.dart';
// import '../../onboarding/widgets/build_header.dart';
// import '../controller/auth_controller.dart';
// import '../widget/password_requirement_widget.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   // Local TextEditingControllers
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordSignUpController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   final formKey = GlobalKey<FormState>();
//
//   // late final SignUpController controller;
//   AuthController authController=Get.find();
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Add listeners for real-time validation
//     passwordSignUpController.addListener(() {
//       authController.validatePassword(passwordSignUpController.text);
//       authController.checkPasswordsMatch(
//         passwordSignUpController.text,
//         confirmPasswordController.text,
//       );
//     });
//
//     confirmPasswordController.addListener(() {
//       authController.checkPasswordsMatch(
//         passwordSignUpController.text,
//         confirmPasswordController.text,
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
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
//              CustomHeader(
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
//                   key: formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Create your account', style: AppTextStyle.TitleStyle),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Create your Eventori account to start planning, booking, or offering services.',
//                         style: AppTextStyle.SubtitleStyle,
//                       ),
//                       const SizedBox(height: 20),
//
//                       // First Name
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
//
//                       // Last Name
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
//
//                       // Email
//                       CustomTextField(
//                         controller: emailController,
//                         hintText: 'Email Address',
//                         prefixIcon: Image.asset(
//                           AppAssets.mailIcon,
//                           color: AppTheme.iconGreyColor,
//                         ),
//                         validator: CustomValidator.email,
//                       ),
//                       const SizedBox(height: 12),
//
//                       // Password
//                       Obx(
//                             () => CustomTextField(
//                           controller: passwordSignUpController,
//                           hintText: 'Password',
//                           prefixIcon: Image.asset(
//                             AppAssets.lockIcon,
//                             color: AppTheme.iconGreyColor,
//                           ),
//                           isObscure: authController.obscurePassword.value,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               authController.obscurePassword.value
//                                   ? Icons.visibility_off_outlined
//                                   : Icons.visibility_outlined,
//                               color: AppTheme.iconGreyColor,
//                             ),
//                             onPressed: authController.togglePasswordVisibility,
//                           ),
//                           validator: CustomValidator.password,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//
//                       // Confirm Password
//                       Obx(
//                             () => CustomTextField(
//                           controller: confirmPasswordController,
//                           hintText: 'Confirm Password',
//                           prefixIcon: Image.asset(
//                             AppAssets.lockIcon,
//                             color: AppTheme.iconGreyColor,
//                           ),
//                           isObscure: authController.obscureConfirmPassword.value,
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               authController.obscureConfirmPassword.value
//                                   ? Icons.visibility_off_outlined
//                                   : Icons.visibility_outlined,
//                               color: AppTheme.iconGreyColor,
//                             ),
//                             onPressed:
//                             authController.toggleConfirmPasswordVisibility,
//                           ),
//                           validator: (value) => CustomValidator.confirmPassword(
//                             value,
//                             passwordSignUpController.text,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//
//                       // Password Requirements
//                       Obx(
//                             () => Column(
//                           children: [
//                             PasswordRequirementWidget(
//                                 text: 'Same as Confirm Password',
//                                 isValid: authController.samePassword.value),
//                             PasswordRequirementWidget(
//                                 text: 'Be at least 8 characters long',
//                                 isValid: authController.hasMinLength.value),
//                             PasswordRequirementWidget(
//                                 text: 'Include at least 1 uppercase letter (A-Z)',
//                                 isValid: authController.hasUppercase.value),
//                             PasswordRequirementWidget(
//                                 text: 'Include at least 1 lowercase letter (a-z)',
//                                 isValid: authController.hasLowercase.value),
//                             PasswordRequirementWidget(
//                                 text: 'Include at least 1 number (0-9)',
//                                 isValid: authController.hasNumber.value),
//                             PasswordRequirementWidget(
//                                 text:
//                                 'Include at least 1 special character (! @ # \$ % ^ & *)',
//                                 isValid: authController.hasSpecialChar.value),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 19),
//
//                       // Sign Up Button
//                       CustomButton(
//                         Text: 'Sign Up',
//                         height: 48,
//                         width: double.infinity,
//                         buttonColor: AppTheme.buttonColor,
//                         textColor: AppTheme.whiteColor,
//                         textSize: 16,
//                         onTap: () {
//                           if (formKey.currentState!.validate()) {
//                             if (authController.arePasswordRequirementsMet()) {
//                               // Call your signup API here
//                             } else {
//                               Get.snackbar(
//                                   "Error", "Please meet all password requirements");
//                             }
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Or Sign Up With Divider
//                       Row(
//                         children: [
//                           Expanded(child: Divider(color: AppTheme.dividerColor)),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               'Or Sign Up with',
//                               style: AppTextStyle.btwDividerTextStyle,
//                             ),
//                           ),
//                           Expanded(child: Divider(color: AppTheme.dividerColor)),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Google, Facebook, Apple Buttons
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
//                         onTap: () {},
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
//                         onTap: () {},
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
//                         onTap: () {},
//                       ),
//                       const SizedBox(height: 16),
//                       Center(
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 20.0, bottom: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text("Already have an account? ",
//                                   style: AppTextStyle.bottomtextStyle),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(AppRoutes.loginScreen);
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/custom_textfield.dart';
import '../../../constants/custom_validators.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';
import '../controller/auth_controller.dart';
import '../widget/password_requirement_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Local TextEditingControllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordSignUpController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();

    // Defer clearSignUpForm() to after build phase completes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.clearSignUpForm();
    });

    // Add listeners for real-time validation
    passwordSignUpController.addListener(() {
      authController.validateSignUpPassword(passwordSignUpController.text);
      authController.checkSignUpPasswordsMatch(
        passwordSignUpController.text,
        confirmPasswordController.text,
      );
    });

    confirmPasswordController.addListener(() {
      authController.checkSignUpPasswordsMatch(
        passwordSignUpController.text,
        confirmPasswordController.text,
      );
    });
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordSignUpController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }



  /// Check if all text fields are filled
  bool areAllFieldsFilled() {
    return firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        passwordSignUpController.text.trim().isNotEmpty &&
        confirmPasswordController.text.trim().isNotEmpty;
  }

  /// Print user information
  void printUserInformation() {
    print('========== User Sign Up Information ==========');
    print('First Name: ${firstNameController.text}');
    print('Last Name: ${lastNameController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordSignUpController.text}');
    print('Confirm Password: ${confirmPasswordController.text}');
    print('=============================================');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
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
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create your account', style: AppTextStyle.f32W600DPColorTextStyle),
                      const SizedBox(height: 8),
                      Text(
                        'Create your Eventori account to start planning, booking, or offering services.',
                        style: AppTextStyle.f16W400SIColorTextStyle,
                      ),
                      const SizedBox(height: 20),

                      // First Name
                      CustomTextField(
                        controller: firstNameController,
                        hintText: 'First Name',
                        // isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.firstName,
                      ),
                      const SizedBox(height: 12),

                      // Last Name
                      CustomTextField(
                        controller: lastNameController,
                        hintText: 'Last Name',
                        // isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.lastName,
                      ),
                      const SizedBox(height: 12),

                      // Email
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email Address',
                        // isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.mailIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.email,
                      ),
                      const SizedBox(height: 12),

                      // Password
                      Obx(
                            () => CustomTextField(
                              controller: passwordSignUpController,
                              hintText: 'Password',
                              // isRequired: true,
                              prefixIcon: Image.asset(
                                AppAssets.lockIcon,
                                color: AppTheme.silverColor,
                              ),
                              isObscure: authController.obscurePassword.value,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  authController.obscurePassword.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppTheme.silverColor,
                                ),
                                onPressed: authController.togglePasswordVisibility,
                              ),
                              validator: CustomValidator.password,
                            ),
                      ),
                      const SizedBox(height: 12),
                      // Confirm Password
                      Obx(
                            () => CustomTextField(
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              // isRequired: true,
                              prefixIcon: Image.asset(
                                AppAssets.lockIcon,
                                color: AppTheme.silverColor,
                              ),
                              isObscure: authController.obscureConfirmPassword.value, suffixIcon: IconButton(
                              icon: Icon(
                                authController.obscureConfirmPassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: AppTheme.silverColor,
                              ),
                              onPressed:
                              authController.toggleConfirmPasswordVisibility,
                            ),
                              validator: (value) => CustomValidator.confirmPassword(
                                value,
                                passwordSignUpController.text,
                              ),
                            ),
                      ),
                      const SizedBox(height: 12),
                      // Password Requirements
                      Obx(
                            () => Column(
                          children: [
                            PasswordRequirementWidget(
                                text: 'Same as Confirm Password',
                                isValid: authController.signUpSamePassword.value),
                            PasswordRequirementWidget(
                                text: 'Be at least 8 characters long',
                                isValid: authController.signUpHasMinLength.value),
                            PasswordRequirementWidget(
                                text: 'Include at least 1 uppercase letter (A-Z)',
                                isValid: authController.signUpHasUppercase.value),
                            PasswordRequirementWidget(
                                text: 'Include at least 1 lowercase letter (a-z)',
                                isValid: authController.signUpHasLowercase.value),
                            PasswordRequirementWidget(
                                text: 'Include at least 1 number (0-9)',
                                isValid: authController.signUpHasNumber.value),
                            PasswordRequirementWidget(
                                text:
                                'Include at least 1 special character (! @ # \$ % ^ & *)',
                                isValid: authController.signUpHasSpecialChar.value),
                          ],
                        ),
                      ),
                      const SizedBox(height: 19),

                      // Sign Up Button
                      CustomButton(
                        Text: 'Sign Up',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        textSize: 16,
                        onTap: () {

                          if (formKey.currentState!.validate()) {
                           if (authController.areSignUpPasswordRequirementsMet()) {
                             printUserInformation();
                             authController.signUpUser(firstNameController.text, lastNameController.text, emailController.text, passwordSignUpController.text, Get.arguments['role']);
                           }
                          }
                        },
                      ),
                      const SizedBox(height: 16),

                      // Or Sign Up With Divider
                      Row(
                        children: [
                          Expanded(
                              child: Divider(color: AppTheme.dividerColor)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or Sign Up with',
                              style: AppTextStyle.f14W400SGColorTextStyle,
                            ),
                          ),
                          Expanded(
                              child: Divider(color: AppTheme.dividerColor)),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Google, Facebook, Apple Buttons
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
                        onTap: () {},
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
                        onTap: () {},
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
                        onTap: () {},
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ",
                                  style: AppTextStyle.f16W400DPColorTextStyle),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.loginScreen);
                                },
                                child: Text(
                                  'Login',
                                  style: AppTextStyle.f16W400LCColorTextStyle,
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