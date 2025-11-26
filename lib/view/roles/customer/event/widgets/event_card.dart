// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../../AppTheme/widgets/app_theme.dart';
// import '../../../../../constants/aap_assets.dart';
// import '../../../../../constants/app_text_style.dart';
// import '../../../../../app_widgets/custom_image_handler.dart';
//
// class EventCard extends StatelessWidget {
//   final String date;
//   final String month;
//   final String title;
//   final String imagePath;
//
//   const EventCard({
//     Key? key,
//     required this.date,
//     required this.month,
//     required this.title,
//     required this.imagePath,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 16),
//       height: 270,
//       width: 100.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: AppTheme.blackColor.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(16),
//         child: Stack(
//           children: [
//             // Background Image using CustomImageHandler
//             Positioned.fill(
//               child: CustomImageHandler(
//                 imagePath: imagePath,
//                 fit: BoxFit.cover,
//                 loaderColor: AppTheme.purplishColor,
//                 errorAsset: AppAssets.eventImage1,
//               ),
//             ),
//
//             // Gradient Overlay
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       AppTheme.blackColor.withOpacity(0.0),
//                       AppTheme.blackColor.withOpacity(0.7),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // Content
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Date Badge
//                   _buildDateBadge(),
//
//                   // Event Title
//                   Text(
//                     title,
//                     style: AppTextStyle.myEventName,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDateBadge() {
//     return SizedBox(
//       width: 40,
//       height: 64,
//       child: Column(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: AppTheme.textfieldBorderColor,
//                 width: 1,
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 date,
//                 style: AppTextStyle.myEventdate,
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             month,
//             style: AppTextStyle.myEventmonth,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import 'event_details_bottom_sheet.dart';

class EventCard extends StatelessWidget {
  final String date;
  final String month;
  final String title;
  final String imagePath;
  final String? description;
  final String? eventUrl;

  const EventCard({
    Key? key,
    required this.date,
    required this.month,
    required this.title,
    required this.imagePath,
    this.description,
    this.eventUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showEventDetailsBottomSheet(
          context: context,
          eventImage: imagePath,
          eventTitle: title,
          eventDate: '$date $month, 2025',
          eventDescription: description ??
              'Wedding Gala 2025 is a grand celebration bringing together families, friends, and professionals from the wedding industry.',
          eventUrl: eventUrl ?? 'www.jsdskdjhjdjdsbab',
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 270,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppTheme.blackColor.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: CustomImageHandler(
                  imagePath: imagePath,
                  fit: BoxFit.cover,
                  loaderColor: AppTheme.purplishColor,
                  errorAsset: AppAssets.eventImage1,
                ),
              ),

              // Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.blackColor.withOpacity(0.0),
                        AppTheme.blackColor.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Badge
                    SizedBox(
                      width: 40,
                      height: 64,
                      child: Column(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(date, style: AppTextStyle.f20W500WColorTextStyle),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(month, style: AppTextStyle.f12W400PWColorTextStyle),
                        ],
                      ),
                    ),

                    // Title
                    Text(title, style: AppTextStyle.f20W600PWColorTextStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}