import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/event_controller.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EventController controller = Get.find<EventController>();

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Obx(
                  () => CustomCategoryTabBar(
                categories: controller.categories,
                initialIndex: controller.selectedCategoryIndex.value,
                onCategorySelected: (index) {
                  controller.selectCategory(index);
                },
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 420,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            imagePath: AppAssets.vendor2Image,
                            title: 'Kids Birthday Bash',
                            subtitle: 'Team-focused, trendy & colorful ideas',
                            onTap: () {
                              print('Tapped on Kids Birthday Bash');
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Featured events', style: AppTextStyle.myEventsTitle),
                        GestureDetector(
                          onTap: () {},
                          child: Text('View All', style: AppTextStyle.viewAllText),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 96,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: FeaturedEventCard(
                            imagePath: AppAssets.featuredImage1,
                            title: 'Summer Fest 2025',
                            subtitle: "Here's what's coming up",
                            date: '21',
                            month: 'Dec',
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 98),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}