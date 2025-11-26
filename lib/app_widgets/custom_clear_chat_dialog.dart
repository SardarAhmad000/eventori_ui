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
  final dynamic icon; // Can be IconData or String (asset path)
  final Color? iconColor;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final bool isIconData;
  final double? iconSize;

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
    this.isIconData = true,
    this.iconSize = 24,
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
                // Icon or Image Asset
                if (icon != null)
                  isIconData
                      ? Icon(
                    icon as IconData,
                    color: iconColor ?? AppTheme.redColor,
                    size: iconSize,
                  )
                      : Image.asset(
                    icon as String,
                    color: iconColor,
                    width: iconSize,
                    height: iconSize,
                  )
                else
                  Icon(
                    Icons.close,
                    color: iconColor ?? AppTheme.redColor,
                    size: iconSize,
                  ),
                SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyle.f18W500BColorTextStyle,
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
              style: AppTextStyle.f14W400SGColorTextStyle,
            ),
            SizedBox(height: 3.h),
            CustomButton(
              Text: buttonText,
              width: double.infinity,
              borderColor: buttonColor ?? AppTheme.redColor,
              height: 40,
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
    dynamic icon,
    Color? iconColor,
    Color? buttonColor,
    Color? buttonTextColor,
    bool barrierDismissible = true,
    bool isIconData = true,
    double? iconSize = 24,
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
          isIconData: isIconData,
          iconSize: iconSize,
        );
      },
    );
  }
}