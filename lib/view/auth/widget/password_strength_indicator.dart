import 'package:flutter/material.dart';

import '../../../AppTheme/app_theme.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final int strengthLevel; // 0 to 5
  final bool showLabel;

  const PasswordStrengthIndicator({
    super.key,
    required this.strengthLevel,
    this.showLabel = true,
  });

  String get strengthText {
    if (strengthLevel == 0) return 'Too Weak';
    if (strengthLevel == 1) return 'Weak';
    if (strengthLevel == 2) return 'Fair';
    if (strengthLevel == 3) return 'Good';
    if (strengthLevel == 4) return 'Strong';
    if (strengthLevel == 5) return 'Very Strong';
    return 'Too Weak';
  }

  Color get strengthColor {
    if (strengthLevel == 0) return Colors.red;
    if (strengthLevel == 1) return Colors.red;
    if (strengthLevel == 2) return Colors.orange;
    if (strengthLevel == 3) return Colors.yellow.shade700;
    if (strengthLevel == 4) return Colors.lightGreen;
    if (strengthLevel == 5) return Colors.green;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password Strength',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppTheme.silverColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  strengthText,
                  style: TextStyle(
                    fontSize: 13,
                    color: strengthColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        Row(
          children: List.generate(5, (index) {
            return Expanded(
              child: Container(
                height: 6,
                margin: EdgeInsets.only(
                  right: index < 4 ? 8 : 0,
                ),
                decoration: BoxDecoration(
                  color: index < strengthLevel
                      ? strengthColor
                      : AppTheme.silverColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}