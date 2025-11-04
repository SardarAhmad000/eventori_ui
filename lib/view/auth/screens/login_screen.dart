import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/app_widgets/custom_button.dart';
import 'package:eventori/app_widgets/custom_textfield.dart';
import 'package:eventori/view/onboarding/widgets/build_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../constants/custom_validators.dart';
import '../../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in',
                        style: AppTextStyle.f32W600DPColorTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Welcome back! Please sign in to continue.',
                        style: AppTextStyle.f16W400SIColorTextStyle,
                      ),
                      const SizedBox(height: 12),

                      CustomTextField(
                        controller: loginEmailController,
                        hintText: 'Email Address',
                        isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.mailIcon,
                          color: AppTheme.silverColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: CustomValidator.email,
                      ),
                      const SizedBox(height: 12),

                      CustomTextField(
                        controller: loginPasswordController,
                        hintText: 'Password',
                        isRequired: true,
                        prefixIcon: Image.asset(
                          AppAssets.lockIcon,
                          color: AppTheme.silverColor,
                        ),
                        isObscure: _obscurePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppTheme.silverColor,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        validator: CustomValidator.password,
                      ),
                      const SizedBox(height: 8,),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.forgotPasswordScreen);
                          },
                          child: Text(
                            'Forgot password',
                            style: AppTextStyle.f14W400LCColorTextStyle,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8,),

                      CustomButton(
                        Text: 'Login',
                        width: double.infinity,
                        height: 48,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        textSize: 16,
                        onTap: () {
                          Get.toNamed(AppRoutes.verifyAccountScreen);
                          // if (_formKey.currentState!.validate()) {
                            print('Email: ${loginEmailController.text}');
                            print('Password: ${loginPasswordController.text}');

                          // }
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
                              'Or Sign in with',
                              style: AppTextStyle.font14W400SGColorTextStyle,
                            ),
                          ),
                          Expanded(
                              child: Divider(color: AppTheme.dividerColor)),
                        ],
                      ),

                      const SizedBox(height: 10),

                      CustomButton(
                        Text: 'Sign in with Google',
                        height: 48,
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
                        Text: 'Sign in with Facebook',
                        width: double.infinity,
                        height: 48,
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
                        Text: 'Sign in with Apple',
                        width: double.infinity,
                        height: 48,
                        buttonColor: AppTheme.whiteColor,
                        textColor: AppTheme.blackColor,
                        textSize: 14,
                        borderColor: AppTheme.textfieldBorderColor,
                        isAuth: true,
                        iconPath: AppAssets.appleIcon,
                        onTap: () {},
                      ),

                      const SizedBox(height: 30),

                      Center(
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Don't have an account? ",
                                  style: AppTextStyle.font16W400DPColorTextStyle),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.signUpScreen);
                                },
                                child: Text(
                                  'Sign up',
                                  style: AppTextStyle.f16W400LCColorTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
