import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../../home/controller/home_controller.dart';
import '../controller/vendor_booking_controller.dart';

class ReportVendorScreen extends StatefulWidget {
  const ReportVendorScreen({super.key});

  @override
  State<ReportVendorScreen> createState() => _ReportVendorScreenState();
}

class _ReportVendorScreenState extends State<ReportVendorScreen> {
  final formKey = GlobalKey<FormState>();
  final CustomImagePicker _imagePicker = CustomImagePicker();
  VendorBookingController vendorBookingController = Get.find();
  HomeController homeController = Get.find();
  int venId = 0;
  final Map<String, dynamic> args = Get.arguments ?? {};

  @override
  void initState() {
    super.initState();
    vendorBookingController.resetReportForm();
    venId = args['vendorId'];
    print("vendor is ${venId}");
    print(venId.toString()+"sajdas");
  }
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
                        controller: vendorBookingController.searchVendorController,
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
                        value: vendorBookingController.selectedReason.value,
                        items: vendorBookingController.reportReasons.map((reason) {
                          return DropdownMenuItem<String>(
                            value: reason,
                            child: Text(reason),
                          );
                        }).toList(),
                        onChanged: (value) {
                          vendorBookingController.selectReason(value);
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
                      Container(
                          height: 150,
                          child: CustomTextField(
                            controller: vendorBookingController.descriptionController,
                            maxLines: 8,
                            hintText: 'Description',
                            fillColor: AppTheme.whiteColor,
                            // fieldBorderColor: AppTheme.textfieldBorderColor,
                            inputTextColor: AppTheme.blackColor,
                            borderRadius: 12,
                            validator:  CustomValidator.reportDescription,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(500),
                            ],
                          )
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
                        final selectedImage = vendorBookingController.selectedEvidenceImage.value;
                        final showError = vendorBookingController.showEvidenceError.value;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (selectedImage != null) ...[
                              // Show selected image with option to remove
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: showError ? AppTheme.redColor : AppTheme.textfieldBorderColor,
                                    width: showError ? 2 : 1,
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
                                          vendorBookingController.removeEvidenceImage();
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
                                            vendorBookingController.setEvidenceImage(image);
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
                              ),
                            ] else ...[
                              // Show upload area
                              DottedBorder(
                                color: showError ? AppTheme.redColor : AppTheme.silverColor,
                                strokeWidth: showError ? 2 : 1,
                                dashPattern: const [5, 3],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(8),
                                child: InkWell(
                                  onTap: () async {
                                    final image = await _imagePicker.pickImageFromGallery();
                                    if (image != null) {
                                      vendorBookingController.setEvidenceImage(image);
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
                              ),
                            ],
                            // Error message
                            if (showError && selectedImage == null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8, left: 12),
                                child: Text(
                                  'Please upload an evidence image',
                                  style: AppTextStyle.f12W400RColorTextStyle
                                ),
                              ),
                          ],
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
                          onTap: () async{
                            // Show errors when user tries to submit
                            vendorBookingController.showDescriptionError.value = true;
                            vendorBookingController.showEvidenceError.value = true;

                            // Validate the form
                            if (formKey.currentState!.validate() &&
                                vendorBookingController.selectedEvidenceImage.value != null) {

                              vendorBookingController.submitReport();

                              vendorBookingController.showDescriptionError.value = false;
                              vendorBookingController.showEvidenceError.value = false;

                              print("VendorID is ${venId}");

                              await vendorBookingController.reportVendor(
                                vendorBookingController.searchVendorController.text,
                                vendorBookingController.selectedReason.value ?? '',
                                vendorBookingController.descriptionController.text,
                                vendorBookingController.imagePath.value,
                                venId.toString(),
                              );
                              homeController.getAllVendors();
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
    );
  }
}