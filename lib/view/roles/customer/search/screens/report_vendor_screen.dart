// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../AppTheme/app_theme.dart';
// import '../../../../../app_widgets/custom_button.dart';
// import '../../../../../app_widgets/custom_dropdown.dart';
// import '../../../../../app_widgets/custom_textfield.dart';
// import '../../../../../constants/aap_assets.dart';
// import '../../../../../constants/app_text_style.dart';
// import '../../../../../constants/custom_validators.dart';
// import '../controller/vendor_booking_controller.dart';
//
// class ReportVendorScreen extends StatefulWidget {
//   const ReportVendorScreen({super.key});
//
//   @override
//   State<ReportVendorScreen> createState() => _ReportVendorScreenState();
// }
//
// class _ReportVendorScreenState extends State<ReportVendorScreen> {
//   final formKey = GlobalKey<FormState>();
//   late final VendorBookingController reportVendorController;
//
//   @override
//   void initState() {
//     super.initState();
//     reportVendorController = Get.find<VendorBookingController>();
//     // Clear form when screen is opened
//     reportVendorController.resetReportForm();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Clear form when user goes back
//         reportVendorController.resetReportForm();
//         return true;
//       },
//       child: Scaffold(
//         backgroundColor: AppTheme.paperWhiteColor,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, bottom: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           AppAssets.appLogo,
//                           width: 38,
//                           height: 32,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Report Vendor',
//                       style: AppTextStyle.f20W600BColorTextStyle,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       'Your report is anonymous. If someone is in immediate danger, call the local emergency services - ',
//                       style: AppTextStyle.f12W400DMBColorTextStyle,
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Form(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Vendor Name Section
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             'Vendor Name',
//                             style: AppTextStyle.f14W500DPColorTextStyle,
//                           ),
//                         ),
//                         CustomTextField(
//                           controller: reportVendorController.searchVendorController,
//                           fieldBorderColor: AppTheme.textfieldBorderColor,
//                           hintText: "Search Vendor",
//                           validator: CustomValidator.vendorName,
//                         ),
//
//                         // Reason Selection Section
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             'Why are you reporting this vendor?',
//                             style: AppTextStyle.f14W500DPColorTextStyle,
//                           ),
//                         ),
//                         Obx(() => CustomDropdownField(
//                           hintText: "Select a reason",
//                           value: reportVendorController.selectedReason.value,
//                           items: reportVendorController.reportReasons.map((reason) {
//                             return DropdownMenuItem<String>(
//                               value: reason,
//                               child: Text(reason),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             reportVendorController.selectReason(value);
//                           },
//                           hintTextColor: AppTheme.silverColor,
//                           inputTextColor: AppTheme.darkpurpleColor,
//                           dropdownIconColor: AppTheme.slateGreyColor,
//                           validator: CustomValidator.reasonCategory,
//                         )),
//
//                         // Description Section
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             'Tell us what happened',
//                             style: AppTextStyle.f14W500DPColorTextStyle,
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: 150,
//                               decoration: BoxDecoration(
//                                 color: AppTheme.whiteColor,
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                   color: AppTheme.textfieldBorderColor,
//                                 ),
//                               ),
//                               child: TextFormField(
//                                 controller: reportVendorController.descriptionController,
//                                 maxLines: null,
//                                 expands: true,
//                                 cursorColor: AppTheme.lightCyanColor,
//                                 textAlignVertical: TextAlignVertical.top,
//                                 validator: CustomValidator.reportDescription,
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(16),
//                                   border: InputBorder.none,
//                                   hintText: 'Description',
//                                   hintStyle: AppTextStyle.f16W400SColorTextStyle,
//                                   errorStyle: const TextStyle(height: 0, fontSize: 0),
//                                 ),
//                               ),
//                             ),
//                             // Error message displayed outside the container only after submit
//                             Obx(() {
//                               if (reportVendorController.showDescriptionError.value) {
//                                 final errorText = CustomValidator.reportDescription(
//                                   reportVendorController.descriptionController.text,
//                                 );
//                                 if (errorText != null) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(top: 8.0, left: 4.0),
//                                     child: Text(
//                                       errorText,
//                                       style: AppTextStyle.f12W400RColorTextStyle,
//                                     ),
//                                   );
//                                 }
//                               }
//                               return const SizedBox.shrink();
//                             }),
//                           ],
//                         ),
//
//                         // Upload Evidence Section
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             'Upload Evidence',
//                             style: AppTextStyle.f14W500DPColorTextStyle,
//                           ),
//                         ),
//                         DottedBorder(
//                           color: AppTheme.silverColor,
//                           strokeWidth: 1,
//                           dashPattern: const [5, 3],
//                           borderType: BorderType.RRect,
//                           radius: const Radius.circular(8),
//                           child: InkWell(
//                             onTap: () {
//                               print('Upload evidence tapped');
//                               // Add your file picker logic here
//                             },
//                             child: Container(
//                               height: 72,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     AppAssets.uploadCloudIcon,
//                                     height: 24,
//                                     width: 24,
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'Upload',
//                                     style: AppTextStyle.f14W500SColorTextStyle,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         // Submit Button
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 24),
//                           child: CustomButton(
//                             Text: 'Submit Report',
//                             width: double.infinity,
//                             height: 48,
//                             buttonColor: AppTheme.lightCyanColor,
//                             textColor: AppTheme.whiteColor,
//                             onTap: () {
//                               // Show errors when user tries to submit
//                               reportVendorController.showDescriptionError.value = true;
//                               // Validate the form
//                               if (formKey.currentState!.validate()) {
//                                 // Submit the report
//                                 reportVendorController.submitReport();
//                                 // Reset error flag
//                                 reportVendorController.showDescriptionError.value = false;
//
//                                 Future.delayed(const Duration(seconds: 1), () {
//                                   Get.back();
//                                 });
//                               }
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
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
  final CustomImagePicker _imagePicker = CustomImagePicker();

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
                      'Your report is anonymous. If someone is in immediate danger, call the local emergency services - ',
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
                        // Vendor Name Section
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

                        // Reason Selection Section
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Why are you reporting this vendor?',
                            style: AppTextStyle.f14W500DPColorTextStyle,
                          ),
                        ),
                        Obx(() => CustomDropdownField(
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
                        )),

                        // Description Section
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Tell us what happened',
                            style: AppTextStyle.f14W500DPColorTextStyle,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppTheme.textfieldBorderColor,
                                ),
                              ),
                              child: TextFormField(
                                controller: reportVendorController.descriptionController,
                                maxLines: null,
                                expands: true,
                                cursorColor: AppTheme.lightCyanColor,
                                textAlignVertical: TextAlignVertical.top,
                                validator: CustomValidator.reportDescription,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  border: InputBorder.none,
                                  hintText: 'Description',
                                  hintStyle: AppTextStyle.f16W400SColorTextStyle,
                                  errorStyle: const TextStyle(height: 0, fontSize: 0),
                                ),
                              ),
                            ),
                            // Error message displayed outside the container only after submit
                            Obx(() {
                              if (reportVendorController.showDescriptionError.value) {
                                final errorText = CustomValidator.reportDescription(
                                  reportVendorController.descriptionController.text,
                                );
                                if (errorText != null) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0, left: 4.0),
                                    child: Text(
                                      errorText,
                                      style: AppTextStyle.f12W400RColorTextStyle,
                                    ),
                                  );
                                }
                              }
                              return const SizedBox.shrink();
                            }),
                          ],
                        ),

                        // Upload Evidence Section
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Upload Evidence',
                            style: AppTextStyle.f14W500DPColorTextStyle,
                          ),
                        ),
                        Obx(() {
                          final selectedImage = reportVendorController.selectedEvidenceImage.value;

                          if (selectedImage != null) {
                            // Show selected image with option to remove
                            return Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppTheme.textfieldBorderColor,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      selectedImage,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Remove button
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        reportVendorController.removeEvidenceImage();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: AppTheme.blackColor.withOpacity(0.6),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: AppTheme.whiteColor,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Change image button
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final image = await _imagePicker.pickImageFromGallery();
                                        if (image != null) {
                                          reportVendorController.setEvidenceImage(image);
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.lightCyanColor,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              color: AppTheme.whiteColor,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Change',
                                              style: AppTextStyle.f12W500WColorTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          // Show upload area
                          return DottedBorder(
                            color: AppTheme.silverColor,
                            strokeWidth: 1,
                            dashPattern: const [5, 3],
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(8),
                            child: InkWell(
                              onTap: () async {
                                final image = await _imagePicker.pickImageFromGallery();
                                if (image != null) {
                                  reportVendorController.setEvidenceImage(image);
                                }
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
                          );
                        }),

                        // Submit Button
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: CustomButton(
                            Text: 'Submit Report',
                            width: double.infinity,
                            height: 48,
                            buttonColor: AppTheme.lightCyanColor,
                            textColor: AppTheme.whiteColor,
                            onTap: () {
                              // Show errors when user tries to submit
                              reportVendorController.showDescriptionError.value = true;
                              // Validate the form
                              if (formKey.currentState!.validate()) {
                                // Submit the report
                                reportVendorController.submitReport();
                                // Reset error flag
                                reportVendorController.showDescriptionError.value = false;

                                Future.delayed(const Duration(seconds: 1), () {
                                  Get.back();
                                });
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