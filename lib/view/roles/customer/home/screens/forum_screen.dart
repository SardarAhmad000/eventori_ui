import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_forum_card.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController forumController = Get.find<HomeController>();
    return Scaffold(
        backgroundColor: AppTheme.paperWhiteColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: Obx(
                    () => CustomCategoryTabBar(
                  categories: forumController.forumCategories,
                  initialIndex: forumController.selectedCategoryIndex.value,
                  onCategorySelected: (index) {
                    forumController.selectForumCategory(index);
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Trending topics',
                          style: AppTextStyle.f20W600DPColorTextStyle
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CustomForumCard(
                            title: 'How to choose the right photographer',
                            description: 'What should we look for when hiring a wedding photographer?',
                            userAvatars: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 2,
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
                      const SizedBox(height: 20),
                      Text(
                          'Following',
                          style: AppTextStyle.f20W600DPColorTextStyle
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 2,
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
                      const SizedBox(height: 20),
                      Text(
                        'New topics',
                        style: AppTextStyle.f20W600DPColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return CustomForumCard(
                            title: 'How to plan a small wedding?',
                            description: 'Started by Sarah • 2 hours ago',
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
                      const SizedBox(height: 110),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}