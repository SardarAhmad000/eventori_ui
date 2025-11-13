import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8,right: 16, left: 16),
            child: Obx(
                  () => CustomCategoryTabBar(
                categories: controller.eventCategories,
                initialIndex: controller.selectedCategoryIndex.value,
                onCategorySelected: (index) {
                  controller.selectEventCategory(index);
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
                        Text('Featured events', style: AppTextStyle.f20W600DPColorTextStyle),
                        GestureDetector(
                          onTap: () {},
                          child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
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

                  const SizedBox(height: 110),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}