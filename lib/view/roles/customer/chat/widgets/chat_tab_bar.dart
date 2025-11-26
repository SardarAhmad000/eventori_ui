import 'package:eventori/constants/app_text_style.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.whiteColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 1,
              color: isSelected ? AppTheme.textfieldBorderColor : AppTheme.whiteColor,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyle.f12W600BColorTextStyle.copyWith( color: isSelected ? AppTheme.blackColor : AppTheme.slateGreyColor,),
            ),
          ),
        ),
      ),
    );
  }
}