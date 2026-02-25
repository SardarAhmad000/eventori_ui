import 'dart:math';

import 'package:eventori/view/roles/customer/event/controller/event_controller.dart';
import 'package:eventori/view/roles/customer/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../utils/date_helpers.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';
import '../widgets/custom_forum_highlight_card.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/create_event_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find();
  EventController eventController =Get.find();


  @override
  void initState() {
    super.initState();
    homeController.getAllVendors();
    eventController.getFeaturedEvent();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
          ()=> Column(
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
                        onTap: () {
                          Get.toNamed(AppRoutes.createEventScreen);
                        },
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 187,
                        child: CustomCard(
                          imagePath: AppAssets.myEventImage,
                          title: 'My Events',
                          subtitle: 'View and manage your past and upcoming events',
                          onTap: () {
                            Get.toNamed(AppRoutes.myEventScreeen);
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Browse Vendors', style: AppTextStyle.f20W600DPColorTextStyle),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.viewAllVendorsScreen);
                        },
                        child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        mainAxisExtent: 180,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: homeController.eventAllVendorsList.length > 2
                          ? 2
                          : homeController.eventAllVendorsList.length,
                      itemBuilder: (context, index) {
                        var eventVendors = homeController.eventAllVendorsList[index];

                        // Get only the first portfolio image
                        String firstPortfolioImage = '';

                        if (eventVendors.portfolio != null && eventVendors.portfolio.isNotEmpty) {
                          if (eventVendors.portfolio is List) {
                            firstPortfolioImage = eventVendors.portfolio[0].toString();
                          } else {
                            firstPortfolioImage = eventVendors.portfolio.toString();
                          }
                        }

                        return CustomCard(
                          imagePath: firstPortfolioImage,
                          title: eventVendors.businessName,
                          subtitle: eventVendors.operatingAddress,
                          onTap: () {
                            print("hahahaha ${eventVendors.id}");
                            print(eventVendors.portfolio);
                            Get.toNamed(
                              AppRoutes.vendorDetailedScreen,
                              arguments: {
                                'vendorId' : eventVendors.id,
                                'imagePaths':  eventVendors.portfolio,
                                'vendorName': eventVendors.businessName,
                                'location': eventVendors.operatingAddress,
                                'isTopRated': ['isTopRated'],
                                'rating': ['rating'],
                                'isVerified': ['isVerified'],
                                'categories':eventVendors.servicesProvided,
                                'email' : eventVendors.user.email,
                                'preferredContactValue': eventVendors.preferredContactValue,
                              },
                            );
                          },
                          // onTap: () {
                          //   print('Tapped on Vendor');
                          //
                          //
                          //   },
                        );
                      },
                    ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Featured Events', style: AppTextStyle.f20W600DPColorTextStyle),
                      GestureDetector(
                        onTap: () {
                          // Get.toNamed(AppRoutes.eventsScreen);
                        },
                        child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                      height: eventController.eventFeaturedList.isEmpty ? 0 : 96,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: eventController.eventFeaturedList.length,
                        itemBuilder: (context, index) {
                          final featuredEvents = eventController.eventFeaturedList[index];
                          final dateData = DateUtilsHelper.getMonthAndDay(featuredEvents.eventDate.toString()==''?"2000-12-05T18:00:00.000Z":featuredEvents.eventDate.toString());

                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: FeaturedEventCard(
                              imagePath: featuredEvents.image,
                              title: featuredEvents.eventName,
                              subtitle: featuredEvents.about,
                              date: dateData['day']!,
                              month: dateData['month']!,
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
      ),
    );
  }
}