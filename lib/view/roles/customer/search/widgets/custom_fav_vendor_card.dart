import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../constants/aap_assets.dart';

class FavoriteVendorCard extends StatelessWidget {
  final String vendorName;
  final String description;
  final String location;
  final String? imagePath;
  // final String profileImage;
  final double rating;
  final bool isTopRated;
  final bool isVerified;
  final VoidCallback onChatPressed;
  final VoidCallback onBookPressed;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const FavoriteVendorCard({
    super.key,
    required this.vendorName,
    required this.description,
    required this.location,
    this.imagePath,
    // required this.profileImage,
    required this.rating,
    this.isTopRated = false,
    this.isVerified = false,
    required this.onChatPressed,
    required this.onBookPressed,
    required this.onFavoritePressed,
    this.isFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color:AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with profile, name, and favorite button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: imagePath != null
                        ? CustomImageHandler(
                      imagePath: imagePath!,
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    )
                        : Container(
                      width: 54,
                      height: 54,
                      color: AppTheme.blueGrayColor.withOpacity(0.2),
                      // child: const Icon(Icons.image, size: 30),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vendorName,
                          style: AppTextStyle.f14W500BColorTextStyle
                        ),
                        // const SizedBox(height: 4),
                        Text(
                          description,
                          style: AppTextStyle.f12W400BColorTextStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onFavoritePressed,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ?  AppTheme.redColor : AppTheme.blueGrayColor,
                      size: 20,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Image.asset(
                    AppAssets.locationIcon,
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      location,
                      style: AppTextStyle.f12W400CBColorTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
                        color: AppTheme.blueGrayColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.topRatedBadgeIcon,
                            color: AppTheme.whiteColor,
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Top rated',
                            style: AppTextStyle.f12W400WColorTextStyle,
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
                      color: AppTheme.steelBlueColor,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.starIcon,
                          color: AppTheme.whiteColor,
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: AppTextStyle.f12W400WColorTextStyle,
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
                        color: AppTheme.blueGrayColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.verifiedIcon,
                            color: AppTheme.whiteColor,
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Verified Id',
                            style: AppTextStyle.f12W400WColorTextStyle,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      Text: "Chat now",
                      onTap: onChatPressed,
                      buttonColor: AppTheme.lightCyanColor,
                      textColor: AppTheme.whiteColor,
                      height: 48,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      Text: "Book now",
                      onTap: onBookPressed,
                      buttonColor: AppTheme.whiteColor,
                      textColor: AppTheme.lightCyanColor,
                      height: 48,
                      borderColor: AppTheme.lightCyanColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}