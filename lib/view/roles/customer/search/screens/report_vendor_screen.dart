import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';

class ReportVendorScreen extends StatefulWidget {
  const ReportVendorScreen({super.key});

  @override
  State<ReportVendorScreen> createState() => _ReportVendorScreenState();
}

class _ReportVendorScreenState extends State<ReportVendorScreen> {
  final TextEditingController searchVendorController = TextEditingController();
  final TextEditingController reasonVendorController = TextEditingController();
  final TextEditingController descpritionController = TextEditingController();


  final List<String> reportReasons = [
    'Inappropriate behavior',
    'Spam or scam',
    'Fake profile',
    'Poor service quality',
    'Unprofessional conduct',
    'Other',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssets.appLogo,
                    width: 38,
                    height: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Report Vendor',
                    style: AppTextStyle.f20W600BColorTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Your report is anonymous. If someone is in immediate danger, call the local emergency services - don’t wait. ',
                    style: AppTextStyle.f12W400DMBColorTextStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Vendor Name',
                        style: AppTextStyle.f14W500DPColorTextStyle,
                      ),
                    ),
                    CustomTextField(
                      // controller: ,
                      fieldBorderColor: AppTheme.textfieldBorderColor,
                      hintText: "Search Vendor",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Why are you reporting this vendor?',
                        style: AppTextStyle.f14W500DPColorTextStyle,
                      ),
                    ),
                    CustomTextField(
                      // controller: ,
                      fieldBorderColor: AppTheme.textfieldBorderColor,
                      hintText: "Search a Reason",
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppTheme.silverColor,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Tell us what happened',
                        style: AppTextStyle.f14W500DPColorTextStyle,
                      ),
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.textfieldBorderColor),
                      ),
                      child: TextField(
                        controller: descpritionController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          border: InputBorder.none,
                          hintText: 'Description',
                          hintStyle: AppTextStyle.f16W400SColorTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        'Upload Evidence',
                        style: AppTextStyle.f14W500DPColorTextStyle,
                      ),
                    ),
                    DottedBorder(
                      color: AppTheme.silverColor,
                      strokeWidth: 1,
                      dashPattern: const [5, 3],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      child: Container(
                        height: 72,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.uploadCloudIcon,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Upload',
                              style: AppTextStyle.f14W500SColorTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: CustomButton(
                        Text: 'Submit Report',
                        width: double.infinity,
                        height: 48,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),

    );
  }
}
