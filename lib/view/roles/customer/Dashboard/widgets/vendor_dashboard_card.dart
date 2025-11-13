import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../app_widgets/custom_image_handler.dart';

class VendorDashboardCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String profession;
  final String status;
  final VoidCallback? onTapCard;
  final VoidCallback? onTapIcon;

  const VendorDashboardCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.profession,
    required this.status,
    this.onTapCard,
    this.onTapIcon,
  }) : super(key: key);

  Color _getStatusColor() {
    return status.toLowerCase() == 'confirmed'
        ? AppTheme.greenColor
        : AppTheme.yellowColor;
  }

  Color _getStatusBackgroundColor() {
    return status.toLowerCase() == 'confirmed'
        ? AppTheme.greenColor.withOpacity(.1)
        : AppTheme.yellowColor.withOpacity(.1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.denimBlueColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.textfieldBorderColor,
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: _getStatusBackgroundColor(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          status,
                          style: AppTextStyle.f10W500GColorTextStyle.copyWith(color: _getStatusColor(),),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyle.f14W500BColorTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            profession,
                            style: AppTextStyle.f12W400SGColorTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      GestureDetector(
                        onTap: onTapIcon,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppTheme.textfieldBorderColor,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_outward,
                            size: 20,
                            color: AppTheme.blackColor,
                          ),
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
    );
  }
}
