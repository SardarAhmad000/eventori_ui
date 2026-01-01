import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
class BasicInformationScreen extends StatefulWidget {
  const BasicInformationScreen({super.key});

  @override
  State<BasicInformationScreen> createState() => _BasicInformationScreenState();
}

class _BasicInformationScreenState extends State<BasicInformationScreen> {

  final TextEditingController vendorOwnerNameController = TextEditingController();
  final TextEditingController vendorBusinessNameController = TextEditingController();
  final TextEditingController vendorEmailController = TextEditingController();
  final TextEditingController vendorOperatingAddressController = TextEditingController();
  final TextEditingController vendorServicesController = TextEditingController();


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
                      'Basic Information',
                      style: AppTextStyle.f20W600BColorTextStyle,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Company Owner name',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorOwnerNameController,
                      hintText: 'Enter name',
                      // isRequired: true,
                      // prefixIcon: Image.asset(
                      //   AppAssets.userIcon,
                      //   color: AppTheme.silverColor,
                      // ),
                      validator: CustomValidator.vendorName,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Business name',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorBusinessNameController,
                      hintText: 'Enter your business name',
                      validator: CustomValidator.vendorName,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Email Address',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorEmailController,
                      hintText: 'Email Address',
                      validator: CustomValidator.email,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Operating address',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorOperatingAddressController,
                      hintText: 'Select services',
                      validator: CustomValidator.vendorName,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Services Provided',
                      style: AppTextStyle.f14W500BColorTextStyle,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorServicesController,
                      hintText: 'Select services',
                      validator: CustomValidator.vendorName,
                    ),

                    const SizedBox(height: 16),
                    Text(
                      'Location',
                      style: AppTextStyle.f14W500BColorTextStyle,
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
                        Get.toNamed(AppRoutes.identityVerificationScreen);
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

// CustomDropdownField(
//                       hintText: "Event Category",
//                       value: selectedCategory,
//                       items:sercivesProvuidedList.map((category) {
//                         return DropdownMenuItem<String>(
//                           value: category,
//                           child: Text(category),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         // sercivesProvuidedList = value;
//                       },
//                       hintTextColor: AppTheme.silverColor,
//                       inputTextColor: AppTheme.darkpurpleColor,
//                       dropdownIconColor: AppTheme.slateGreyColor,
//                       validator: CustomValidator.eventCategory,
//                     ),