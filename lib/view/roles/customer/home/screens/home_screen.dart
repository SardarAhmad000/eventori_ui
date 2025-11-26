import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';
import '../widgets/custom_forum_highlight_card.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/create_event_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                    'My Events',
                    style: AppTextStyle.f20W600DPColorTextStyle,
                ),
                const SizedBox(height: 12),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CreateEventCard(
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    CustomCard(
                      imagePath: AppAssets.myEventImage,
                      title: 'My Events',
                      subtitle: 'View and manage your past and upcoming events',
                      onTap: () {
                        Get.toNamed(AppRoutes.myEventScreeen);
                      },
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Browse Vendors', style: AppTextStyle.f20W600DPColorTextStyle),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 235,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return CustomCard(
                        imagePath: AppAssets.vendor2Image,
                        title: 'Surprise Birthday Dinner',
                        subtitle: 'Cozy gathering at restaurant/venue',
                        onTap: () {
                          print('Tapped on Surprise Birthday Dinner');
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                // CustomButton(
                //   Text: 'View all vendors',
                //   width: double.infinity,
                //   height: 48,
                //   buttonColor: AppTheme.whiteColor,
                //   textColor: AppTheme.blackColor,
                //   borderColor: AppTheme.lightCyanColor,
                //   textSize: 16,
                //   fontFamily: AppFonts.regular,
                //   onTap: () {},
                // ),
                // const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Events', style: AppTextStyle.f20W600DPColorTextStyle),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 96,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 5,
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
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forum Highlights', style: AppTextStyle.f20W600DPColorTextStyle),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SizedBox(
                  height: 240,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.68,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ForumHighlightCard(
                              title: 'Best decor vendors for weddings',
                              description:
                              'Looking for top-rated decorators who can transform a wedding venue beautifully.',
                              avatarImages: [
                                AppAssets.eventImage1,
                                AppAssets.eventImage2,
                                AppAssets.eventImage2,
                              ],
                              commentCount: '34',
                              timeAgo: '5hr Ago',
                              onTap: () {},
                            );
                    },
                  ),
                ),
                const SizedBox(height: 110),
              ],
            ),
          ),
        ],
      ),
    );
  }
}