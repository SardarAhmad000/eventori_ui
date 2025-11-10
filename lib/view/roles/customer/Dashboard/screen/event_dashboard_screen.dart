import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../widgets/collaborator_card.dart';
import '../widgets/count_down_card.dart';
import '../widgets/invite_more_card.dart';
import '../widgets/message_card.dart';
import '../widgets/stats_card.dart';
import '../widgets/vendor_card.dart';

class EventDashboardScreen extends StatefulWidget {
  const EventDashboardScreen({super.key});
  @override
  State<EventDashboardScreen> createState() => _EventDashboardScreenState();
}

class _EventDashboardScreenState extends State<EventDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20.0),
                 child: Image.asset(
                   width: 38,
                   height: 32,
                   AppAssets.appLogo,
                 ),
               ),
               SizedBox(height: 4,),
               SizedBox(
                 height: 47,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       children: [
                         GestureDetector(
                           onTap: (){
                           },
                           child: CircleAvatar(
                             radius: 20,
                             backgroundColor: AppTheme.denimBlueColor,
                           ),
                         ),
                         const SizedBox(width: 8),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Hi Noraiz',
                                 style: AppTextStyle.f12W400SGColorTextStyle),
                             const SizedBox(height: 2),
                             Text('Every detail, right  at your fingertips ',
                                 style: AppTextStyle.f13W400BColorTextStyle),
                           ],
                         ),
                       ],
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image.asset(AppAssets.bellIcon, color: AppTheme.charcoalBlueColor,
                             width: 18, height: 18),
                         SizedBox(width: 1.w),
                         Image.asset(AppAssets.heartIcon, color: AppTheme.charcoalBlueColor,
                             width: 18, height: 18),
                         SizedBox(width: 1.w),
                         Image.asset(AppAssets.settingsIcon, color: AppTheme.charcoalBlueColor,
                             width: 18, height: 18),
                       ],
                     ),
                   ],
                 ),
               ),

               SizedBox(
                 height: 16.h,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemCount: 5,
                   itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.only(right: 0),
                       child: StatsCard(
                         iconPath: AppAssets.walletIcon,
                         iconColor: AppTheme.redColor,
                         value: '£3,500/2000',
                         label: 'Budget Spent',
                       ),
                     );
                   },
                 ),
               ),

               const SizedBox(height: 12),

               CountdownCard(
                 title: "Sarah's 34th Birthday Dinner",
                 backgroundImage: AppAssets.featuredImage1,
                 targetDate: DateTime(2025, 11, 11, 12, 00),
               ),

               const SizedBox(height: 20),

               Container(
                 width: 100.w,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(16),
                     color: AppTheme.whiteColor
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Collaborator',style: AppTextStyle.f18W500BColorTextStyle),
                       const SizedBox(height: 12),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                             child: SizedBox(
                               height: 85,
                               child: ListView.builder(
                                 scrollDirection: Axis.horizontal,
                                 physics: const AlwaysScrollableScrollPhysics(),
                                 itemCount: 5,
                                 itemBuilder: (context, index) {
                                   return Padding(
                                     padding: const EdgeInsets.only(right: 0),
                                     child: CollaboratorCard(
                                       name: 'Just Planned',
                                       imagePath: AppAssets.vendorDummyImage,
                                       isOnline: false,
                                       lastActive: 'Last active 2hr',
                                       role: 'Event planner (Me)',
                                     ),
                                   );
                                 },
                               ),
                             ),
                           ),
                           InviteMoreCard(
                             onTap: () {
                               print('Invite more tapped');
                             },
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),

               const SizedBox(height: 20),

               Container(
                 width: 100.w,
                 // height: 45.h,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(16),
                     color: AppTheme.whiteColor
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             'Vendor',
                             style: AppTextStyle.f18W500BColorTextStyle,
                           ),
                           Text(
                             'Price',
                             style: AppTextStyle.f18W500BColorTextStyle,
                           ),
                         ],
                       ),
                       Divider(color: AppTheme.dividerColor,),
                       SizedBox(
                         height: 27.h,
                         child: ListView.builder(
                           physics: const AlwaysScrollableScrollPhysics(),
                           padding: EdgeInsets.zero,
                           itemCount: 5,
                           itemBuilder: (context, index) {
                             return VendorCard(
                               imageUrl: AppAssets.picImage,
                               name: 'Photo Time',
                               profession: 'Photographer',
                               status: 'Pending',
                               price: 1200,
                               onTap: () {
                                 print('Vendor tapped');
                               },
                             );
                           },
                         ),
                       ),
                     ],
                   ),
                 ),
               ),

               const SizedBox(height: 20),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Messages', style: AppTextStyle.f18W500DPColorTextStyle),
                   GestureDetector(
                     onTap: () {},
                     child: Text('View All', style: AppTextStyle.f14W500LCColorTextStyle),
                   ),
                 ],
               ),
               const SizedBox(height: 12),

               Container(
                 height: 30.h,
                 decoration: BoxDecoration(
                   color: AppTheme.whiteColor,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 child: ListView.builder(
                   padding: EdgeInsets.zero,
                   physics: const AlwaysScrollableScrollPhysics(),
                   itemCount: 5,
                   itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: MessageCard(
                         name: 'The Sweet Platter',
                         message: 'i have booked your consultation',
                         timeAgo: '1hr ago',
                         imagePath: AppAssets.featuredImage1,
                         isNetworkImage: false,
                       ),
                     );
                   },
                 ),
               ),

               SizedBox(height: 100)
             ],
           ),
         ),
      ),
    );
  }
}
