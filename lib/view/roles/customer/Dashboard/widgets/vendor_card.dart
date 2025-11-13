import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../app_widgets/custom_image_handler.dart';

class VendorCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String profession;
  final double price;
  final VoidCallback? onTap;
  final double? imageSize;
  final double? borderRadius;
  final String? status;

  const VendorCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.profession,
    required this.price,
    this.onTap,
    this.imageSize = 80,
    this.borderRadius = 12,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8,top: 8),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.denimBlueColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppTheme.lightGrayishColor,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomImageHandler(
                  imagePath: imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: AppTextStyle.f14W500BColorTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profession,
                    style: AppTextStyle.f12W400SGColorTextStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Status and Price Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Status Badge (if provided)
                if (status != null) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusBackgroundColor(status!),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status!,
                      style: AppTextStyle.f10W400GColorTextStyle.copyWith(
                        color: _getStatusTextColor(status!),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],

                // Price
                Text(
                  '\$$price',
                  style: AppTextStyle.f12W400BColorTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppTheme.greenColor.withOpacity(0.1);
      case 'pending':
        return AppTheme.yellowColor.withOpacity(0.1);
      default:
        return AppTheme.greenColor.withOpacity(0.1);
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppTheme.greenColor;
      case 'pending':
        return AppTheme.yellowColor;
      default:
        return AppTheme.greenColor;
    }
  }
}