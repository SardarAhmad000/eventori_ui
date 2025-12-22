import 'package:eventori/app_widgets/custom_text_placeholder.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/customer/event/controller/event_controller.dart';
import 'package:eventori/view/roles/customer/event/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_loader.dart';
import '../../../../../utils/date_helpers.dart';
import '../../../../onboarding/widgets/build_header.dart';
import '../widgets/event_details_bottom_sheet.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventController.getEvent();
  }

  EventController eventController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              onBackPressed:(){
                Get.offAllNamed(AppRoutes.navBarScreen);
              },
              showLogo: true,
            ),
            const SizedBox(height: 20),
            Text('My events', style: AppTextStyle.f24W600BColorTextStyle),
            const SizedBox(height: 16),
            Obx(
              ()=>eventController.isLoading.value?
              const CustomLoader():
              eventController.eventList.isEmpty?
              const CustomTextPlaceHolder():
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: eventController.eventList.length,
                  itemBuilder: (context, index) {
                    var event = eventController.eventList[index];
                    final dateData = DateUtilsHelper.getMonthAndDay(event.eventDate.toString()==''?"2000-12-05T18:00:00.000Z":event.eventDate.toString());
                    return GestureDetector(
                      onTap: (){
                        showEventDetailsBottomSheet(
                          context: context,
                          eventImage: event.image,
                          eventTitle: event.eventName,
                          eventDate: (event.eventDate == null ||
                              event.eventDate.toString().isEmpty)
                              ? ''
                              : DateUtilsHelper.formatToDayMonthYear(
                            event.eventDate.toString(),
                          ),
                          // eventDate:event.eventDate.toString()==''?"":DateUtilsHelper.formatToDayMonthYear(event.eventDate.toString(),
                          eventDescription: event.about,
                          eventUrl:  'www.jsdskdjhjdjdsbab',
                        );
                      },
                      child: EventCard(
                        showDateCard:event.eventDate.toString()==''? false:true,
                        month: dateData['month']!,
                        date: dateData['day']!,
                        title: event.eventName.toString(),
                        imagePath: event.image,
                        description:event.about,
                        eventUrl: 'www.restaurantlaunchparty.com',
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}