import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/app_text_style.dart';

class BadgeItem extends StatelessWidget {
  final dynamic icon;
  final String label;
  final Color backgroundColor;
  final bool isIconData;

  const BadgeItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    this.isIconData = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 29.w,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isIconData)
            Icon(
              icon as IconData,
              color: AppTheme.whiteColor,
              size: 16,
            )
          else
            Image.asset(
              icon as String,
              color: AppTheme.whiteColor,
              width: 16,
              height: 16,
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyle.f12W400WColorTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}