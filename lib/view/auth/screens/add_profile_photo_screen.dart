import 'package:eventori/constants/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../AppTheme/widgets/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';

class AddProfilePhotoPage extends StatelessWidget {
  const AddProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            CustomHeader(
              showLogo: false,
              arrowColor: AppTheme.arrowColor,
              containerBackgroundColor: AppTheme.whiteColor,
            ),

            const SizedBox(height: 18),

            Text(
              'Add a profile photo',
              style: AppTextStyle.TitleStyle,
            ),
            const SizedBox(height: 8),
            Text(
              'Upload a clear photo to personalise your profile.',
              style: AppTextStyle.SubtitleStyle,
            ),

            const SizedBox(height: 30),

            Center(
              child: Column(
                children: [
                  Container(
                    width: 169,
                    height: 169,
                    decoration: BoxDecoration(
                      color: AppTheme.uploadContainerColor,
                      borderRadius: BorderRadius.circular(99999),
                      border: Border.all(
                        color: AppTheme.backArrowBorderColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        AppAssets.uploadImageIcon,
                        width: 40,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          Text: "Upload a photo",
                          onTap: () {},
                          buttonColor: AppTheme.buttonCyanColor,
                          textColor: AppTheme.whiteColor,
                          height: 48,
                          borderColor: AppTheme.buttonCyanColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          Text: "Take a photo",
                          onTap: () {},
                          buttonColor: AppTheme.whiteColor,
                          textColor: AppTheme.blackColor,
                          height: 48,
                          borderColor: AppTheme.buttonCyanColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),

                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: CustomButton(
                      Text: "Continue",
                      onTap: () {
                        Get.toNamed(AppRoutes.signUpScreen);
                      },
                      buttonColor: AppTheme.buttonCyanColor,
                      textColor: AppTheme.whiteColor,
                      height: 48,
                      width: double.infinity,
                    ),
                  ),

                  const SizedBox(height: 19),

                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(
                      'Skip',
                    style: AppTextStyle.skipStyle,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppTheme.dividerColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                          color: AppTheme.dividerColor,
                          thickness: 1,
                          ),
                      ),
                    ],
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
