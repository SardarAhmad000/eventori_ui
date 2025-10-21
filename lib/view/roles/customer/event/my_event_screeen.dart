import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/roles/customer/event/widgets/event_card.dart';
import 'package:flutter/material.dart';
import '../../../../AppTheme/widgets/app_theme.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'My events',
              style: AppTextStyle.myEventTitle,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                physics: ScrollPhysics(),
                padding: EdgeInsets.zero,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return EventCard(
                  date: '10',
                  month: 'Jun',
                  title: 'Restaurant Launch Party',
                  imagePath: AppAssets.eventImage2,
                );
              }),
            ),
            const SizedBox(height: 65),
          ],
        ),
      ),
    );
  }
}