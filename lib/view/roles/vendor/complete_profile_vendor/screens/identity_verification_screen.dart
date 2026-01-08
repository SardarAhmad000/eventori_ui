import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_file_picker.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/complete_profile_vendor_controller.dart';
import '../widgets/custom_stepper.dart';

class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  CompleteProfileVendorController completeProfileVendorController = Get.find();

  final TextEditingController vendorServiceDescpController = TextEditingController();
  final CustomImagePicker imagePicker = CustomImagePicker();
  final CustomFilePicker filePicker = CustomFilePicker();

  @override
  void dispose() {
    vendorServiceDescpController.dispose();
    super.dispose();
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
            const SizedBox(height: 20),
            Image.asset(
              AppAssets.appLogo,
              width: 38,
              height: 32,
            ),
            const SizedBox(height: 20),
            const CustomStepper(currentStep: 2),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Identity Verification',
                      style: AppTextStyle.f20W600BColorTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Upload relevant business documentation',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    // Upload Document Section (PDF)
                    Text(
                      'Upload document',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      final documentFile =
                          completeProfileVendorController.businessDocument.value;
                      final documentFileName = completeProfileVendorController
                          .documentFileName.value;

                      if (documentFile != null &&
                          documentFileName.isNotEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppTheme.lightCyanColor,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: AppTheme.lightCyanColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Image.asset(
                                  AppAssets.uploadCloudIcon,
                                  color: AppTheme.lightCyanColor,
                                  width: 32,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      documentFileName,
                                      style: AppTextStyle
                                          .f14W500BColorTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'PDF Document',
                                      style: AppTextStyle
                                          .f12W400SGColorTextStyle
                                          .copyWith(
                                          color: AppTheme.silverColor),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  completeProfileVendorController
                                      .setDocumentFile(null, '');
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: AppTheme.redColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final result = await filePicker.pickPDFFile();
                              if (result != null) {
                                completeProfileVendorController
                                    .setDocumentFile(
                                  result['file'],
                                  result['name'],
                                );
                              }
                            },
                            child: DottedBorder(
                              color: completeProfileVendorController
                                  .documentError.value !=
                                  null
                                  ? AppTheme.redColor
                                  : AppTheme.silverColor,
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
                                      AppAssets.uploadDocumentsIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload Document (PDF)',
                                      style: AppTextStyle
                                          .f14W500SColorTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (completeProfileVendorController
                              .documentError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .documentError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                    const SizedBox(height: 12),

                    // Upload Portfolio Section
                    Text(
                      'Upload Portfolio',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      final portfolioImages = completeProfileVendorController.portfolio;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final files = await imagePicker
                                  .pickMultipleImages(maxImages: 6);
                              if (files.isNotEmpty) {
                                final currentCount = portfolioImages.length;
                                final remainingSlots = 6 - currentCount;

                                if (remainingSlots > 0) {
                                  final filesToAdd =
                                  files.take(remainingSlots).toList();
                                  completeProfileVendorController
                                      .setPortfolioImages(
                                    [...portfolioImages, ...filesToAdd],
                                  );
                                }
                              }
                            },
                            child: DottedBorder(
                              color: completeProfileVendorController
                                  .portfolioError.value !=
                                  null
                                  ? AppTheme.redColor
                                  : AppTheme.silverColor,
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
                                      AppAssets.uploadPortfolioIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload Portfolio (${portfolioImages.length}/6)',
                                      style: AppTextStyle
                                          .f14W500SColorTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (completeProfileVendorController
                              .portfolioError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .portfolioError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          if (portfolioImages.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                              ),
                              itemCount: portfolioImages.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: FileImage(
                                              portfolioImages[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: GestureDetector(
                                        onTap: () {
                                          completeProfileVendorController
                                              .removePortfolioImage(index);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: AppTheme.lightCyanColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            color: AppTheme.whiteColor,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ],
                      );
                    }),
                    const SizedBox(height: 12),

                    // Upload Logo Section
                    Text(
                      'Upload Logo',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      final logoImage = completeProfileVendorController.logo.value;
                      if (logoImage != null) {
                        return Stack(
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: FileImage(logoImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () {
                                  completeProfileVendorController
                                      .setLogoImage(null);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppTheme.lightCyanColor,
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
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final file = await imagePicker
                                  .showImageSourceBottomSheet(context);
                              if (file != null) {
                                completeProfileVendorController
                                    .setLogoImage(file);
                              }
                            },
                            child: DottedBorder(
                              color: completeProfileVendorController
                                  .logoError.value !=
                                  null
                                  ? AppTheme.redColor
                                  : AppTheme.silverColor,
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
                                      AppAssets.uploadLogoIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload Logo',
                                      style: AppTextStyle
                                          .f14W500SColorTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (completeProfileVendorController
                              .logoError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .logoError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                    const SizedBox(height: 12),

                    Text(
                      'Services description',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 84,
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: vendorServiceDescpController,
                              maxLines: null,
                              expands: true,
                              cursorColor: AppTheme.lightCyanColor,
                              textAlignVertical: TextAlignVertical.top,
                              style: AppTextStyle.f16W400DPColorTextStyle,
                              onChanged: (value) {
                                // Clear error as user types
                                if (completeProfileVendorController.serviceDescriptionError.value != null) {
                                  completeProfileVendorController.serviceDescriptionError.value = null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter description',
                                hintStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                filled: true,
                                fillColor: AppTheme.whiteColor,
                                contentPadding: const EdgeInsets.all(12),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: completeProfileVendorController.serviceDescriptionError.value != null
                                        ? AppTheme.redColor
                                        : AppTheme.textfieldBorderColor,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: completeProfileVendorController.serviceDescriptionError.value !=
                                        null
                                        ? AppTheme.redColor
                                        : AppTheme.lightCyanColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (completeProfileVendorController
                              .serviceDescriptionError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .serviceDescriptionError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),

                    const SizedBox(height: 12),
                    Text(
                      'Travel settings',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCheckbox(
                                initialValue: completeProfileVendorController.selectedTravelAvailability.value == 'LOCAL',
                                label: 'LOCAL',
                                labelStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                onChanged: (value) {
                                  completeProfileVendorController.updateTravelAvailability('LOCAL');
                                },
                              ),
                              CustomCheckbox(
                                initialValue:
                                completeProfileVendorController.selectedTravelAvailability.value == 'NATIONWIDE',
                                label: 'NATIONWIDE',
                                labelStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                onChanged: (value) {
                                  completeProfileVendorController.updateTravelAvailability('NATIONWIDE');
                                },
                              ),
                              CustomCheckbox(
                                initialValue:
                                completeProfileVendorController.selectedTravelAvailability.value == 'INTERNATIONAL',
                                label: 'INTERNATIONAL',
                                labelStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                onChanged: (value) {
                                  completeProfileVendorController.updateTravelAvailability('INTERNATIONAL');
                                },
                              ),
                            ],
                          ),
                          if (completeProfileVendorController.travelSettingsError.value != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController.travelSettingsError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),

                    const SizedBox(height: 12),
                    Text(
                      'Pricing Tier',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomCheckbox(
                                initialValue:
                                completeProfileVendorController
                                    .selectedPricingTier.value ==
                                    'BUDGET_FRIENDLY',
                                label: 'BUDGET FRIENDLY',
                                labelStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                onChanged: (value) {
                                  completeProfileVendorController
                                      .updatePricingTier('BUDGET_FRIENDLY');
                                },
                              ),
                              const SizedBox(width: 16),
                              CustomCheckbox(
                                initialValue:
                                completeProfileVendorController
                                    .selectedPricingTier.value ==
                                    'MID_RANGE',
                                label: 'MID RANGE',
                                labelStyle:
                                AppTextStyle.f14W400SColorTextStyle,
                                onChanged: (value) {
                                  completeProfileVendorController
                                      .updatePricingTier('MID_RANGE');
                                },
                              ),
                            ],
                          ),
                          if (completeProfileVendorController
                              .pricingTierError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .pricingTierError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),

                    const SizedBox(height: 12),
                    Text(
                      'Notice Period',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDropdownField(
                            hintText: 'Day',
                            value: completeProfileVendorController
                                .selectedNotice.value,
                            items: const [
                              DropdownMenuItem(
                                  value: '1 day', child: Text('1 day')),
                              DropdownMenuItem(
                                  value: '2 days', child: Text('2 days')),
                              DropdownMenuItem(
                                  value: '1 week', child: Text('1 week')),
                              DropdownMenuItem(
                                  value: '2 weeks', child: Text('2 weeks')),
                              DropdownMenuItem(
                                  value: '1 month', child: Text('1 month')),
                            ],
                            onChanged: (value) {
                              completeProfileVendorController
                                  .updateNotice(value);
                            },
                          ),
                          if (completeProfileVendorController
                              .noticePeriodError.value !=
                              null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 4),
                              child: Text(
                                completeProfileVendorController
                                    .noticePeriodError.value!,
                                style: TextStyle(
                                  color: AppTheme.redColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      );
                    }),

                    const SizedBox(height: 24),
                    CustomButton(
                      Text: 'Next',
                      height: 48,
                      width: double.infinity,
                      buttonColor: AppTheme.lightCyanColor,
                      textColor: AppTheme.whiteColor,
                      textSize: 16,
                      onTap: (){
                        // Validate all fields before navigating
                        bool isValid = completeProfileVendorController.validateIdentityVerification(vendorServiceDescpController.text);

                        if (isValid) {
                          // Print all the collected data
                          print('==================== IDENTITY VERIFICATION DATA ====================');
                          print('Business Document: ${completeProfileVendorController.businessDocument.value?.path ?? "Not provided"}');
                          print('Document Name: ${completeProfileVendorController.documentFileName.value}');
                          print('Portfolio Images Count: ${completeProfileVendorController.portfolio.length}');
                          for (int i = 0; i < completeProfileVendorController.portfolio.length; i++) {
                            print('  Portfolio Image ${i + 1}: ${completeProfileVendorController.portfolio[i].path}');
                          }
                          print('Logo Image: ${completeProfileVendorController.logo.value?.path ?? "Not provided"}');
                          print('Service Description: ${vendorServiceDescpController.text}');
                          print('TRAVEL_SETTINGS : ${completeProfileVendorController.selectedTravelAvailability.value}');
                          print('PREFERRED_BUDGET : ${completeProfileVendorController.selectedPricingTier.value}');
                          print('Notice Period: ${completeProfileVendorController.selectedNotice.value}');
                          print('====================================================================');


                          completeProfileVendorController.storedServiceDescriptionForReuse.value=vendorServiceDescpController.text;
                          completeProfileVendorController.storedTravelSettingForReuse.value= completeProfileVendorController.selectedTravelAvailability.value.toString();
                          completeProfileVendorController.storedPricingTierForReuse.value=completeProfileVendorController.selectedPricingTier.value.toString();
                          completeProfileVendorController.storedNoticePeriodForReuse.value=completeProfileVendorController.selectedNotice.value.toString();

                          Get.toNamed(AppRoutes.setAvailabilityScreen);
                        }
                        else {
                          // Show error message
                         print("Validation Not Filled ");
                        }
                      },
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