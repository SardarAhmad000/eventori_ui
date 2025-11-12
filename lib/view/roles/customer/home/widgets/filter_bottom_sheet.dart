import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../controller/home_controller.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet({Key? key}) : super(key: key);

  final GlobalKey _countryKey = GlobalKey();
  final GlobalKey _cityKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        border: Border.all(
          color: AppTheme.textfieldBorderColor,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter',
                  style: AppTextStyle.f16W500BColorTextStyle,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppTheme.blackColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Location',
                    style: AppTextStyle.f14W500SGColorTextStyle,
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
                              controller.countryVN,
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
                                    controller.selectedCountry.value ??
                                        'Country',
                                    style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                      color: controller.selectedCountry.value == null
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
                          onTap: controller.selectedCountry.value == null
                              ? null
                              : () async {
                            final renderBox = _cityKey.currentContext!
                                .findRenderObject() as RenderBox;
                            final position =
                            renderBox.localToGlobal(Offset.zero);
                            final size = renderBox.size;
                            await loadCityData(
                                country: controller.countryVN);
                            citySelect(
                              context,
                              position,
                              size,
                              controller.cityVN,
                              country: controller.countryVN,
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
                                    controller.selectedCity.value ?? 'City',
                                    style: AppTextStyle
                                        .f16W400SColorTextStyle
                                        .copyWith(
                                      color: controller.selectedCity.value ==
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
                  const SizedBox(height: 16),
                  Text(
                    'Rating',
                    style: AppTextStyle.f14W500SGColorTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => Row(
                    children: [
                      CustomCheckbox(
                        initialValue:
                        controller.selectedRating.value == '5 stars',
                        label: '5 stars',
                        labelStyle: AppTextStyle.f16W400BColorTextStyle,
                        onChanged: (value) {
                          controller.updateRating('5 stars');
                        },
                      ),
                      const SizedBox(width: 16),
                      CustomCheckbox(
                        initialValue:
                        controller.selectedRating.value == '4 stars',
                        label: '4 stars',
                        labelStyle: AppTextStyle.f16W400BColorTextStyle,
                        onChanged: (value) {
                          controller.updateRating('4 stars');
                        },
                      ),
                      const SizedBox(width: 16),
                      CustomCheckbox(
                        initialValue:
                        controller.selectedRating.value == '3 stars',
                        label: '3 stars',
                        labelStyle: AppTextStyle.f16W400BColorTextStyle,
                        onChanged: (value) {
                          controller.updateRating('3 stars');
                        },
                      ),
                    ],
                  )),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Notice',
                    style: AppTextStyle.f14W500SGColorTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomDropdownField(
                    hintText: '1 day',
                    value: controller.selectedNotice.value,
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
                      controller.updateNotice(value);
                    },
                  )),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Travel availability',
                    style: AppTextStyle.f14W500SGColorTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller
                        .selectedTravelAvailability.value ==
                        'Local only',
                    label: 'Local only',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.updateTravelAvailability('Local only');
                    },
                  )),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller
                        .selectedTravelAvailability.value ==
                        'Nationwide',
                    label: 'Nationwide',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.updateTravelAvailability('Nationwide');
                    },
                  )),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller
                        .selectedTravelAvailability.value ==
                        'International',
                    label: 'International',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.updateTravelAvailability('International');
                    },
                  )),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Services',
                    style: AppTextStyle.f14W500SGColorTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller.isCateringSelected.value,
                    label: 'Catering',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.toggleCatering();
                    },
                  )),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller.isDjSelected.value,
                    label: 'Dj',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.toggleDj();
                    },
                  )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => CustomCheckbox(
                          initialValue:
                          controller.isPhotographySelected.value,
                          label: 'Photography',
                          labelStyle: AppTextStyle.f16W400BColorTextStyle,
                          onChanged: (value) {
                            controller.togglePhotography();
                          },
                        )),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Obx(() => CustomCheckbox(
                          initialValue: controller.isFloralSelected.value,
                          label: 'Floral',
                          labelStyle: AppTextStyle.f16W400BColorTextStyle,
                          onChanged: (value) {
                            controller.toggleFloral();
                          },
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    color: AppTheme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Id',
                    style: AppTextStyle.f14W500SGColorTextStyle,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => CustomCheckbox(
                    initialValue: controller.isVerifiedIdSelected.value,
                    label: 'Verified id',
                    labelStyle: AppTextStyle.f16W400BColorTextStyle,
                    onChanged: (value) {
                      controller.toggleVerifiedId();
                    },
                  )),
                  const SizedBox(height: 24),
                  CustomButton(
                    Text: "Apply filter",
                    onTap: () {
                      Navigator.pop(context, controller.getFilterResults());
                    },
                    buttonColor: AppTheme.lightCyanColor,
                    textColor: AppTheme.whiteColor,
                    height: 48,
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    Text: "Clear all filters",
                    onTap: () {
                      controller.clearAllFilters();
                    },
                    buttonColor: AppTheme.whiteColor,
                    textColor: AppTheme.lightCyanColor,
                    height: 48,
                    borderColor: AppTheme.lightCyanColor,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}