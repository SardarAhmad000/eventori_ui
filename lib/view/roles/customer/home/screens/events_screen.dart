import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/view/roles/customer/event/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../utils/date_helpers.dart';
import '../../event/widgets/event_details_bottom_sheet.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_featured_event_card.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  HomeController homeController = Get.find();
  EventController eventController =Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventController.getEvent();
    eventController.getFeaturedEvent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Obx(
          () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8,right: 16, left: 16),
              child: Obx(
                    () => CustomCategoryTabBar(
                  categories: homeController.eventCategories,
                  //                categories: eventController.eventCategoryList,
                  initialIndex: homeController.selectedCategoryIndex.value,
                  onCategorySelected: (index) {
                    homeController.selectEventCategory(index);
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
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 180,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: eventController.eventList.length,
                        itemBuilder: (context, index) {
                          final events = eventController.eventList[index];
                          return CustomCard(
                            imagePath: events.image,
                            title: events.eventName,
                            subtitle: events.about,
                            onTap: ()
                            {
                              print('Tapped on Event');
                              showEventDetailsBottomSheet(
                                context: context,
                                eventid:events.id.toString(),
                                eventImage: events.image,
                                eventTitle: events.eventName,
                                eventDate: (events.eventDate == null ||
                                    events.eventDate.toString().isEmpty)
                                    ? ''
                                    : DateUtilsHelper.formatToDayMonthYear(
                                  events.eventDate.toString(),
                                ),
                                // eventDate:event.eventDate.toString()==''?"":DateUtilsHelper.formatToDayMonthYear(event.eventDate.toString(),
                                eventDescription: events.about,
                                eventUrl:  'www.jsdskdjhjdjdsbab',
                              );
                            },
                          );
                        },
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
                        itemCount: eventController.eventFeaturedList.length,
                        itemBuilder: (context, index) {
                          final featuredEvent = eventController.eventFeaturedList[index];
                          final dateData = DateUtilsHelper.getMonthAndDay(featuredEvent.eventDate.toString()==''?"2000-12-05T18:00:00.000Z":featuredEvent.eventDate.toString());

                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: FeaturedEventCard(
                              imagePath: featuredEvent.image,
                              title: featuredEvent.eventName,
                              subtitle: featuredEvent.about,
                              date: dateData['day']!,
                              month: dateData['month']!,
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
      ),
    );
  }
}