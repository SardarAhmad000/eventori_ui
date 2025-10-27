import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/widgets/app_theme.dart';
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
                Text('My Events', style: AppTextStyle.myEventsTitle),
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
                Text('Browse Vendors', style: AppTextStyle.myEventsTitle),
                const SizedBox(height: 12),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCard(
                      imagePath: AppAssets.vendor1Image,
                      title: 'Surprise Birthday Dinner',
                      subtitle: 'Cozy gathering at restaurant/venue',
                      onTap: () {},
                    ),
                    const SizedBox(width: 8),
                    CustomCard(
                      imagePath: AppAssets.vendor2Image,
                      title: 'Milestone Birthday Party',
                      subtitle: 'For 30th, 40th, 50th birthdays',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomButton(
                  Text: 'View all vendors',
                  width: double.infinity,
                  height: 48,
                  buttonColor: Colors.white,
                  textColor: AppTheme.shadowColor,
                  borderColor: AppTheme.cyanColor,
                  textSize: 16,
                  fontFamily: AppFonts.medium,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured events', style: AppTextStyle.myEventsTitle),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View All', style: AppTextStyle.viewAllText),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FeaturedEventCard(
                        imagePath: AppAssets.featuredImage1,
                        title: 'Summer Fest 2025',
                        subtitle: "Here's what's coming up",
                        date: '21',
                        month: 'Dec',
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      FeaturedEventCard(
                        imagePath: AppAssets.featuredImage1,
                        title: 'Winter Concert 2025',
                        subtitle: "Live music performance",
                        date: '15',
                        month: 'Jan',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Forum Highlights', style: AppTextStyle.myEventsTitle),
                    GestureDetector(
                      onTap: () {},
                      child: Text('View All', style: AppTextStyle.viewAllText),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ForumHighlightCard(
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
                    ),
                    const SizedBox(width: 12),
                    ForumHighlightCard(
                      title: 'How to choose the right photographer',
                      description:
                      'What should we look for when hiring a wedding photographer?',
                      avatarImages: [
                        AppAssets.eventImage1,
                        AppAssets.eventImage2,
                      ],
                      commentCount: '60',
                      timeAgo: '7hr Ago',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 98),
              ],
            ),
          ),
        ],
      ),
    );
  }
}