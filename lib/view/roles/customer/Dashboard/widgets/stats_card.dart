import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatsCard extends StatelessWidget {
  final String? iconPath;
  final Color iconColor;
  final String value;
  final String label;

  const StatsCard({
    super.key,
    this.iconPath,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0,top: 16),
      child: Container(
        height: 14.h,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (iconPath != null)
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  iconPath!,
                  height: 24,
                  width: 24,
                  color: iconColor,
                ),
              ),
            // const SizedBox(height: 4),
            Text(
              value,
              style: AppTextStyle.f16W400BColorTextStyle,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTextStyle.f12W400SGColorTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
