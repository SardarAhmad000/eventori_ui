import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/constants/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_success_dialog.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_date_picker.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_toggle.dart';
import '../controller/event_controller.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomSuccessDialog(
          title: 'Event created\nsuccessfully',
          subtitle: 'Event created — let the planning begin.',
          buttonText: 'Next',
          iconAsset: AppAssets.vectorIcon,
          iconBackgroundColor: AppTheme.greenColor,
          buttonColor: AppTheme.greenColor,
          buttonTextColor: AppTheme.whiteColor,
          buttonBorderColor: AppTheme.greenColor,
          onTap: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final EventController eventcontroller = Get.put(EventController());

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Create a New Event',
              style: AppTextStyle.f20W600BColorTextStyle,
            ),
            const SizedBox(height: 12),
            Text(
              'My event details',
              style: AppTextStyle.f16W500MBColorTextStyle,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: eventcontroller.formKey,
                  child: Column(
                    children: [
                      Container(
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.lightGrayishColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What\'s the name of your event?',
                                style: AppTextStyle.f14W500BColorTextStyle,
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                fieldBorderColor: AppTheme.textfieldBorderColor,
                                hintText: "Event name",
                                controller: eventcontroller.eventNameController,
                                validator: CustomValidator.event,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'What type of event are you planning?',
                                style: AppTextStyle.f14W500BColorTextStyle,
                              ),
                              const SizedBox(height: 8),
                              Obx(() => CustomDropdownField(
                                hintText: "Event Category",
                                value: eventcontroller.selectedCategory.value,
                                items: eventcontroller.eventCategories.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category,
                                    child: Text(category),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  eventcontroller.updateCategory(value);
                                },
                                hintTextColor: AppTheme.silverColor,
                                inputTextColor: AppTheme.darkpurpleColor,
                                dropdownIconColor: AppTheme.slateGreyColor,
                                validator: CustomValidator.eventCategory,
                              )),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Where will your event be held?',
                                    style: AppTextStyle.f14W500BColorTextStyle,
                                  ),
                                  Container(
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Obx(() => CustomCheckbox(
                                          initialValue: eventcontroller.isNotSureChecked.value,
                                          label: 'Not sure',
                                          labelStyle: AppTextStyle.f12W400BColorTextStyle,
                                          onChanged: (value) {
                                            eventcontroller.toggleNotSureLocation(value);
                                          },
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          key: eventcontroller.countryKey,
                                          onTap: () async {
                                            final renderBox = eventcontroller.countryKey.currentContext!
                                                .findRenderObject() as RenderBox;
                                            final position = renderBox.localToGlobal(Offset.zero);
                                            final size = renderBox.size;
                                            await loadCountryData();
                                            countrySelect(
                                              context,
                                              position,
                                              size,
                                              eventcontroller.countryVN,
                                            );
                                          },
                                          child: Obx(() => Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: AppTheme.whiteColor,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: eventcontroller.countryError.value != null
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
                                                    eventcontroller.selectedCountry.value ?? 'Country',
                                                    style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                                        color: eventcontroller.selectedCountry.value == null
                                                            ? AppTheme.silverColor
                                                            : AppTheme.darkpurpleColor),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Icon(Icons.keyboard_arrow_down,
                                                    color: AppTheme.slateGreyColor, size: 20),
                                              ],
                                            ),
                                          )),
                                        ),
                                        Obx(() {
                                          if (eventcontroller.countryError.value != null &&
                                              !eventcontroller.isNotSureChecked.value) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 4, left: 4),
                                              child: Text(
                                                eventcontroller.countryError.value!,
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
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Obx(() => GestureDetector(
                                          key: eventcontroller.cityKey,
                                          onTap: eventcontroller.selectedCountry.value == null
                                              ? null
                                              : () async {
                                            final renderBox = eventcontroller.cityKey.currentContext!
                                                .findRenderObject() as RenderBox;
                                            final position = renderBox.localToGlobal(Offset.zero);
                                            final size = renderBox.size;
                                            await loadCityData(country: eventcontroller.countryVN);
                                            citySelect(
                                              context,
                                              position,
                                              size,
                                              eventcontroller.cityVN,
                                              country: eventcontroller.countryVN,
                                            );
                                          },
                                          child: Container(
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: AppTheme.whiteColor,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: eventcontroller.cityError.value != null
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
                                                Text(
                                                  eventcontroller.selectedCity.value ?? 'City',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: eventcontroller.selectedCity.value == null
                                                        ? AppTheme.silverColor
                                                        : AppTheme.darkpurpleColor,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Icon(Icons.keyboard_arrow_down,
                                                    color: AppTheme.slateGreyColor, size: 20),
                                              ],
                                            ),
                                          ),
                                        )),
                                        Obx(() {
                                          if (eventcontroller.cityError.value != null &&
                                              !eventcontroller.isNotSureChecked.value) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top: 4, left: 4),
                                              child: Text(
                                                eventcontroller.cityError.value!,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: AppTheme.redColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'When is your event taking place?',
                                    style: AppTextStyle.f14W500BColorTextStyle,
                                  ),
                                  Container(
                                    height: 2.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        Obx(() => CustomCheckbox(
                                          initialValue: eventcontroller.isNotSureDate.value,
                                          label: 'Not sure',
                                          labelStyle: AppTextStyle.f12W400BColorTextStyle,
                                          onChanged: (value) {
                                            eventcontroller.toggleNotSureDate(value);
                                          },
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Obx(() => CustomDateTextField(
                                controller: eventcontroller.eventdateController,
                                hintText: "Date",
                                fieldBorderColor: AppTheme.textfieldBorderColor,
                                validator:
                                eventcontroller.isNotSureDate.value ? null : CustomValidator.eventDate,
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppTheme.slateGreyColor,
                                  size: 20,
                                ),
                              )),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Send me an automated reminder email 1 day before event',
                                      style: AppTextStyle.f14W500BColorTextStyle,
                                    ),
                                  ),
                                  Obx(() => CustomToggleSwitch(
                                    initialValue: eventcontroller.isReminderEnabled.value,
                                    onChanged: (value) {
                                      eventcontroller.toggleReminder(value);
                                    },
                                    activeColor: AppTheme.blueColor,
                                    inactiveColor: AppTheme.textfieldBorderColor,
                                    width: 36,
                                    height: 20,
                                  )),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Upload image',
                                style: AppTextStyle.f14W500BColorTextStyle,
                              ),
                              const SizedBox(height: 12),
                              DottedBorder(
                                color: AppTheme.textfieldBorderColor,
                                strokeWidth: 1,
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        Text: 'Create Event',
                        width: double.infinity,
                        height: 48,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        onTap: () {
                          eventcontroller.createEvent();
                          if (eventcontroller.validateForm()) {
                            _showSuccessDialog(context);
                          }
                        },
                      ),
                      const SizedBox(height: 98),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}