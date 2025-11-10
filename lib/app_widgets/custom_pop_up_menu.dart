import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class PopupMenuOption {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;

  PopupMenuOption({
    required this.title,
    required this.onTap,
    this.icon,
  });
}

class CustomPopupMenu extends StatelessWidget {
  final List<PopupMenuOption> options;
  final GlobalKey menuKey;
  final Widget child;
  final double horizontalOffset;

  const CustomPopupMenu({
    Key? key,
    required this.options,
    required this.menuKey,
    required this.child,
    this.horizontalOffset = -160,
  }) : super(key: key);

  void _showMenu(BuildContext context) {
    final RenderBox? renderBox =
    menuKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null) return;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    showMenu(
      context: context,
      color: AppTheme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      position: RelativeRect.fromLTRB(
        offset.dx + horizontalOffset, // Use the parameter here
        offset.dy + size.height,
        offset.dx + size.width,
        offset.dy,
      ),
      items: options.map((option) {
        return PopupMenuItem(
          onTap: option.onTap,
          child: Row(
            children: [
              if (option.icon != null) ...[
                Icon(
                  option.icon,
                  size: 18,
                  color: AppTheme.blackColor,
                ),
                const SizedBox(width: 12),
              ],
              Text(
                option.title,
                style: AppTextStyle.f14W400SGColorTextStyle,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: menuKey,
      onTap: () => _showMenu(context),
      child: child,
    );
  }
}