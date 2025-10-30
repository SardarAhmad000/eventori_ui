import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';

class CustomForumCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget userAvatars;
  final int commentCount;
  final String timeAgo;
  final String category;
  final Color categoryColor;

  const CustomForumCard({
    Key? key,
    required this.title,
    required this.description,
    required this.userAvatars,
    required this.commentCount,
    required this.timeAgo,
    required this.category,
    required this.categoryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.font14W500BColorTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyle.font14W400SGColorTextStyle,
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 24,
            child: userAvatars,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    width: 16,
                    height: 16,
                    AppAssets.messageChatIcon,
                    color: AppTheme.slateGreyColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$commentCount',
                    style: AppTextStyle.font14W400SGColorTextStyle,
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    width: 16,
                    height: 16,
                    AppAssets.clockIcon,
                    color: AppTheme.slateGreyColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    timeAgo,
                    style: AppTextStyle.font14W400SGColorTextStyle,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: categoryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: categoryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}