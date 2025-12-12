import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/app_text_style.dart';

class CreateEventCard extends StatelessWidget {
  final VoidCallback? onTap; // 👈 optional tap callback if needed

  const CreateEventCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 195,
        width: 44.w,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.lightCyanColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.textfieldBorderColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 141.5,
                height: 98,
                decoration: BoxDecoration(
                  color: AppTheme.paperWhiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.add,
                  color: AppTheme.darkpurpleColor,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create New Event',
              style: AppTextStyle.f14W600WColorTextStyle,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 6),
            Text(
              'Plan and organize your next event',
              style: AppTextStyle.f12W400WColorTextStyle,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
