import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../AppTheme/app_theme.dart';
import '../constants/aap_assets.dart';
import '../constants/app_text_style.dart';
import 'custom_button.dart';

class CustomSuccessDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;
  final String? iconAsset;
  final Color? iconBackgroundColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? buttonBorderColor;

  const CustomSuccessDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
    this.iconAsset,
    this.iconBackgroundColor,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: AppTheme.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBackgroundColor ?? AppTheme.greenColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  iconAsset ?? AppAssets.vectorIcon,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: 3.h),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.f32W600BColorTextStyle,
            ),

            SizedBox(height: 1.5.h),

            // Subtitle
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.font16W400BColorTextStyle,
            ),

            SizedBox(height: 3.h),

            CustomButton(
              Text: buttonText,
              width: double.infinity,
              borderColor: buttonBorderColor ?? AppTheme.greenColor,
              height: 48,
              buttonColor: buttonColor ?? AppTheme.greenColor,
              textColor: buttonTextColor ?? AppTheme.whiteColor,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }

  // Static method to show the dialog
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
    String? iconAsset,
    Color? iconBackgroundColor,
    Color? buttonColor,
    Color? buttonTextColor,
    Color? buttonBorderColor,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomSuccessDialog(
          title: title,
          subtitle: subtitle,
          buttonText: buttonText,
          onTap: onTap,
          iconAsset: iconAsset,
          iconBackgroundColor: iconBackgroundColor,
          buttonColor: buttonColor,
          buttonTextColor: buttonTextColor,
          buttonBorderColor: buttonBorderColor,
        );
      },
    );
  }
}