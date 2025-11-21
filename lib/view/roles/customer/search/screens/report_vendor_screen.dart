import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../controller/vendor_booking_controller.dart';

class ReportVendorScreen extends StatefulWidget {
  const ReportVendorScreen({super.key});

  @override
  State<ReportVendorScreen> createState() => _ReportVendorScreenState();
}

class _ReportVendorScreenState extends State<ReportVendorScreen> {
  final formKey = GlobalKey<FormState>();
  late final VendorBookingController reportVendorController;

  @override
  void initState() {
    super.initState();
    reportVendorController = Get.find<VendorBookingController>();
    // Clear form when screen is opened
    reportVendorController.resetReportForm();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Clear form when user goes back
        reportVendorController.resetReportForm();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppTheme.paperWhiteColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAssets.appLogo,
                          width: 38,
                          height: 32,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Report Vendor',
                      style: AppTextStyle.f20W600BColorTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your report is anonymous. If someone is in immediate danger, call the local emergency services - don’t wait.',
                      style: AppTextStyle.f12W400DMBColorTextStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
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
                          controller: reportVendorController.searchVendorController,
                          fieldBorderColor: AppTheme.textfieldBorderColor,
                          hintText: "Search Vendor",
                          validator: CustomValidator.vendorName,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Why are you reporting this vendor?',
                            style: AppTextStyle.f14W500DPColorTextStyle,
                          ),
                        ),

                        // Dropdown for reason selection
                        Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdownField(
                              hintText: "Select a reason",
                              value: reportVendorController.selectedReason.value,
                              items: reportVendorController.reportReasons.map((reason) {
                                return DropdownMenuItem<String>(
                                  value: reason,
                                  child: Text(reason),
                                );
                              }).toList(),
                              onChanged: (value) {
                                reportVendorController.selectReason(value);
                              },
                              hintTextColor: AppTheme.silverColor,
                              inputTextColor: AppTheme.darkpurpleColor,
                              dropdownIconColor: AppTheme.slateGreyColor,
                              validator: CustomValidator.reasonCategory,
                            ),
                          ],
                        )),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Tell us what happened',
                            style: AppTextStyle.f14W500DPColorTextStyle,
                          ),
                        ),
                        Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: reportVendorController.descriptionError.value != null
                                      ? AppTheme.lightCyanColor
                                      : AppTheme.textfieldBorderColor,
                                ),
                              ),
                              child: TextFormField(
                                controller: reportVendorController.descriptionController,
                                maxLines: null,
                                expands: true,
                                cursorColor: AppTheme.lightCyanColor,
                                textAlignVertical: TextAlignVertical.top,
                                validator: CustomValidator.reportDescription,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    reportVendorController.descriptionError.value = null;
                                  }
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(16),
                                  border: InputBorder.none,
                                  hintText: 'Description',
                                  hintStyle: AppTextStyle.f16W400SColorTextStyle,
                                ),
                              ),
                            ),
                            // Display error message if validation fails
                            if (reportVendorController.descriptionError.value != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                                child: Text(
                                  reportVendorController.descriptionError.value!,
                                  style: AppTextStyle.f12W400RColorTextStyle
                                ),
                              ),
                          ],
                        )),
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
                          child: InkWell(
                            onTap: () {
                              print('Upload evidence tapped');

                            },
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: CustomButton(
                            Text: 'Submit Report',
                            width: double.infinity,
                            height: 48,
                            buttonColor: AppTheme.lightCyanColor,
                            textColor: AppTheme.whiteColor,
                            onTap: () {
                              // Validate the form
                              if (formKey.currentState!.validate()) {
                                // Submit the report (printing happens in controller)
                                reportVendorController.submitReport();

                                // Navigate back after successful submission
                                Future.delayed(Duration(seconds: 1), () {
                                  Get.back();
                                });
                              } else {
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}