// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../../AppTheme/app_theme.dart';
// import '../../../../../app_widgets/custom_button.dart';
// import '../../../../../app_widgets/custom_image_handler.dart';
// import '../../../../../constants/aap_assets.dart';
// import '../../../../../constants/app_text_style.dart';
//
// class VendorDetailCard extends StatelessWidget {
//   final List<String> imagePaths;
//   final String profileImage;
//   final String vendorName;
//   final bool isTopRated;
//   final double rating;
//   final bool isVerified;
//   final bool isFastResponder;
//   final bool isEstablished;
//   final bool isRisingStar;
//   final VoidCallback? onAddToEvent;
//   final VoidCallback? onContact;
//
//   const VendorDetailCard({
//     Key? key,
//     required this.imagePaths,
//     required this.profileImage,
//     required this.vendorName,
//     this.isTopRated = false,
//     required this.rating,
//     this.isVerified = false,
//     this.isFastResponder = false,
//     this.isEstablished = false,
//     this.isRisingStar = false,
//     this.onAddToEvent,
//     this.onContact,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppTheme.whiteColor,
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(16),
//           bottomRight: Radius.circular(16),
//         ),
//       ),
//       child: Column(
//         children: [
//           SizedBox(
//             height: 120,
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.center,
//               children: [
//                 // Horizontal Image Gallery
//                 SizedBox(
//                   width: 100.w,
//                   height: 120,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: imagePaths.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.only(
//                           right: index < imagePaths.length - 1 ? 12 : 0,
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: CustomImageHandler(
//                             imagePath: imagePaths[index],
//                             width: 98,
//                             height: 120,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//                 // Profile Image Positioned Over Images
//                 Positioned(
//                   bottom: -55,
//                   child: Container(
//                     width: 94,
//                     height: 94,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: AppTheme.lightCyanColor,
//                         width: 3,
//                       ),
//                     ),
//                     child: ClipOval(
//                       child: CustomImageHandler(
//                         imagePath: profileImage,
//                         width: 94,
//                         height: 94,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 70),
//
//           // Vendor Name
//           Text(
//             vendorName,
//             style: AppTextStyle.f18W500BColorTextStyle,
//             textAlign: TextAlign.center,
//           ),
//
//           const SizedBox(height: 16),
//
//           // Badges Section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Wrap(
//               alignment: WrapAlignment.start,
//               spacing: 4,
//               runSpacing: 8,
//               children: [
//                 if (isTopRated)
//                   _BadgeItem(
//                     icon: AppAssets.topRatedBadgeIcon,
//                     label: 'Top- rated',
//                     backgroundColor: AppTheme.blueGrayColor,
//                   ),
//                 _BadgeItem(
//                   icon: AppAssets.starIcon,
//                   label: 'Star Rating',
//                   backgroundColor: AppTheme.blueGrayColor.withOpacity(.8),
//                 ),
//                 if (isVerified)
//                   _BadgeItem(
//                     icon: AppAssets.verifiedIcon,
//                     label: 'Verified Id',
//                     backgroundColor: AppTheme.blueGrayColor.withOpacity(.7),
//                   ),
//                 if (isFastResponder)
//                   _BadgeItem(
//                     icon: Icons.bolt,
//                     label: 'Fast Responder',
//                     backgroundColor: AppTheme.blueGrayColor.withOpacity(.6),
//                     isIconData: true,
//                   ),
//                 if (isEstablished)
//                   _BadgeItem(
//                     icon: Icons.account_balance,
//                     label: 'Established',
//                     backgroundColor: AppTheme.blueGrayColor.withOpacity(.5),
//                     isIconData: true,
//                   ),
//                 if (isRisingStar)
//                   _BadgeItem(
//                     icon: Icons.rocket_launch,
//                     label: 'Rising Star',
//                     backgroundColor: AppTheme.blueGrayColor.withOpacity(.3),
//                     isIconData: true,
//                   ),
//
//               ],
//             ),
//           ),
//
//           // Action Buttons
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     Text: "Add to event",
//                     onTap: onAddToEvent ?? () {},
//                     buttonColor: AppTheme.lightCyanColor,
//                     textColor: AppTheme.whiteColor,
//                     height: 48,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: CustomButton(
//                     Text: "Contact",
//                     onTap: onContact ?? () {},
//                     buttonColor: AppTheme.whiteColor,
//                     textColor: AppTheme.lightCyanColor,
//                     height: 48,
//                     borderColor: AppTheme.lightCyanColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Separate Badge Widget
// class _BadgeItem extends StatelessWidget {
//   final dynamic icon;
//   final String label;
//   final Color backgroundColor;
//   final bool isIconData;
//
//   const _BadgeItem({
//     required this.icon,
//     required this.label,
//     required this.backgroundColor,
//     this.isIconData = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 29.w,
//       padding: const EdgeInsets.symmetric(horizontal:8, vertical: 4),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           if (isIconData)
//             Icon(
//               icon as IconData,
//               color: AppTheme.whiteColor,
//               size: 16,
//             )
//           else
//             Image.asset(
//               icon as String,
//               color: AppTheme.whiteColor,
//               width: 16,
//               height: 16,
//             ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: AppTextStyle.f12W400WColorTextStyle,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }