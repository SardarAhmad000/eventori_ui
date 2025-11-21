import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../controller/vendor_booking_controller.dart';

class VendorBookingBottomSheet extends StatelessWidget {
  final String vendorName;

  const VendorBookingBottomSheet({
    Key? key,
    required this.vendorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vendorBookingController = Get.put(VendorBookingController(), permanent: false);
    final _formKey = GlobalKey<FormState>();

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vendorName,
                        style: AppTextStyle.f16W500MBColorTextStyle,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Check Availability',
                        style: AppTextStyle.f20W600BColorTextStyle,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.stormyGrayColor,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: AppTheme.stormyGrayColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // child: Form(
            //   key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: vendorBookingController.nameBookedController,
                      // focusNode: nameFocus,
                      hintText: 'Name',
                      prefixIcon: Image.asset(
                        AppAssets.userIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.name,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorBookingController.emailBookedController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        AppAssets.mailIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.email,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: vendorBookingController.phoneBookedController,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Image.asset(
                        AppAssets.phoneIcon,
                        color: AppTheme.silverColor,
                      ),
                      validator: CustomValidator.phone,
                    ),
                    const SizedBox(height: 12),
                    // Select Date
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => vendorBookingController.toggleDateExpanded(),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: vendorBookingController.dateError.value != null
                                    ? AppTheme.redColor
                                    : AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  vendorBookingController.isBookedDateExpanded.value
                                      ? 'Select Date'
                                      : vendorBookingController.getFormattedDate(),
                                  style: vendorBookingController.isBookedDateExpanded.value
                                      ? AppTextStyle.f14W400SColorTextStyle
                                      : AppTextStyle.f14W500BColorTextStyle,
                                ),
                                Icon(
                                  vendorBookingController.isBookedDateExpanded.value
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: AppTheme.blueGrayColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (vendorBookingController.dateError.value != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 4),
                            child: Text(
                              vendorBookingController.dateError.value!,
                              style: AppTextStyle.f12W400RColorTextStyle,
                            ),
                          ),
                      ],
                    )),
                    // Calendar
                    Obx(() => vendorBookingController.isBookedDateExpanded.value
                        ? Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildCalendar(vendorBookingController),
                    )
                        : const SizedBox.shrink()),
                    const SizedBox(height: 12),
                    // Select Time
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => vendorBookingController.toggleTimeExpanded(),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: vendorBookingController.timeError.value != null
                                    ?  AppTheme.redColor
                                    : AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  vendorBookingController.isBookedTimeExpanded.value
                                      ? 'Select Time'
                                      : vendorBookingController.getFormattedTime(),
                                  style: vendorBookingController.isBookedTimeExpanded.value
                                      ? AppTextStyle.f14W400SColorTextStyle
                                      : AppTextStyle.f14W500BColorTextStyle,
                                ),
                                Icon(
                                  vendorBookingController.isBookedTimeExpanded.value
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: AppTheme.blueGrayColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (vendorBookingController.timeError.value != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 4),
                            child: Text(
                              vendorBookingController.timeError.value!,
                              style: AppTextStyle.f12W400RColorTextStyle,
                            ),
                          ),
                      ],
                    ),
                    ),
                    // Time Picker
                    Obx(() => vendorBookingController.isBookedTimeExpanded.value
                        ? Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildTimePicker(vendorBookingController),
                    )
                        : const SizedBox.shrink()),
                    const SizedBox(height: 24),
                    CustomButton(
                      Text: "Book now",
                      // When user taps the button
                      onTap: () {
                        // CLEAR previous error messages
                        vendorBookingController.dateError.value = null;
                        vendorBookingController.timeError.value = null;

                        bool isValid = true;

                        if (vendorBookingController.nameBookedController.text.isEmpty) {
                          // vendorBookingController.nameError.value = "Please enter your name";
                          isValid = false;
                        }

                        if (vendorBookingController.phoneBookedController.text.isEmpty) {
                          // vendorBookingController.phoneError.value = "Please enter your phone number";
                          isValid = false;
                        }

                        final now = DateTime.now();
                        final selectedDate = vendorBookingController.selectedBookedDate.value;

                        bool isSameAsCurrentDate =
                            selectedDate.year == now.year &&
                                selectedDate.month == now.month &&
                                selectedDate.day == now.day;

                        if (isSameAsCurrentDate &&
                            !vendorBookingController.isDateManuallySelected.value) {
                          vendorBookingController.dateError.value = 'Please select a date';
                          isValid = false;
                        }
                        if (!vendorBookingController.isTimeManuallySelected.value) {
                          vendorBookingController.timeError.value = 'Please select a time';
                          isValid = false;
                        }
                        if (isValid) {
                          vendorBookingController.submitBooking();
                          Navigator.pop(context);
                        }
                      },
                      // onTap: () {
                      //   // Clear previous errors
                      //   vendorBookingController.dateError.value = null;
                      //   vendorBookingController.timeError.value = null;
                      //
                      //   // Validate form
                      //   if (_formKey.currentState!.validate()) {
                      //     // Additional validation for date and time
                      //     bool isValid = true;
                      //
                      //     // Check if date is selected (not default)
                      //     final now = DateTime.now();
                      //     final selectedDate = vendorBookingController.selectedBookedDate.value;
                      //
                      //     if (selectedDate.year == now.year &&
                      //         selectedDate.month == now.month &&
                      //         selectedDate.day == now.day &&
                      //         !vendorBookingController.isDateManuallySelected.value) {
                      //       vendorBookingController.dateError.value = 'Please select a date';
                      //       isValid = false;
                      //     }
                      //
                      //     // Check if time is selected (not default)
                      //     if (!vendorBookingController.isTimeManuallySelected.value) {
                      //       vendorBookingController.timeError.value = 'Please select a time';
                      //       isValid = false;
                      //     }
                      //
                      //     if (isValid) {
                      //       vendorBookingController.submitBooking();
                      //       Navigator.pop(context);
                      //     }
                      //   }
                      // },
                      buttonColor: AppTheme.lightCyanColor,
                      textColor: AppTheme.whiteColor,
                      height: 48,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            // ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(VendorBookingController controller) {
    return Obx(() {
      final selectedBookedDate = controller.selectedBookedDate.value;
      final firstDayOfMonth = DateTime(selectedBookedDate.year, selectedBookedDate.month, 1);
      final lastDayOfMonth = DateTime(selectedBookedDate.year, selectedBookedDate.month + 1, 0);
      final daysInMonth = lastDayOfMonth.day;
      final firstWeekday = firstDayOfMonth.weekday % 7;

      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(selectedBookedDate),
                  style: AppTextStyle.f14W500SGColorTextStyle,
                ),
                const SizedBox(width: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => controller.changeMonth(-1),
                      icon: Icon(Icons.chevron_left, color: AppTheme.silverColor),
                    ),
                    IconButton(
                      onPressed: () => controller.changeMonth(1),
                      icon: Icon(Icons.chevron_right, color: AppTheme.silverColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                .map((day) => SizedBox(
              width: 32,
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyle.f14W500SColorTextStyle,
                ),
              ),
            ))
                .toList(),
          ),
          ...List.generate((daysInMonth + firstWeekday) ~/ 7 + 1, (weekIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (dayIndex) {
                  final dayNumber = weekIndex * 7 + dayIndex - firstWeekday + 1;
                  if (dayNumber < 1 || dayNumber > daysInMonth) {
                    return const SizedBox(width: 32, height: 32);
                  }

                  final date = DateTime(selectedBookedDate.year, selectedBookedDate.month, dayNumber);
                  final isSelected = date.day == selectedBookedDate.day &&
                      date.month == selectedBookedDate.month &&
                      date.year == selectedBookedDate.year;

                  return GestureDetector(
                    onTap: () => controller.selectDate(date),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isSelected ? AppTheme.lightCyanColor : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          dayNumber.toString(),
                          style: isSelected
                              ? AppTextStyle.f12W500WColorTextStyle
                              : AppTextStyle.f12W400SGColorTextStyle,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      );
    });
  }

  Widget _buildTimePicker(VendorBookingController controller) {
    final hours = List.generate(12, (i) => i + 1);
    final minutes = List.generate(60, (i) => i);
    final periods = ['AM', 'PM'];

    return Obx(() {
      final selectedBookedTime = controller.selectedBookedTime.value;
      final isPM = controller.isPM.value;

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScrollableNumber(
                controller,
                selectedBookedTime.hourOfPeriod == 0 ? 12 : selectedBookedTime.hourOfPeriod,
                hours,
                    (value) => controller.selectTime(value, selectedBookedTime.minute),
              ),
              Text(' : ', style: AppTextStyle.f24W600BColorTextStyle),
              _buildScrollableNumber(
                controller,
                selectedBookedTime.minute,
                minutes,
                    (value) => controller.selectTime(
                  selectedBookedTime.hourOfPeriod == 0 ? 12 : selectedBookedTime.hourOfPeriod,
                  value,
                ),
              ),
              const SizedBox(width: 16),
              _buildScrollablePeriod(
                controller,
                isPM ? 'PM' : 'AM',
                periods,
                    (value) => controller.selectPeriod(value),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    });
  }

  Widget _buildScrollableNumber(
      VendorBookingController controller,
      int value,
      List<int> items,
      Function(int) onSelect,
      ) {
    return SizedBox(
      height: 12.h,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(
          initialItem: items.indexOf(value),
        ),
        onSelectedItemChanged: (index) => onSelect(items[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            final isSelected = items[index] == value;
            return Center(
              child: Text(
                items[index].toString().padLeft(2, '0'),
                style: isSelected
                    ? AppTextStyle.f20W600BColorTextStyle
                    : AppTextStyle.f20W600SGColorTextStyle,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildScrollablePeriod(
      VendorBookingController controller,
      String value,
      List<String> items,
      Function(String) onSelect,
      ) {
    return SizedBox(
      height: 12.h,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(
          initialItem: items.indexOf(value),
        ),
        onSelectedItemChanged: (index) => onSelect(items[index]),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: items.length,
          builder: (context, index) {
            final isSelected = items[index] == value;
            return Center(
              child: Text(
                items[index],
                style: isSelected
                    ? AppTextStyle.f20W600BColorTextStyle
                    : AppTextStyle.f20W600SGColorTextStyle,
              ),
            );
          },
        ),
      ),
    );
  }
}

void showBookingBottomSheet(BuildContext context, String vendorName) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) => VendorBookingBottomSheet(
        vendorName: vendorName,
      ),
    ),
  );
}