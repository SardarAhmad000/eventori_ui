import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';

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
    final displayAvatars = avatarImages.length > 4
        ? avatarImages.sublist(0, 4)
        : avatarImages;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 43.5.w,
        height: 234,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.whiteColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyle.font14W500BColorTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyle.font14W400SGColorTextStyle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),


            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: displayAvatars.length * 28.0 + 8,
                height: 24,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: displayAvatars.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: 3),
                      // padding: EdgeInsets.only(left: index == 0 ? 0 : 20.0),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.whiteColor,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: CustomImageHandler(
                            imagePath: displayAvatars[index],
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

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
                  style: AppTextStyle.font14W400SGColorTextStyle,
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
                  style: AppTextStyle.font14W400SGColorTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}