import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/vendor/complete_profile_vendor/controller/complete_profile_vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';

class BasicInformationScreen extends StatelessWidget {
  BasicInformationScreen({super.key});

  final TextEditingController vendorOwnerNameController = TextEditingController();
  final TextEditingController vendorBusinessNameController = TextEditingController();
  final TextEditingController vendorOperatingAddressController = TextEditingController();

  final GlobalKey countryKey = GlobalKey();
  final GlobalKey cityKey = GlobalKey();

  // Add Form Key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  CompleteProfileVendorController completeProfileVendorController = Get.find();

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
                child: Form(
                  key: _formKey,
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
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.name,
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
                        prefixIcon: Image.asset(
                          AppAssets.buildingIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.businessName,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Services Provided',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      Obx(() => CustomDropdownField(
                        hintText: 'Select services',
                        value: completeProfileVendorController.selectedService.value,
                        items: const [
                          DropdownMenuItem(value: 'Photographer', child: Text('Photographer')),
                          DropdownMenuItem(value: 'Catering', child: Text('Catering')),
                          DropdownMenuItem(value: 'Venue', child: Text('Venue')),
                          DropdownMenuItem(value: 'Decor', child: Text('Decor')),
                        ],
                        onChanged: (String? newValue) {
                          completeProfileVendorController.selectedService.value = newValue;
                          print('Service selected: $newValue');
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a service';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(height: 16),
                      Text(
                        'Operating address',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: vendorOperatingAddressController,
                        hintText: 'Address',
                        prefixIcon: Image.asset(
                          AppAssets.locationIcon,
                          color: AppTheme.silverColor,
                        ),
                        validator: CustomValidator.location,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Country',
                            style: AppTextStyle.f14W500BColorTextStyle,
                          ),
                          Text(
                            'City',
                            style: AppTextStyle.f14W500BColorTextStyle,
                          ),
                          const SizedBox(),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  key: countryKey,
                                  onTap: () async {
                                    final renderBox = countryKey.currentContext!
                                        .findRenderObject() as RenderBox;
                                    final position = renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCountryData();
                                    countrySelect(
                                      context,
                                      position,
                                      size,
                                      completeProfileVendorController.countryVN,
                                    );
                                  },
                                  child: Obx(() => Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: completeProfileVendorController.countryError.value != null
                                            ? AppTheme.textfieldBorderColor
                                            : AppTheme.textfieldBorderColor,
                                        width: 1.3,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            completeProfileVendorController.selectedCountry.value ?? 'Country',
                                            style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                                color: completeProfileVendorController.selectedCountry.value == null
                                                    ? AppTheme.silverColor
                                                    : AppTheme.darkpurpleColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_down,
                                            color: AppTheme.slateGreyColor, size: 20
                                        ),
                                      ],
                                    ),
                                  )),
                                ),
                                // Obx(() {
                                //   if (completeProfileVendorController.countryError.value = null) {
                                //     return Padding(
                                //       padding: const EdgeInsets.only(top: 4, left: 4),
                                //       child: Text(
                                //         completeProfileVendorController.countryError.value!,
                                //         style: AppTextStyle.f12W400RColorTextStyle
                                //             .copyWith(fontWeight: FontWeight.bold),
                                //       ),
                                //     );
                                //   }
                                //   return const SizedBox.shrink();
                                // }),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => GestureDetector(
                                  key: cityKey,
                                  onTap: completeProfileVendorController.selectedCountry.value == null
                                      ? null
                                      : () async {
                                    final renderBox = cityKey.currentContext!
                                        .findRenderObject() as RenderBox;
                                    final position = renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCityData(country: completeProfileVendorController.countryVN);
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
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: completeProfileVendorController.cityError.value != null
                                            ? AppTheme.textfieldBorderColor
                                            : AppTheme.textfieldBorderColor,
                                        width: 1.3,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            completeProfileVendorController.selectedCity.value ?? 'City',
                                            style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                              color: completeProfileVendorController.selectedCity.value == null
                                                  ? AppTheme.silverColor
                                                  : AppTheme.darkpurpleColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down,
                                            color: AppTheme.slateGreyColor, size: 20),
                                      ],
                                    ),
                                  ),
                                )),
                                Obx(() {
                                  if (completeProfileVendorController.cityError.value != null ) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 4),
                                      child: Text(
                                        completeProfileVendorController.cityError.value!,
                                        style: AppTextStyle.f12W400RColorTextStyle
                                            .copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                              ],
                            ),
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
                        onTap: (){
                          // Validate form fields
                          bool isFormValid = _formKey.currentState!.validate();

                          // Additional validation for country and city
                          bool isCountryValid = completeProfileVendorController.selectedCountry.value != null;
                          bool isCityValid = completeProfileVendorController.selectedCity.value != null;

                          if (isFormValid && isCountryValid && isCityValid) {
                            // All validations passed
                            print('=== Form Validation Passed ===');
                            print('Owner Name: ${vendorOwnerNameController.text}');
                            print('Business Name: ${vendorBusinessNameController.text}');
                            print('Selected Service: ${completeProfileVendorController.selectedService.value}');
                            print('Operating Address: ${vendorOperatingAddressController.text}');
                            print('Selected Country: ${completeProfileVendorController.selectedCountry.value}');
                            print('Selected City: ${completeProfileVendorController.selectedCity.value}');
                            print('=== End of Form Data ===');

                            // Navigate to next screen
                            Get.toNamed(AppRoutes.identityVerificationScreen);
                          } else {
                            // Validation failed
                            print('=== Form Validation Failed ===');

                            String errorMessage = 'Please fill all required fields correctly';

                            if (!isCountryValid) {
                              errorMessage = 'Please select a country';
                              print('Country not selected');
                            }
                            else if (!isCityValid) {
                              errorMessage = 'Please select a city';
                              print('City not selected');
                            }

                            print(errorMessage);
                          }
                        },
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