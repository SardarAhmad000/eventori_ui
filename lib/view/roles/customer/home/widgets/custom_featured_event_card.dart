import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';

class FeaturedEventCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String subtitle;
  final String date;
  final String month;
  final VoidCallback? onTap;

  const FeaturedEventCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.month,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              CustomImageHandler(
                imagePath: imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              // Dark overlay
              Container(
                height: 64,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                     AppTheme.blackColor.withOpacity(0.3),
                      AppTheme.blackColor.withOpacity(0.6),
                    ],
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style:AppTextStyle.font20w500WColorTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            subtitle,
                            style:AppTextStyle.f14W400LGColorTextStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    SizedBox(
                      width: 40,
                      height: 64,
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                date,
                                style: AppTextStyle.font20w500WColorTextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            month,
                            style: AppTextStyle.f12W400PWColorTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
