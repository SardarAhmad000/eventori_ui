import 'dart:ffi';

import 'package:eventori/models/event_model.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/customer/event/controller/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_image_handler.dart';

class EventCard extends StatelessWidget {
  final String date;
  final String month;
  final String title;
  final String imagePath;
  final String? description;
  final String? eventUrl;
  final bool showDateCard;
  final EventModel event;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;

  const EventCard({
    Key? key,
    required this.date,
    required this.month,
    required this.title,
    required this.imagePath,
    this.description,
    this.eventUrl,
    this.showDateCard = true,
    this.onEditTap,
    this.onDeleteTap,
    required this.event, // Require event object
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuKey = GlobalKey();
    return Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 64,
                        child: showDateCard
                            ? Column(
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
                                child: Text(
                                  date,
                                  style: AppTextStyle
                                      .f20W500WColorTextStyle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              month,
                              style:
                              AppTextStyle.f12W400PWColorTextStyle,
                            ),
                          ],
                        )
                            : const SizedBox.shrink(),
                      ),
                      CustomPopupMenu(
                        menuKey: menuKey,
                        options: [
                          PopupMenuOption(
                            title: 'Edit Event',
                            onTap: onEditTap ?? () {},
                          ),
                          PopupMenuOption(
                            title: 'Delete Event',
                            onTap: onDeleteTap ?? () {},
                          ),
                        ],
                        child: Icon(
                          Icons.more_vert,
                          size: 24,
                          color: AppTheme.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: AppTextStyle.f20W600PWColorTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}