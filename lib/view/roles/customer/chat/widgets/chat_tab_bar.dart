import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';

class ChatTabBar extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ChatTabBar({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.whiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppTheme.textfieldBorderColor ?? AppTheme.whiteColor,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppTheme.blackColor : AppTheme.slateGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}