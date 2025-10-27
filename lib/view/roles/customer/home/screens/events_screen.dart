import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../constants/app_text_style.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All Events',
    'Weddings',
    'Festivals',
    'Corporate',
    'Birthday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: CustomCategoryTabBar(
              categories: _categories,
              initialIndex: _selectedCategoryIndex,
              onCategorySelected: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
                print('Selected category: ${_categories[index]}');
              },
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        CustomCard(
                          imagePath: AppAssets.eventImage1,
                          title: 'Kids Birthday Bash',
                          subtitle: 'Team-focused, trendy & colorful ideas',
                          onTap: () {
                            print('Tapped on Kids Birthday Bash');
                          },
                        ),
                        CustomCard(
                          imagePath: AppAssets.eventImage2,
                          title: 'Sweet 16 Celebration',
                          subtitle: 'Fun theme for children with balloons & games',
                          onTap: () {
                            print('Tapped on Sweet 16 Celebration');
                          },
                        ),
                        CustomCard(
                          imagePath: AppAssets.vendor1Image,
                          title: 'Surprise Birthday Dinner',
                          subtitle: 'Cozy dining at unforgettable venue',
                          onTap: () {
                            print('Tapped on Surprise Birthday Dinner');
                          },
                        ),
                        CustomCard(
                          imagePath: AppAssets.vendor2Image,
                          title: 'Milestone Birthday Party',
                          subtitle: 'Celebrate 30th, 40th, 50th birthdays',
                          onTap: () {
                            print('Tapped on Milestone Birthday Party');
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

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

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  ),

                  const SizedBox(height: 102),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}