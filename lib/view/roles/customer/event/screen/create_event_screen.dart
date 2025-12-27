import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/constants/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_date_textfield.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_date_picker.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_toggle.dart';
import '../../../../../controller/date_controller.dart';
import '../controller/event_controller.dart';

class CreateEventScreen extends StatefulWidget {
  CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  EventController eventcontroller = Get.find();
  String backendDate = '';
  final GlobalKey countryKey = GlobalKey();
  final GlobalKey cityKey = GlobalKey();
  final CustomImagePicker _imagePicker = CustomImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
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
                            'Write About your event?',
                            style: AppTextStyle.f14W500BColorTextStyle,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: eventcontroller.eventAboutController,
                              maxLines: null,
                              expands: true,
                              cursorColor: AppTheme.lightCyanColor,
                              textAlignVertical: TextAlignVertical.top,
                              style: AppTextStyle.f16W400DPColorTextStyle,
                              decoration: InputDecoration(
                                hintText: 'Add about Your Event...',
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
                                      key: cityKey,
                                      onTap: eventcontroller.selectedCountry.value == null
                                          ? null
                                          : () async {
                                        final renderBox = cityKey.currentContext!
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
                                            Expanded(
                                              child: Text(
                                                eventcontroller.selectedCity.value ?? 'City',
                                                style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                                  color: eventcontroller.selectedCity.value == null
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
                                      if (eventcontroller.cityError.value != null &&
                                          !eventcontroller.isNotSureChecked.value) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 4, left: 4),
                                          child: Text(
                                            eventcontroller.cityError.value!,
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
                            onTapSuffixIcon: () async {
                              final DateTime? pickedDate = await CustomDatePicker.showCustomDatePicker(
                                context: context,
                              );

                              if (pickedDate != null) {
                                // ✅ UI format
                                final uiDate = DateFormat('dd-MM-yy').format(pickedDate);
                                eventcontroller.eventdateController.text = uiDate;
                                print('UI Format: $uiDate');

                                // ✅ Backend format (ISO UTC)
                                backendDate = convertDateTimeToIso(pickedDate);
                                print('Backend Format: $backendDate');
                              }
                            },
                            controller: eventcontroller.eventdateController,
                            hintText: "Date",
                            fieldBorderColor: AppTheme.textfieldBorderColor,
                            validator: eventcontroller.isNotSureDate.value
                                ? null
                                : CustomValidator.eventDate,
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
                            'Upload image *',
                            style: AppTextStyle.f14W500BColorTextStyle,
                          ),
                          const SizedBox(height: 8),
                          // Image Upload Section with CustomImagePicker
                          Obx(() {
                            final selectedImage = eventcontroller.selectedEventImage.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (selectedImage != null)
                                // Show selected image with option to remove
                                  Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: eventcontroller.imageError.value != null
                                            ? AppTheme.redColor
                                            : AppTheme.textfieldBorderColor,
                                        width: eventcontroller.imageError.value != null ? 2 : 1,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.file(
                                            selectedImage,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        // Remove button
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              eventcontroller.removeEventImage();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: AppTheme.blackColor.withOpacity(0.6),
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
                                        // Change image button
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: GestureDetector(
                                            onTap: () async {
                                              final image = await _imagePicker.pickImageFromGallery();
                                              if (image != null) {
                                                eventcontroller.setEventImage(image);
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 12,
                                                vertical: 8,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppTheme.lightCyanColor,
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.edit,
                                                    color: AppTheme.whiteColor,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    'Change',
                                                    style: TextStyle(
                                                      color: AppTheme.whiteColor,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                // Show upload area
                                  DottedBorder(
                                    color: eventcontroller.imageError.value != null
                                        ? Colors.red
                                        : AppTheme.silverColor,
                                    strokeWidth: eventcontroller.imageError.value != null ? 2 : 1,
                                    dashPattern: const [5, 3],
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(8),
                                    child: InkWell(
                                      onTap: () async {
                                        final image = await _imagePicker.pickImageFromGallery();
                                        if (image != null) {
                                          eventcontroller.setEventImage(image);
                                        }
                                      },
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
                                  ),
                                // Show error message if image is not selected
                                if (eventcontroller.imageError.value != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4, left: 4),
                                    child: Text(
                                      eventcontroller.imageError.value!,
                                      style: AppTextStyle.f12W400RColorTextStyle.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }),
                        ],
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        Text: 'Create Event',
                        width: double.infinity,
                        height: 48,
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        // // In the Create Event button's onTap:
                        // onTap: () {
                        //   // Pass formKey to validateForm
                        //   if (eventcontroller.validateForm(formKey)) {
                        //     print('Event Name: ${eventcontroller.eventNameController.text}');
                        //     // ... rest of your code
                        //   } else {
                        //     print('Form validation failed');
                        //   }
                        // },
                        onTap: () {
                          if (eventcontroller.validateForm()) {
                            print('Event Name: ${eventcontroller.eventNameController.text}');
                            print('About Event: ${eventcontroller.eventAboutController.text}');
                            print('Category: ${eventcontroller.selectedCategory.value}');
                            print('Country: ${eventcontroller.selectedCountry.value}');
                            print('City: ${eventcontroller.selectedCity.value}');
                            print('Date: ${eventcontroller.eventdateController.text}');
                            print('Backend Date: $backendDate');
                            print('Not Sure Location: ${eventcontroller.isNotSureChecked.value}');
                            print('Not Sure Date: ${eventcontroller.isNotSureDate.value}');
                            print('Reminder: ${eventcontroller.isReminderEnabled.value}');
                            print('Event Image: ${eventcontroller.selectedEventImage.value?.path ?? "No image selected"}');

                            eventcontroller.createEvent(
                                eventcontroller.eventNameController.text,
                                eventcontroller.selectedCategory.value ?? '',
                                eventcontroller.eventAboutController.text,
                                eventcontroller.selectedCountry.value ?? '',
                                eventcontroller.selectedCity.value ?? '',
                                eventcontroller.isNotSureDate.value?'': backendDate,
                                eventcontroller.isReminderEnabled.value,
                                eventcontroller.selectedEventImage.value?.path ?? ''
                            );


                            // _showSuccessDialog(context);
                          } else {
                            print('Form validation failed');
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