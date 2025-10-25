import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../AppTheme/widgets/app_theme.dart';

class ForumHighlightCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> avatarImages;
  final String commentCount;
  final String timeAgo;
  final VoidCallback? onTap;

  const ForumHighlightCard({
    Key? key,
    required this.title,
    required this.description,
    required this.avatarImages,
    required this.commentCount,
    required this.timeAgo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42.w,
          // height: 243,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppTheme.darkpurpleColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.blackTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),

              Text(
                description,
                style: AppTextStyle.forumHighLightDescp,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAvatarStack(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        width: 16,
                        height: 16,
                        AppAssets.messageChatIcon,
                        color: AppTheme.slateGreyColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        commentCount,
                        style: AppTextStyle.forumHighLightDescp
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        width: 16,
                        height: 16,
                        AppAssets.clockIcon,
                        color: AppTheme.slateGreyColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        timeAgo,
                        style: AppTextStyle.forumHighLightDescp
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarStack() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          SizedBox(
            width: avatarImages.length * 28.0 + 8,
            height: 24,
            child: Stack(
              children: List.generate(
                avatarImages.length > 4 ? 2 : avatarImages.length,
                    (index) => Positioned(
                  left: index * 28.0,
                  child: _buildAvatar(avatarImages[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imagePath) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
