import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../../../../app_widgets/custom_radio_button.dart';
import '../controller/event_controller.dart';

void featureEventBottomSheet({
  required BuildContext context,
  required String eventid,
  required String eventTitle,
  required String eventDate,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FeatureEventBottomSheet(
      eventid: eventid,
      eventTitle: eventTitle,
      eventDate: eventDate,
    ),
  );
}

class FeatureEventBottomSheet extends StatelessWidget {
  EventController eventController =Get.find();
  final String eventid;
  final String eventTitle;
  final String eventDate;

  FeatureEventBottomSheet({
    Key? key,
    required this.eventid,
    required this.eventTitle,
    required this.eventDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment method',
                    style: AppTextStyle.f16W500MBColorTextStyle,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.stormyGrayColor,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: AppTheme.stormyGrayColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle,
                    style: AppTextStyle.f20W600BColorTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    eventDate,
                    style: AppTextStyle.f14W400SGColorTextStyle,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Featured your event',
                    style: AppTextStyle.f16W500BColorTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your event will be prominently featured at the top of search results and category pages for the duration of your plan, helping you reach more attendees',
                    style: AppTextStyle.f14W400SGColorTextStyle,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Select a promotion plan',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomRadioButton(
                          label: '7 day promotion \$12.00',
                          isSelected: eventController.selectedPromotionPlan.value == '7day',
                          onTap: () => eventController.selectPromotionPlan('7day'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomRadioButton(
                          label: '30 day promotion \$12.00',
                          isSelected: eventController.selectedPromotionPlan.value == '30day',
                          onTap: () => eventController.selectPromotionPlan('30day'),
                        ),
                      )
                    ],
                  )),
                  const SizedBox(height: 20),
                  Text(
                    'Select payment method',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomRadioButton(
                          label: 'Card payment',
                          isSelected: eventController.selectedPaymentMethod.value == 'card',
                          onTap: () => eventController.selectPaymentMethod('card'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomRadioButton(
                          label: 'Paypal',
                          isSelected: eventController.selectedPaymentMethod.value == 'paypal',
                          onTap: () => eventController.selectPaymentMethod('paypal'),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 24,
                              color: AppTheme.charcoalVioletColor.withOpacity(.3),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Add new method',
                              style: AppTextStyle.f12W400DSBColorTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(height: 20),
                  Text(
                    'Promotion',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Premotion plan \$15.00',
                    style: AppTextStyle.f12W400DSBColorTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Service fee \$02',
                    style: AppTextStyle.f12W400DSBColorTextStyle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Total \$17.00',
                    style: AppTextStyle.f12W400DSBColorTextStyle,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          Text: 'Cancel',
                          height: 48,
                          buttonColor: AppTheme.whiteColor,
                          textColor: AppTheme.blackColor,
                          borderColor: AppTheme.lightCyanColor,
                          textSize: 16,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          Text: 'Pay and featured',
                          height: 48,
                          buttonColor: AppTheme.lightCyanColor,
                          textColor: AppTheme.whiteColor,
                          textSize: 16,
                          onTap: () {
                            print("objects sss ${eventid}");
                            // eventController.handlePayment();
                            eventController.featuredEvent(eventid);

                          }
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}