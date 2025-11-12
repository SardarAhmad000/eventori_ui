import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatsCard extends StatelessWidget {
  final String? iconPath;
  final Color iconColor;
  final String value;
  final String label;
  final VoidCallback? onTap;

  const StatsCard({
    super.key,
    this.iconPath,
    required this.iconColor,
    required this.value,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 91,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (iconPath != null)
              Container(
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
            Text(
              value,
              style: AppTextStyle.f12W500BColorTextStyle,
            ),
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

// Example Usage:
/*

StatsCard(
  iconPath: AppAssets.usersIcon,
  iconColor: AppTheme.blueColor,
  value: '245',
  label: 'Total Attendees',
  onTap: () {
    print('Stats card tapped');
    // Navigate or perform action
  },
)

// Without onTap (non-interactive)
StatsCard(
  iconPath: AppAssets.calendarIcon,
  iconColor: AppTheme.greenColor,
  value: '12',
  label: 'Events',
)

*/