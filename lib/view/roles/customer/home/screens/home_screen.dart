import 'package:eventori/constants/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/widgets/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_button.dart';
import '../../../../../constants/custom_card.dart';
import '../../../../../constants/custom_featured_event_card.dart';
import '../../../../../constants/custom_forum_highlight_card.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/create_event_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: AppTheme.stormyIndigoColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                border: Border.all(
                  color: AppTheme.stormyIndigoColor,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        height: 47,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Row(
                              children: [
                                 CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppTheme.whiteColor,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Hi Noraiz',
                                        style: AppTextStyle.AlreadyTextStyle),
                                    const SizedBox(height: 2),
                                    Text('Welcome Back!',
                                        style: AppTextStyle.welcomeBackStyle),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppAssets.bellIcon, width: 18, height: 18),
                                const SizedBox(width: 12),
                                Image.asset(AppAssets.heartIcon, width: 18, height: 18),
                                const SizedBox(width: 12),
                                Image.asset(AppAssets.settingsIcon,
                                    width: 18, height: 18),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    
                    Text(
                        'Would you like to create a new event or explore vendors first?',
                        style: AppTextStyle.homeAppBarTextStyle
                    ),
                    SizedBox(height: 16),

                    CustomTextField(
                      borderRadius: 99,
                      hintText: "Search Vendors",
                      prefixIcon: Image.asset(
                        AppAssets.searchIcon,
                        color: AppTheme.slateGreyColor,
                        width: 24,
                        height: 24,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppTheme.paleGrayBlueColor,
                            borderRadius: BorderRadius.circular(999),
                            // shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            AppAssets.filterIcon,
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // _buildTabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Events',
                        style: AppTextStyle.myEventsTitle
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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

                      Text(
                          'Browse Vendors',
                          style: AppTextStyle.myEventsTitle
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCard(
                            imagePath: AppAssets.vendor1Image,
                            title: 'Surprise Birthday Dinner',
                            subtitle: 'Cozy gathering at restaurant/venue',
                            onTap: () {
                            },
                          ),
                          const SizedBox(width: 8),
                          CustomCard(
                            imagePath: AppAssets.vendor2Image,
                            title: 'Milestone Birthday Party',
                            subtitle: 'For 30th, 40th, 50th birthdays',
                            onTap: () {

                            },
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
                        onTap: () {
                        },
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Featured events',
                              style: AppTextStyle.myEventsTitle
                          ),

                          GestureDetector(
                            onTap: (){

                            },
                            child: Text(
                                'View All',
                                style: AppTextStyle.viewAllText
                            ),
                          ),

                        ],
                      ),


                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FeaturedEventCard(
                              imagePath: AppAssets.featuredImage1,
                              title: 'Summer Fest 2025',
                              subtitle: "Here's what's coming up",
                              date: '21',
                              month: 'Dec',
                              onTap: () {

                              },
                            ),
                            SizedBox(width: 8),
                            FeaturedEventCard(
                              imagePath: AppAssets.featuredImage1,
                              title: 'Summer Fest 2025',
                              subtitle: "Here's what's coming up",
                              date: '21',
                              month: 'Dec',
                              onTap: () {

                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Forum Highlights',
                              style: AppTextStyle.myEventsTitle
                          ),

                          GestureDetector(
                            onTap: (){

                            },
                            child: Text(
                                'View All',
                                style: AppTextStyle.viewAllText
                            ),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ForumHighlightCard(
                            title: 'Best decor vendors for weddings',
                            description: 'Looking for top-rated decorators who can transform a wedding venue beautifully.',
                            avatarImages: [
                              AppAssets.eventImage1,
                              AppAssets.eventImage2,
                            ],
                            commentCount: '34',
                            timeAgo: '5hr Ago',
                            onTap: () {
                            },
                          ),

                          const SizedBox(width: 16),
                          ForumHighlightCard(
                            title: 'How to choose the right photographer',
                            description: 'What should we look for when hiring a wedding photographer?',
                            avatarImages: [
                              AppAssets.eventImage1,
                              AppAssets.eventImage2,
                            ],
                            commentCount: '60',
                            timeAgo: '7hr Ago',
                            onTap: () {
                            },
                          ),
                        ],
                      ),

                      // Row(
                      //   children: [
                      //     ForumHighlightCard(
                      //       title: 'Best decor vendors for weddings',
                      //       description: 'Looking for top-rated decorators who can transform a wedding venue beautifully.',
                      //       avatarImages: [
                      //         AppAssets.plusIcon, // Add your avatar images to assets
                      //         AppAssets.searchIcon,
                      //       ],
                      //       commentCount: '34',
                      //       timeAgo: '5hr Ago',
                      //       onTap: () {
                      //         // Navigate to forum post details
                      //       },
                      //     ),
                      //   ],
                      // ),



                      // SizedBox(height: 109,),



                      SizedBox(height: 109,),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}

