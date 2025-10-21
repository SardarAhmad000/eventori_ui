import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'package:get/get.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_button.dart';
import '../../../constants/custom_textfield.dart';
import '../../../constants/custom_validators.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // void _sendEmailCode() {
  //   final email = _emailController.text.trim();
  //   if (email.isNotEmpty) {
  //     Get.toNamed(AppRoutes.verifyOTPScreen, arguments: {'email': email});
  //   }
  // }


  void _sendEmailCode() {
    // if (_formKey.currentState!.validate())
    // {
      print('Email: ${_emailController.text}');
      Get.toNamed(AppRoutes.verifyOTPScreen);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: _formKey,
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
                'Forgot Password',
                style: AppTextStyle.TitleStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email address to receive reset instructions.',
                style: AppTextStyle.SubtitleStyle,
              ),
              const SizedBox(height: 32),

              CustomTextField(
                controller: _emailController,
                hintText: 'Email Address',
                prefixIcon: Image.asset(
                  AppAssets.mailIcon,
                  color: AppTheme.silverColor,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: CustomValidator.email,
              ),
              const SizedBox(height: 24),

              CustomButton(
                Text: 'Send email code',
                width: double.infinity,
                height: 48,
                buttonColor: AppTheme.lightCyanColor,
                textColor: AppTheme.whiteColor,
                textSize: 16,
                onTap: (){

                  print('Email: ${_emailController.text}');
                  Get.toNamed(AppRoutes.verifyOTPScreen);

                },
                // onTap: _sendEmailCode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}