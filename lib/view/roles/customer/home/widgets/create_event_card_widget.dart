import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/widgets/app_theme.dart';
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
        height: 30.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: AppTheme.lightCyanColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.glacierGrayColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Create New Event',
                style: AppTextStyle.newsEventTitle,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Plan and organize your next event',
                style: AppTextStyle.newEventSubTitle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
