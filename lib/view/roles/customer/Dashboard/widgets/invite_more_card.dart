import 'package:eventori/AppTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/app_text_style.dart';

class InviteMoreCard extends StatelessWidget {
  final VoidCallback? onTap;

  const InviteMoreCard({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18.w,
        height: 11.5.h,
        margin: const EdgeInsets.symmetric(horizontal: 8,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.silverColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: AppTheme.blackColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Invite more',
              style: AppTextStyle.f12W400DSBColorTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}