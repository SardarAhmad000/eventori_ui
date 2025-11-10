import 'package:flutter/material.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_image_handler.dart';

class MessageCard extends StatelessWidget {
  final String name;
  final String message;
  final String timeAgo;
  final String imagePath;
  final bool isNetworkImage;

  const MessageCard({
    Key? key,
    required this.name,
    required this.message,
    required this.timeAgo,
    required this.imagePath,
    this.isNetworkImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.lightGrayishColor,
            width: 1,
          ),
        ),
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
                imagePath: imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.f14W500DPColorTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: AppTextStyle.f12W400SGColorTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            timeAgo,
            style: AppTextStyle.f10W400SGColorTextStyle,
          ),
        ],
      ),
    );
  }
}