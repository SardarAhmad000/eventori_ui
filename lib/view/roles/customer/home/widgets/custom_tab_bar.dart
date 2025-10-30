import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/app_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  static const List<String> _tabs = ['Home', 'Vendors', 'Events', 'Forums'];

  const CustomTabBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        width: double.infinity,
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppTheme.paperWhiteColor,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: _tabs.length,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () => onTabSelected(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _tabs[index],
                    style: TextStyle(
                      color: isSelected
                          ? AppTheme.darkpurpleColor
                          : AppTheme.denimBlueColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.regular,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: 3,
                    width: 12.w,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.darkpurpleColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}