import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_profile_card.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../../../../onboarding/widgets/build_header.dart';

class AddCollaboratorsScreen extends StatefulWidget {
  const AddCollaboratorsScreen({super.key});

  @override
  State<AddCollaboratorsScreen> createState() => _AddCollaboratorsScreenState();
}

class _AddCollaboratorsScreenState extends State<AddCollaboratorsScreen> {
  final TextEditingController searchVendorsController = TextEditingController();
  final TextEditingController firstNameVendorController = TextEditingController();
  final TextEditingController lastNameVendorController = TextEditingController();
  final TextEditingController emailVendorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Collaborators',
                      style: AppTextStyle.f32W600DPColorTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Invite people to help you manage this event. They’ll be able to edit details and view responses.',
                      style: AppTextStyle.f16W400SIColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      borderRadius: 99,
                      hintText: 'Search Vendors',
                      controller: searchVendorsController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.asset(
                          AppAssets.searchIcon,
                          color: AppTheme.slateGreyColor,
                          width: 45,
                          height: 45,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: AppTheme.paperWhiteColor,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              AppAssets.filterIcon,
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 56,
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: AppTheme.dividerColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'OR',
                            style: AppTextStyle.f16W500DSBColorTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 56,
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: AppTheme.dividerColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: firstNameVendorController,
                      hintText: 'First Name',
                      isRequired: true,
                      prefixIcon: Image.asset(
                        AppAssets.userIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.firstName,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: lastNameVendorController,
                      hintText: 'Last Name',
                      prefixIcon: Image.asset(
                        AppAssets.userIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.lastName,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: emailVendorController,
                      hintText: 'Email Address',
                      isRequired: true,
                      prefixIcon: Image.asset(
                        AppAssets.mailIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.email,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      hintText: 'Role',
                      prefixIcon: Image.asset(
                        AppAssets.pencilIcon,
                        color: AppTheme.silverColor,
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppTheme.silverColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      Text: "Add collaboartors +",
                      onTap: () {},
                      buttonColor: AppTheme.paperWhiteColor,
                      textColor: AppTheme.blackColor,
                      height: 48,
                      borderColor: AppTheme.lightCyanColor,
                    ),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child:  CustomProfileCard(
                            imageUrl: AppAssets.profileImage,
                            name: 'Sara',
                            role: 'Owner',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child:CustomButton(
                    Text: "Skip",
                    onTap: () {},
                    buttonColor: AppTheme.paperWhiteColor,
                    textColor: AppTheme.blackColor,
                    height: 48,
                    borderColor: AppTheme.lightCyanColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    Text: "Save & Continue",
                    onTap: () {},
                    buttonColor: AppTheme.lightCyanColor,
                    textColor: AppTheme.whiteColor,
                    height: 48,
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
