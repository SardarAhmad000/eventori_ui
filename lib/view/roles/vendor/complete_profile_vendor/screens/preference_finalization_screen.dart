import 'package:eventori/app_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_radio_button.dart';
import '../../../../../app_widgets/custom_toggle.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/complete_profile_vendor_controller.dart';

class PreferenceFinalizationScreen extends StatefulWidget {
  const PreferenceFinalizationScreen({super.key});

  @override
  State<PreferenceFinalizationScreen> createState() => _PreferenceFinalizationScreenState();
}

class _PreferenceFinalizationScreenState extends State<PreferenceFinalizationScreen> {

  CompleteProfileVendorController completeProfileVendorController =Get.find();
  TextEditingController vendorTeamMemberController = TextEditingController();

  final String selectedPromotionPlan = '';


  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
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

              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Preferences & Finalization',
                        style: AppTextStyle.f20W600BColorTextStyle,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Available now',
                              style: AppTextStyle.f14W500BColorTextStyle,
                            ),
                          ),
                          CustomToggleSwitch(
                            initialValue: completeProfileVendorController.isReminderEnabled.value,
                            onChanged: (value) {
                              completeProfileVendorController.toggleReminder(value);
                            },
                            activeColor: AppTheme.lightCyanColor,
                            inactiveColor: AppTheme.whiteColor,
                            width: 36,
                            height: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Calendly integration',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              Text: 'Connect',
                              buttonColor: AppTheme.paperWhiteColor,
                              textColor: AppTheme.blackColor,
                              borderColor: AppTheme.lightGrayishColor,
                              onTap: (){
                                openLink("https://calendly.com/app/intro/availability");
                              },
                            ),
                          ),
                          const SizedBox(width: 24,),
                          Expanded(
                            child: CustomButton(
                              Text: '',
                              buttonColor: AppTheme.paperWhiteColor,
                              textColor: AppTheme.blackColor,
                              borderColor: AppTheme.paperWhiteColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Social links',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),




                      const SizedBox(height: 12),
                      Text(
                        'Preferred Contact',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedPreferredContact.value == 'In-app chat',
                            label: 'In-app chat',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updatePreferredContact('In-app chat');
                            },
                          ),
                          const SizedBox(width: 16),
                          CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedPreferredContact.value == 'WhatsApp',
                            label: 'WhatsApp',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updatePreferredContact('WhatsApp');
                            },
                          ),
                          const SizedBox(width: 16),
                          CustomCheckbox(
                            initialValue: completeProfileVendorController.selectedPreferredContact.value == 'Email',
                            label: 'Email',
                            labelStyle: AppTextStyle.f14W400SColorTextStyle,
                            onChanged: (value) {
                              completeProfileVendorController.updatePreferredContact('Email');
                            },
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Team Members',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: vendorTeamMemberController,
                        hintText: 'Enter team members',
                        // validator: CustomValidator.,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 53,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              border: Border(
                                left: BorderSide(
                                  color: AppTheme.lightGrayishColor,
                                  width: 1,
                                ),
                              ),
                              color: AppTheme.whiteColor,
                            ),
                            child: Center(
                              child: Text(
                                'Add',
                                style: AppTextStyle.f16W400SColorTextStyle,
                              ),
                            ),

                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(() =>  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRadioButton(
                              label: "I confirm i am over 18 years old",
                              isSelected: completeProfileVendorController.isAgeConfirmed.value,
                              onTap: () {
                                completeProfileVendorController.isAgeConfirmed.value = !completeProfileVendorController.isAgeConfirmed.value;
                              },
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                completeProfileVendorController.isTermsAccepted.value = !completeProfileVendorController.isTermsAccepted.value;
                              },
                              child: Row(
                                children: [
                                  CustomRadioButton(
                                    label: "",
                                    isSelected: completeProfileVendorController.isTermsAccepted.value,
                                    onTap: () {
                                      completeProfileVendorController.isTermsAccepted.value = !completeProfileVendorController.isTermsAccepted.value;
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  Flexible(
                                    child: RichText(
                                      text: TextSpan(
                                        style: AppTextStyle.f12W400DSBColorTextStyle,
                                        children: [
                                          const TextSpan(text: "I agree "),
                                          TextSpan(
                                            text: "term and conditions",
                                            style: AppTextStyle.f12W400DSBColorTextStyle.copyWith(
                                              color: AppTheme.lightCyanColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        Text: 'Finish',
                        height: 48,
                        width: double.infinity,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        textSize: 16,
                        onTap: () {

                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
