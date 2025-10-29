import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/app_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../../../../constants/app_fonts.dart';

class CustomVendorCard extends StatelessWidget {
  final String? imagePath;
  final String vendorName;
  final String location;
  final bool isTopRated;
  final double rating;
  final bool isVerified;
  final bool isSponsored;
  final List<String> categories;
  final VoidCallback? onAddToEvent;
  final VoidCallback? onContact;
  final VoidCallback? onTap;

  const CustomVendorCard({
    Key? key,
    this.imagePath,
    required this.vendorName,
    required this.location,
    this.isTopRated = false,
    required this.rating,
    this.isVerified = false,
    this.isSponsored = false,
    required this.categories,
    this.onAddToEvent,
    this.onContact,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:12, bottom: 12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(16),

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CustomImageHandler(
                      imagePath: imagePath,
                      width: double.infinity,
                      height: 270,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (isSponsored)
                    Positioned(
                      top: 20,
                      left: 12,
                      child: Container(
                        width: 85,
                        height: 26,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.violetColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Sponsored',
                          style: AppTextStyle.vendorSponsStyle
                        ),
                      ),
                    ),
                ],
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vendorName,
                      style: AppTextStyle.vendorTitle,
                    ),
                    const SizedBox(height: 8),

                    // Location
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.locationIcon,
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: AppTextStyle.vendorLocatioStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        if (isTopRated)
                          Container(
                            width: 96,
                            height: 24,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.purplishColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets.topRatedBadgeIcon,
                                  width: 14,
                                  height: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Tope rated',
                                  style: AppTextStyle.badgeTextStyle,
                                ),
                              ],
                            ),
                          ),
                        if (isTopRated) const SizedBox(width: 8),
                        Container(
                          width: 57,
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.purplishColor,
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAssets.starIcon,
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toString(),
                                style: AppTextStyle.badgeTextStyle
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (isVerified)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.purplishColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAssets.verifiedIcon,
                                  width: 14,
                                  height: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Verified Id',
                                  style: AppTextStyle.badgeTextStyle,
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Categories
                    Wrap(
                      spacing: 8,
                      children: categories.map((category) {
                        return Container(
                          // width: 72,
                          height: 32,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppTheme.glacierGrayColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            category,
                            style: AppTextStyle.vendorEventsTextStyle,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            Text: "Add to event",
                            onTap: () {},
                            buttonColor: AppTheme.lightCyanColor,
                            textColor: AppTheme.whiteColor,
                            height: 48,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomButton(
                            Text: "Contact",
                            onTap: () {},
                            buttonColor: AppTheme.whiteColor,
                            textColor: AppTheme.brightCyanColor,
                            height: 48,
                            borderColor: AppTheme.brightCyanColor,
                          ),
                        ),
                      ],
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