import 'dart:convert';
import 'package:eventori/app_widgets/custom_textfield.dart';
import 'package:eventori/constants/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_radio_button.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/complete_profile_vendor_controller.dart';
import '../widgets/custom_stepper.dart';

class PreferenceFinalizationScreen extends StatefulWidget {
  const PreferenceFinalizationScreen({super.key});

  @override
  State<PreferenceFinalizationScreen> createState() => _PreferenceFinalizationScreenState();
}

class _PreferenceFinalizationScreenState extends State<PreferenceFinalizationScreen> {

  CompleteProfileVendorController completeProfileVendorController = Get.find();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  TextEditingController instagramController = TextEditingController();
  TextEditingController tiktokController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController vendorTeamMemberController = TextEditingController();

  final String selectedPromotionPlan = '';

  @override
  void dispose() {
    instagramController.dispose();
    tiktokController.dispose();
    facebookController.dispose();
    vendorTeamMemberController.dispose();
    super.dispose();
  }

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
              const CustomStepper(currentStep: 4),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Preferences & Finalization',
                          style: AppTextStyle.f20W600BColorTextStyle,
                        ),
                        const SizedBox(height: 16),

                        // Instagram Link
                        Text(
                          'Instagram link',
                          style: AppTextStyle.f14W500BColorTextStyle,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: instagramController,
                          hintText: 'Paste your link here',
                          validator: CustomValidator.instagram,
                        ),
                        const SizedBox(height: 12),

                        // TikTok Link
                        Text(
                          'Tiktok link',
                          style: AppTextStyle.f14W500BColorTextStyle,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: tiktokController,
                          hintText: 'Paste your link here',
                          validator: CustomValidator.tiktok,
                        ),
                        const SizedBox(height: 12),

                        // Facebook Link
                        Text(
                          'Facebook link',
                          style: AppTextStyle.f14W500BColorTextStyle,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: facebookController,
                          hintText: 'Paste your link here',
                          validator: CustomValidator.facebook,
                        ),
                        const SizedBox(height: 12),

                        // Preferred Contact
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
                        if (completeProfileVendorController.preferredContactError.value != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4, left: 8),
                            child: Text(
                              completeProfileVendorController.preferredContactError.value!,
                              style:AppTextStyle.f12W400RColorTextStyle,
                            ),
                          ),
                        const SizedBox(height: 12),

                        // Team Members
                        Text(
                          'Team Members',
                          style: AppTextStyle.f14W500BColorTextStyle,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: vendorTeamMemberController,
                          hintText: 'Enter team members',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: (){
                                if (vendorTeamMemberController.text.trim().isNotEmpty) {
                                  completeProfileVendorController.teamMembers.add(vendorTeamMemberController.text.trim());
                                  vendorTeamMemberController.clear();
                                  print('Team member added. Current list: $completeProfileVendorController.teamMembers');
                                }
                              },
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
                        ),
                        const SizedBox(height: 12),

                        // Team Members List View
                        if (completeProfileVendorController.teamMembers.isNotEmpty)
                          SizedBox(
                            height: 38,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemCount: completeProfileVendorController.teamMembers.length,
                                itemBuilder: (context, index){
                                  final member = completeProfileVendorController.teamMembers[index];
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    constraints: const BoxConstraints(minHeight: 40),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
                                    decoration: BoxDecoration(
                                      color: AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AppTheme.textfieldBorderColor,
                                        width: 1,
                                      ),
                                    ),
                                    child:  Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              member,
                                              style: AppTextStyle.f12W400BColorTextStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          InkWell(
                                            onTap: () {
                                              // Remove team member
                                              completeProfileVendorController.teamMembers.removeAt(index);
                                              print('Team member removed: $member');
                                              print('Remaining members: $completeProfileVendorController.teamMembers');
                                            },
                                            child: Image.asset(
                                              AppAssets.closeIcon,
                                              width: 16,
                                            ),
                                          ),
                                        ]
                                    ),
                                  );
                                }
                            ),
                          ),
                        const SizedBox(height: 12),

                        // Age Confirmation
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomRadioButton(
                              label: "I confirm i am over 18 years old",
                              isSelected: completeProfileVendorController.isAgeConfirmed.value,
                              onTap: () {
                                completeProfileVendorController.isAgeConfirmed.value = !completeProfileVendorController.isAgeConfirmed.value;
                                completeProfileVendorController.ageConfirmationError.value = null;
                              },
                            ),
                            if (completeProfileVendorController.ageConfirmationError.value != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 32),
                                child: Text(
                                  completeProfileVendorController.ageConfirmationError.value!,
                                  style: AppTextStyle.f12W400RColorTextStyle,
                                ),
                              ),
                            const SizedBox(height: 12),

                            // Terms and Conditions
                            GestureDetector(
                              onTap: () {
                                completeProfileVendorController.isTermsAccepted.value = !completeProfileVendorController.isTermsAccepted.value;
                                completeProfileVendorController.termsAcceptanceError.value = null;
                              },
                              child: Row(
                                children: [
                                  CustomRadioButton(
                                    label: "",
                                    isSelected: completeProfileVendorController.isTermsAccepted.value,
                                    onTap: () {
                                      completeProfileVendorController.isTermsAccepted.value = !completeProfileVendorController.isTermsAccepted.value;
                                      completeProfileVendorController.termsAcceptanceError.value = null;
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
                            ),
                            if (completeProfileVendorController.termsAcceptanceError.value != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 32),
                                child: Text(
                                  completeProfileVendorController.termsAcceptanceError.value!,
                                  style: AppTextStyle.f12W400RColorTextStyle,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Finish Button
                        CustomButton(
                          Text: 'Finish',
                          height: 48,
                          width: double.infinity,
                          buttonColor: AppTheme.lightCyanColor,
                          textColor: AppTheme.whiteColor,
                          textSize: 16,
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              print("Validation Error: Please fill all required fields correctly");
                              return;
                            }
                            // Validate preferred contact
                            if (completeProfileVendorController.selectedPreferredContact.value == null ||
                                completeProfileVendorController.selectedPreferredContact.value!.isEmpty) {
                              completeProfileVendorController.preferredContactError.value = 'Please select a preferred contact method';

                              print("Validation Error: Please select a preferred contact method");

                              return;
                            }
                            // Validate age confirmation
                            if (!completeProfileVendorController.isAgeConfirmed.value) {
                              completeProfileVendorController.ageConfirmationError.value = 'You must confirm you are over 18 years old';

                              print("Validation Error: You must confirm you are over 18 years old");

                              return;
                            }
                            // Validate terms acceptance
                            if (!completeProfileVendorController.isTermsAccepted.value) {
                              completeProfileVendorController.termsAcceptanceError.value = 'You must agree to the terms and conditions';
                              print("Validation Error: You must agree to the terms and conditions");
                              return;
                            }
                            // Clear all errors
                            completeProfileVendorController.preferredContactError.value = null;
                            completeProfileVendorController.ageConfirmationError.value = null;
                            completeProfileVendorController.termsAcceptanceError.value = null;

                            // Create JSON object with links
                            Map<String, String> socialLinks = {
                              "instagram": instagramController.text.trim(),
                              "facebook": facebookController.text.trim(),
                              "tiktok": tiktokController.text.trim(),
                            };

                            // Convert to JSON string
                            String jsonOutput = jsonEncode(socialLinks);

                            // Convert team members list to JSON
                            String teamMembersJson = jsonEncode(completeProfileVendorController.teamMembers);

                            // Print all the data
                            print('========== PREFERENCE FINALIZATION DATA ==========');
                            print(jsonOutput);
                            print('Preferred Contact: ${completeProfileVendorController.selectedPreferredContact.value}');
                            print('Team Members: $teamMembersJson');
                            print('Age Confirmed: ${completeProfileVendorController.isAgeConfirmed.value}');
                            print('Terms Accepted: ${completeProfileVendorController.isTermsAccepted.value}');
                            print('==================================================');

                            completeProfileVendorController.storedPreferredContactForReuse.value=completeProfileVendorController.selectedPreferredContact.value.toString();
                            completeProfileVendorController.storedTeamMembersForReuse.value=teamMembersJson;
                            completeProfileVendorController.storedSocialLinksForReuse.value=jsonOutput;


                            completeProfileVendorController.completeProfile();

                            print("Success:  Profile preferences saved successfully!");

                          },
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}