import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../AppTheme/app_theme.dart';
import '../constants/app_text_style.dart';
import 'custom_button.dart';

class CustomClearChatDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final IconData? icon;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const CustomClearChatDialog({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onConfirm,
    this.onCancel,
    this.icon,
    this.iconColor,
    this.buttonColor,
    this.buttonTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // backgroundColor: AppTheme.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon ?? Icons.close,
                  color: iconColor ?? AppTheme.redColor,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyle.font18W500BColorTextStyle,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onCancel ?? () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.close,
                    color: AppTheme.blackColor,
                    size: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            Text(
              subtitle,
              style: AppTextStyle.font14W400SGColorTextStyle,
            ),
            SizedBox(height: 3.h),
            CustomButton(
              Text: buttonText,
              width: double.infinity,
              borderColor: buttonColor ?? AppTheme.redColor,
              height: 48,
              buttonColor: buttonColor ?? AppTheme.redColor,
              textColor: buttonTextColor ?? AppTheme.whiteColor,
              onTap: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    IconData? icon,
    Color? iconColor,
    Color? buttonColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomClearChatDialog(
          title: title,
          subtitle: subtitle,
          buttonText: buttonText,
          onConfirm: onConfirm,
          onCancel: onCancel,
          icon: icon,
          iconColor: iconColor,
          buttonColor: buttonColor,
          buttonTextColor: buttonTextColor,
        );
      },
    );
  }
}