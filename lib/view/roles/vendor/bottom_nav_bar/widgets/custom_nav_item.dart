import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/app_theme.dart';

class CustomNavItem extends StatelessWidget {
  final IconData? icon;
  final String? iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    super.key,
    this.icon,
    this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath != null
                ? Image.asset(
              iconPath!,
              width: 18,
              height: 18,
              color: isSelected ? AppTheme.blackColor : AppTheme.silverColor,
            )
                : Icon(
              icon,
              size: 18,
              color: isSelected ? AppTheme.blackColor : AppTheme.silverColor,
            ),
            SizedBox(height: 0.5.h),
            Text(
              title,
              style: AppTextStyle.f12W400PWColorTextStyle.copyWith(
                color: isSelected ? AppTheme.blackColor : AppTheme.silverColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}