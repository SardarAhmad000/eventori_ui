import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/vendor/complete_profile_vendor/controller/complete_profile_vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
class BasicInformationScreen extends StatelessWidget {
  BasicInformationScreen({super.key});

  final TextEditingController vendorOwnerNameController = TextEditingController();
  final TextEditingController vendorBusinessNameController = TextEditingController();
  final TextEditingController vendorEmailController = TextEditingController();
  final TextEditingController vendorOperatingAddressController = TextEditingController();
  final TextEditingController vendorServicesController = TextEditingController();

  final GlobalKey _countryKey = GlobalKey();
  final GlobalKey _cityKey = GlobalKey();

  CompleteProfileVendorController completeProfileVendorController =Get.find();

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
                    // const SizedBox(height: 16),
                    // Text(
                    //   'Email Address',
                    //   style: AppTextStyle.f14W500BColorTextStyle,
                    // ),
                    // const SizedBox(height: 12),
                    // CustomTextField(
                    //   controller: vendorEmailController,
                    //   hintText: 'Email Address',
                    //   validator: CustomValidator.email,
                    // ),
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
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => GestureDetector(
                            key: _countryKey,
                            onTap: () async {
                              final renderBox = _countryKey.currentContext!
                                  .findRenderObject() as RenderBox;
                              final position =
                              renderBox.localToGlobal(Offset.zero);
                              final size = renderBox.size;
                              await loadCountryData();
                              countrySelect(
                                context,
                                position,
                                size,
                                completeProfileVendorController.countryVN,
                              );
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.textfieldBorderColor,
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      completeProfileVendorController.selectedCountry.value ??
                                          'Country',
                                      style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                        color: completeProfileVendorController.selectedCountry.value == null
                                            ? AppTheme.silverColor
                                            : AppTheme.darkpurpleColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppTheme.slateGreyColor,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Obx(() => GestureDetector(
                            key: _cityKey,
                            onTap: completeProfileVendorController.selectedCountry.value == null
                                ? null
                                : () async {
                              final renderBox = _cityKey.currentContext!
                                  .findRenderObject() as RenderBox;
                              final position =
                              renderBox.localToGlobal(Offset.zero);
                              final size = renderBox.size;
                              await loadCityData(
                                  country: completeProfileVendorController.countryVN);
                              citySelect(
                                context,
                                position,
                                size,
                                completeProfileVendorController.cityVN,
                                country: completeProfileVendorController.countryVN,
                              );
                            },
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppTheme.whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.textfieldBorderColor,
                                  width: 1,
                                ),
                              ),
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      completeProfileVendorController.selectedCity.value ?? 'City',
                                      style: AppTextStyle
                                          .f16W400SColorTextStyle
                                          .copyWith(
                                        color: completeProfileVendorController.selectedCity.value ==
                                            null
                                            ? AppTheme.silverColor
                                            : AppTheme.darkpurpleColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: AppTheme.slateGreyColor,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          )),
                        ),
                      ],
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