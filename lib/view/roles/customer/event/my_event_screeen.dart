// import 'package:eventori/constants/aap_assets.dart';
// import 'package:eventori/constants/app_text_style.dart';
// import 'package:eventori/view/roles/customer/event/widgets/event_card.dart';
// import 'package:flutter/material.dart';
// import '../../../../AppTheme/widgets/app_theme.dart';
// import '../../../onboarding/widgets/build_header.dart';
//
// class MyEventsScreen extends StatefulWidget {
//   const MyEventsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MyEventsScreen> createState() => _MyEventsScreenState();
// }
//
// class _MyEventsScreenState extends State<MyEventsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.whiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             CustomHeader(
//               backgroundColor: AppTheme.whiteColor,
//               arrowColor: AppTheme.blackColor,
//               containerBackgroundColor: AppTheme.whiteColor,
//               borderColor: AppTheme.lightGrayishColor,
//               showLogo: true,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'My events',
//               style: AppTextStyle.myEventTitle,
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView.builder(
//                 physics: ScrollPhysics(),
//                 padding: EdgeInsets.zero,
//                   itemCount: 4,
//                   shrinkWrap: true,
//                   itemBuilder: (context,index){
//                 return EventCard(
//                   date: '10',
//                   month: 'Jun',
//                   title: 'Restaurant Launch Party',
//                   imagePath: AppAssets.eventImage2,
//                 );
//               }),
//             ),
//             // const SizedBox(height: 65),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/roles/customer/event/widgets/event_card.dart';
import 'package:flutter/material.dart';
import '../../../../AppTheme/app_theme.dart';
import '../../../onboarding/widgets/build_header.dart';

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
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),
            const SizedBox(height: 20),
            Text('My events', style: AppTextStyle.f24W600BColorTextStyle),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return EventCard(
                    date: '10',
                    month: 'Jun',
                    title: 'Restaurant Launch Party',
                    imagePath: AppAssets.eventImage2,
                    description: 'Join us for an exclusive evening celebrating the grand opening of our new restaurant.',
                    eventUrl: 'www.restaurantlaunchparty.com',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}