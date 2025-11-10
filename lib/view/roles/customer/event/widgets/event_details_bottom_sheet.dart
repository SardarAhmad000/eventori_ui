import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/roles/customer/event/widgets/feature_event.dart';
import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_button.dart';
import 'package:eventori/app_widgets/custom_image_handler.dart';

import '../../../../../app_widgets/custom_textfield.dart';

void showEventDetailsBottomSheet({
  required BuildContext context,
  required String eventImage,
  required String eventTitle,
  required String eventDate,
  String? eventDescription,
  String? eventUrl,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => EventDetailsBottomSheet(
      eventImage: eventImage,
      eventTitle: eventTitle,
      eventDate: eventDate,
      eventDescription: eventDescription,
      eventUrl: eventUrl,
    ),
  );
}

class EventDetailsBottomSheet extends StatefulWidget {
  final String eventImage;
  final String eventTitle;
  final String eventDate;
  final String? eventDescription;
  final String? eventUrl;

  const EventDetailsBottomSheet({
    Key? key,
    required this.eventImage,
    required this.eventTitle,
    required this.eventDate,
    this.eventDescription,
    this.eventUrl,
  }) : super(key: key);

  @override
  State<EventDetailsBottomSheet> createState() => _EventDetailsBottomSheetState();
}

class _EventDetailsBottomSheetState extends State<EventDetailsBottomSheet> {
  late final TextEditingController _eventUrlController;
  // bool _isFeatured = false;

  @override
  void initState() {
    super.initState();
    _eventUrlController = TextEditingController(text: widget.eventUrl ?? '');
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 52,
            height: 3,
            decoration: BoxDecoration(
              color: AppTheme.lightIndigoColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomImageHandler(
                    imagePath: widget.eventImage,
                    width: double.infinity,
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                    widget.eventTitle,
                    style: AppTextStyle.f20W600BColorTextStyle
                ),
                const SizedBox(height: 12),
                Text(
                    widget.eventDate,
                    style: AppTextStyle.f16W500BColorTextStyle,
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                        'About',
                        style: AppTextStyle.f18W600BColorTextStyle
                    ),
                    const SizedBox(height: 8),
                    Text(
                        widget.eventDescription!,
                        style: AppTextStyle.f14W400SGColorTextStyle
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CustomButton(
                  Text: 'Feature this event',
                  width: double.infinity,
                  fontWeight: FontWeight.w700,
                  height: 48,
                  buttonColor: AppTheme.whiteColor,
                  textColor: AppTheme.silverColor,
                  borderColor: AppTheme.textfieldBorderColor,
                  textSize: 16,
                  isAuth: true,
                  iconOnRight: true,
                  iconPath: AppAssets.starIcon,
                  // iconColor: _isFeatured ? AppTheme.amber : AppTheme.silverColor,
                  iconHeight: 20,
                  onTap: (){
                      featureEventBottomSheet(
                        context: context,
                        eventTitle: widget.eventTitle,
                        eventDate: widget.eventDate,
                      );
                  },
                ),

                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Event URL',
                        style:AppTextStyle.f16W500BColorTextStyle
                    ),
                    const SizedBox(height: 8),
                    AbsorbPointer(
                      child: CustomTextField(
                        controller: _eventUrlController,
                        hintText: 'Enter event URL',
                        fillColor: AppTheme.whiteColor,
                        fieldBorderColor: AppTheme.textfieldBorderColor,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Image.asset(
                              AppAssets.copyIcon,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
// void _copyUrlToClipboard() {
//   if (_eventUrlController.text.isNotEmpty) {
//     Clipboard.setData(ClipboardData(text: _eventUrlController.text));
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           'URL copied to clipboard',
//           style: TextStyle(fontFamily: AppFonts.medium),
//         ),
//         backgroundColor: AppTheme.cyanColor,
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }
// }
}