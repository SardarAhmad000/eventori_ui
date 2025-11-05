import 'package:flutter/material.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../constants/app_text_style.dart';


class MenuItemWidget extends StatelessWidget {
  final String title;
  final String? iconPath; // ✅ optional
  final bool isDelete;
  final VoidCallback onTap;

  const MenuItemWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.iconPath,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                title,
                style: AppTextStyle.f14W400SColorTextStyle,
                // copyWith(color: isDelete ? AppTheme.redColor : AppTheme.silverColor,)
            ),
            if (iconPath != null)
              Image.asset(
                iconPath!,
                height: 24,
                width: 24,
                // color: AppTheme.silverColor,
              ),
          ],
        ),
      ),
    );
  }
}
