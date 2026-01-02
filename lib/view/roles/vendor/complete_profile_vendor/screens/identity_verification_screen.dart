import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../controller/complete_profile_vendor_controller.dart';
class IdentityVerificationScreen extends StatefulWidget {
  const IdentityVerificationScreen({super.key});

  @override
  State<IdentityVerificationScreen> createState() => _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState extends State<IdentityVerificationScreen> {
  CompleteProfileVendorController completeProfileVendorController =Get.find();

  final TextEditingController vendorServiceDescpController = TextEditingController();


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
                      Text(
                        'Upload document',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      DottedBorder(
                        color: AppTheme.silverColor,
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
                                'Upload Document',
                                style: AppTextStyle.f14W500SColorTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload Portfolio',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      DottedBorder(
                        color: AppTheme.silverColor,
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
                                'Upload Portfolio',
                                style: AppTextStyle.f14W500SColorTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload Logo',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      DottedBorder(
                        color: AppTheme.silverColor,
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
                                style: AppTextStyle.f14W500SColorTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Services description',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
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
                          decoration: InputDecoration(
                            hintText: 'Enter description',
                            hintStyle: AppTextStyle.f14W400SColorTextStyle,
                            filled: true,
                            fillColor: AppTheme.whiteColor,
                            contentPadding: const EdgeInsets.all(12),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: AppTheme.lightCyanColor,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Travel settings',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => CustomCheckbox(
                              initialValue: completeProfileVendorController.selectedTravelAvailability.value == 'Local',
                              label: 'Local',
                              labelStyle: AppTextStyle.f14W400SColorTextStyle,
                              onChanged: (value) {
                                completeProfileVendorController.updateTravelAvailability('Local');
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Obx(() => CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedTravelAvailability.value == 'Nationwide',
                            label: 'Nationwide',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updateTravelAvailability('Nationwide');
                            },
                          )),
                          const SizedBox(height: 16),
                          Obx(() => CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedTravelAvailability.value == 'International',
                            label: 'International',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updateTravelAvailability('International');
                            },
                          )),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Pricing Tier',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedPricingTier.value == 'Budget-Friendly',
                            label: 'Budget-Friendly',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updatePricingTier('Budget-Friendly');
                            },
                          ),
                          const SizedBox(width: 16),
                          CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedPricingTier.value == 'Budget-Friendly',
                            label: 'Budget-Friendly',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updatePricingTier('Budget-Friendly');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Notice Period',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Less than one month',
                        style: AppTextStyle.f14W400SColorTextStyle,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        Text: 'Next',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        textSize: 16,
                        onTap: () {
                          Get.toNamed(AppRoutes.preferenceFinalizationScreen);
                        },
                      ),

                    ],
                  ),
                ),
              )

            ],
          )
      ),
    );
  }
}
