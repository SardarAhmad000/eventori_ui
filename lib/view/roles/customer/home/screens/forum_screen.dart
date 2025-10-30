import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../constants/aap_assets.dart';
import '../widgets/custom_forum_card.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 12, bottom: 98),
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomForumCard(
            title: 'Best decor vendors for weddings',
            description: 'Looking for top-rated decorators who can transform a wedding venue beautifully.',
            userAvatars: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 3),
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
                        imagePath: AppAssets.eventImage1,
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            commentCount: 34,
            timeAgo: '5hr Ago',
            category: 'Photography',
            categoryColor: AppTheme.greenColor,
          );
        },
      ),
    );
  }
}