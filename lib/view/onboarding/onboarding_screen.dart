import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/onboarding/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AppTheme/app_theme.dart';
import '../../app_widgets/custom_button.dart';
import '../../routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'Welcome to Eventori',
                style: AppTextStyle.onBoardingTitleStyle,
              ),
              const SizedBox(height: 12),
              Text(
                'You create the moments. We connect the people.',
                style: AppTextStyle.font16W400LGColorTextStyle,
              ),
              const SizedBox(height: 12),
              CustomButton(
                Text: "Get Started",
                width: double.infinity,
                onTap: () {
                  Get.toNamed( AppRoutes.selectionScreen);
                },
              ),

              const SizedBox(height: 12),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyle.AlreadyTextStyle,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.loginScreen);
                      },
                      child: Text(
                        'Login',
                          style: AppTextStyle.cyanColorStyle
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),


    );
  }
}


