import 'package:eventori/app_widgets/custom_image_handler.dart';
import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';

class CustomProfileCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String role;

  const CustomProfileCard({
    Key? key,
    this.imageUrl,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.lightCyanColor,
            border: Border.all(
              color: AppTheme.textfieldBorderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(99),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: CustomImageHandler(
              imagePath: imageUrl,
              width: 44,
              height: 44,
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
                style: AppTextStyle.f16W500DSBColorTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                role,
                style: AppTextStyle.f12W400SGColorTextStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),

        Text(
          role,
          style: AppTextStyle.f14W500DSBColorTextStyle,
        ),
      ],
    );
  }
}

// Example Usage:
/*

CustomProfileCard(
  imageUrl: 'https://example.com/image.jpg',
  name: 'Sara',
  role: 'Owner',
)

CustomProfileCard(
  imageUrl: AppAssets.profileImage,
  name: 'John Doe',
  role: 'Attendee',
)

CustomProfileCard(
  imageUrl: null,
  name: 'Guest User',
  role: 'Visitor',
)

*/