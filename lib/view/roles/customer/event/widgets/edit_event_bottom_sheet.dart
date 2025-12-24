import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_checkbox.dart';
import '../../../../../app_widgets/custom_date_picker.dart';
import '../../../../../app_widgets/custom_date_textfield.dart';
import '../../../../../app_widgets/custom_dropdown.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_toggle.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../../../../../controller/date_controller.dart';
import '../../../../../models/event_model.dart';
import '../../../../../utils/date_helpers.dart';
import '../controller/event_controller.dart';

class EditEventBottomSheet extends StatefulWidget {
  final EventModel eventData;
  final Function()? onEventUpdated;

  const EditEventBottomSheet({
    Key? key,
    required this.eventData,
    this.onEventUpdated,
  }) : super(key: key);
  @override
  State<EditEventBottomSheet> createState() => _EditEventBottomSheetState();
}

class _EditEventBottomSheetState extends State<EditEventBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventController eventController = Get.find();
  final CustomImagePicker _imagePicker = CustomImagePicker();

  final TextEditingController eventEditNameController = TextEditingController();
  final TextEditingController eventEditAboutController = TextEditingController();
  final TextEditingController eventEditdateController = TextEditingController();

  String backendDate = '';

  final GlobalKey countryKey = GlobalKey();
  final GlobalKey cityKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Reset image selection
      eventController.selectedEventImage.value = null;

      // Set basic fields
      eventEditNameController.text = widget.eventData.eventName;
      eventEditAboutController.text = widget.eventData.about;
      eventController.selectedCategory.value = widget.eventData.eventCategory;
      eventController.isReminderEnabled.value = widget.eventData.sendReminderEmail;

      // Handle Country and City
      if (widget.eventData.country == null || widget.eventData.country.isEmpty) {
        eventController.isNotSureChecked.value = true;
        eventController.selectedCountry.value = null;
        eventController.selectedCity.value = null;
      } else {
        eventController.isNotSureChecked.value = false;
        eventController.selectedCountry.value = widget.eventData.country;
        eventController.selectedCity.value = widget.eventData.city;
      }

      // Handle Date
      if (widget.eventData.eventDate == null || widget.eventData.eventDate.isEmpty) {
        eventController.isNotSureDate.value = true;
        eventEditdateController.clear();
        backendDate = '';
      } else {
        eventController.isNotSureDate.value = false;
        eventEditdateController.text = formatIsoToDDMMYY(widget.eventData.eventDate);
        backendDate = widget.eventData.eventDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 90.h,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 75,
            height: 6,
            decoration: BoxDecoration(
              color: AppTheme.textfieldBorderColor,
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Edit Event',
                  style: AppTextStyle.f20W600BColorTextStyle,
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    eventController.selectedEventImage.value = null;
                    Get.back();
                  },
                  icon: Icon(Icons.close, color: AppTheme.blackColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        controller: eventEditNameController,
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
                          controller: eventEditAboutController,
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
                        value: eventController.selectedCategory.value,
                        items: eventController.eventCategories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {
                          eventController.selectedCategory.value = value;
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
                                  initialValue: eventController.isNotSureChecked.value,
                                  label: 'Not sure',
                                  labelStyle: AppTextStyle.f12W400BColorTextStyle,
                                  onChanged: (value) {
                                    eventController.isNotSureChecked.value = value;
                                    if (value) {
                                      // Clear country and city when "Not sure" is checked
                                      eventController.selectedCountry.value = null;
                                      eventController.selectedCity.value = null;
                                      eventController.countryError.value = null;
                                      eventController.cityError.value = null;
                                    }
                                  },
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Obx(() => Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  key: countryKey,
                                  onTap: eventController.isNotSureChecked.value
                                      ? null
                                      : () async {
                                    final renderBox = countryKey.currentContext!.findRenderObject() as RenderBox;
                                    final position = renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCountryData();
                                    countrySelect(
                                      context,
                                      position,
                                      size,
                                      eventController.countryVN,
                                    );
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: eventController.isNotSureChecked.value
                                          ? AppTheme.textfieldBorderColor.withOpacity(0.3)
                                          : AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: eventController.countryError.value != null
                                            ? AppTheme.redColor
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
                                            eventController.selectedCountry.value ?? 'Country',
                                            style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                                color: eventController.selectedCountry.value == null
                                                    ? AppTheme.silverColor
                                                    : AppTheme.darkpurpleColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down, color: AppTheme.slateGreyColor, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                                if (eventController.countryError.value != null && !eventController.isNotSureChecked.value)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4, left: 4),
                                    child: Text(
                                      eventController.countryError.value!,
                                      style: AppTextStyle.f12W400RColorTextStyle.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  key: cityKey,
                                  onTap: eventController.isNotSureChecked.value || eventController.selectedCountry.value == null
                                      ? null
                                      : () async {
                                    final renderBox = cityKey.currentContext!.findRenderObject() as RenderBox;
                                    final position = renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCityData(country: eventController.countryVN);
                                    citySelect(
                                      context,
                                      position,
                                      size,
                                      eventController.cityVN,
                                      country: eventController.countryVN,
                                    );
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: eventController.isNotSureChecked.value
                                          ? AppTheme.textfieldBorderColor.withOpacity(0.3)
                                          : AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: eventController.cityError.value != null
                                            ? AppTheme.redColor
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
                                            eventController.selectedCity.value ?? 'City',
                                            style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                                              color: eventController.selectedCity.value == null
                                                  ? AppTheme.silverColor
                                                  : AppTheme.darkpurpleColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down, color: AppTheme.slateGreyColor, size: 20),
                                      ],
                                    ),
                                  ),
                                ),
                                if (eventController.cityError.value != null && !eventController.isNotSureChecked.value)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4, left: 4),
                                    child: Text(
                                      eventController.cityError.value!,
                                      style: AppTextStyle.f12W400RColorTextStyle.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )),
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
                                  initialValue: eventController.isNotSureDate.value,
                                  label: 'Not sure',
                                  labelStyle: AppTextStyle.f12W400BColorTextStyle,
                                  onChanged: (value) {
                                    eventController.isNotSureDate.value = value;
                                    if (value) {
                                      // Clear date when "Not sure" is checked
                                      eventEditdateController.clear();
                                      backendDate = '';
                                    }
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
                          final DateTime? pickedDate =
                          await CustomDatePicker.showCustomDatePicker(
                            context: context,
                          );

                          if (pickedDate != null) {
                            final uiDate = DateFormat('dd-MM-yy').format(pickedDate);
                            eventEditdateController.text = uiDate;
                            backendDate = convertDateTimeToIso(pickedDate);
                          }
                        },
                        controller: eventEditdateController,
                        hintText: "Date",
                        fieldBorderColor: AppTheme.textfieldBorderColor,
                        validator: eventController.isNotSureDate.value
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
                          Obx(
                                () => CustomToggleSwitch(
                              initialValue: eventController.isReminderEnabled.value,
                              onChanged: (value) {
                                eventController.isReminderEnabled.value = value;
                              },
                              activeColor: AppTheme.blueColor,
                              inactiveColor: AppTheme.textfieldBorderColor,
                              width: 36,
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload image *',
                        style: AppTextStyle.f14W500BColorTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Obx(() {
                        final selectedImage = eventController.selectedEventImage.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: eventController.imageError.value != null ? AppTheme.redColor : AppTheme.textfieldBorderColor,
                                  width: eventController.imageError.value != null ? 2 : 1,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  selectedImage != null
                                      ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      selectedImage,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                      : ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: widget.eventData.image,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () async {
                                        final image = await _imagePicker.pickImageFromGallery();
                                        if (image != null) {
                                          eventController.setEventImage(image);
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
                            ),
                            if (eventController.imageError.value != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4, left: 4),
                                child: Text(
                                  eventController.imageError.value!,
                                  style: AppTextStyle.f12W400RColorTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: CustomButton(
              Text: 'Update Event',
              width: double.infinity,
              height: 48,
              buttonColor: AppTheme.lightCyanColor,
              textColor: AppTheme.whiteColor,
              onTap: () {
                if (eventController.validateEditForm(_formKey, eventEditdateController, widget.eventData.image)) {
                  print('=== Event Updated Successfully ===');
                  print('Event ID: ${widget.eventData.id}');
                  print('Event Name: ${eventEditNameController.text}');
                  print('About Event: ${eventEditAboutController.text}');
                  print('Category: ${eventController.selectedCategory.value}');
                  print('Country: ${eventController.selectedCountry.value ?? ""}');
                  print('City: ${eventController.selectedCity.value ?? ""}');
                  print('Date: ${eventEditdateController.text}');
                  print('Backend Date: $backendDate');
                  print('Not Sure Location: ${eventController.isNotSureChecked.value}');
                  print('Not Sure Date: ${eventController.isNotSureDate.value}');
                  print('Reminder: ${eventController.isReminderEnabled.value}');
                  print('New Image Selected: ${eventController.selectedEventImage.value != null}');
                  print('====================================');

                  // Call update API
                  eventController.updateEvent(
                      eventEditNameController.text,
                      eventController.selectedCategory.value ?? '',
                      eventEditAboutController.text,
                      eventController.selectedCountry.value ?? '',
                      eventController.selectedCity.value ?? '',
                      eventController.isNotSureDate.value? '': backendDate,
                      eventController.isReminderEnabled.value.toString(),
                      widget.eventData.id.toString()
                  );

                  // // widget.onEventUpdated?.call();
                  // Get.back();
                } else {
                  print('=== Form Validation Failed ===');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}