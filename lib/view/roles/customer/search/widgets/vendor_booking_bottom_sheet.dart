import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';

class VendorBookingBottomSheet extends StatefulWidget {
  final String vendorName;

  const VendorBookingBottomSheet({
    Key? key,
    required this.vendorName,
  }) : super(key: key);

  @override
  State<VendorBookingBottomSheet> createState() => _VendorBookingBottomSheetState();
}

class _VendorBookingBottomSheetState extends State<VendorBookingBottomSheet> {
  final TextEditingController nameBookedController = TextEditingController();
  final TextEditingController emailBookedController = TextEditingController();
  final TextEditingController phoneBookedController = TextEditingController();

  DateTime selectedBookedDate = DateTime.now();
  TimeOfDay selectedBookedTime = TimeOfDay.now();
  bool isBookedDateExpanded = false;
  bool isBookedTimeExpanded = false;

  @override
  void dispose() {
    nameBookedController.dispose();
    emailBookedController.dispose();
    phoneBookedController.dispose();
    super.dispose();
  }

  void _selectDate(DateTime date) {
    setState(() {
      selectedBookedDate = date;
    });
  }

  void _selectTime(int hour, int minute, bool isPM) {
    setState(() {
      int adjustedHour = hour;
      if (isPM && hour != 12) {
        adjustedHour = hour + 12;
      } else if (!isPM && hour == 12) {
        adjustedHour = 0;
      }
      selectedBookedTime = TimeOfDay(hour: adjustedHour, minute: minute);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        widget.vendorName,
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: nameBookedController,
                    hintText: 'Name',
                    prefixIcon: Image.asset(
                      AppAssets.userIcon,
                      color: AppTheme.silverColor,
                    ),
                    // validator: CustomValidator.firstName,
                  ),
                  const SizedBox(height: 12),
                  // Email Field

                  CustomTextField(
                    controller: emailBookedController,
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
                    controller: phoneBookedController,
                    hintText: 'Phone',
                    keyboardType: TextInputType.phone,
                    prefixIcon: Image.asset(
                      AppAssets.phoneIcon,
                      color: AppTheme.silverColor,
                    ),
                    // validator: CustomValidator.phoneNumber,
                  ),

                  const SizedBox(height: 12),
                  // Select Date
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isBookedDateExpanded = !isBookedDateExpanded;
                        if (isBookedDateExpanded) isBookedTimeExpanded = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Date',
                            style: AppTextStyle.f14W400SColorTextStyle,
                          ),
                          Icon(
                            isBookedDateExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppTheme.blueGrayColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Calendar
                  if (isBookedDateExpanded)
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildCalendar(),
                    ),

                  const SizedBox(height: 12),

                  // Select Time
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isBookedTimeExpanded = !isBookedTimeExpanded;
                        if (isBookedTimeExpanded) isBookedDateExpanded = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Select Time',
                            style: AppTextStyle.f14W400SColorTextStyle,
                          ),
                          Icon(
                            isBookedTimeExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppTheme.blueGrayColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Time Picker
                  if (isBookedTimeExpanded)
                    Container(
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _buildTimePicker(),
                    ),


                  const SizedBox(height: 24),
                  CustomButton(
                    Text: "Book now",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonColor: AppTheme.lightCyanColor,
                    textColor: AppTheme.whiteColor,
                    height: 48,
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

  Widget _buildCalendar() {
    final now = DateTime.now();
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
                SizedBox(width: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedBookedDate = DateTime(
                            selectedBookedDate.year,
                            selectedBookedDate.month - 1,
                          );
                        });
                      },
                      icon: Icon(Icons.chevron_left, color: AppTheme.silverColor),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedBookedDate = DateTime(
                            selectedBookedDate.year,
                            selectedBookedDate.month + 1,
                          );
                        });
                      },
                      icon: Icon(Icons.chevron_right, color: AppTheme.silverColor),
                    ),
                  ],
                ),
              ],
            )

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
                  onTap: () => _selectDate(date),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.lightCyanColor
                          : Colors.transparent,
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
  }

  Widget _buildTimePicker() {
    final hours = List.generate(12, (i) => i + 1);
    final minutes = List.generate(60, (i) => i);
    final isPM = selectedBookedTime.hour >= 12;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildScrollableNumber(
              selectedBookedTime.hourOfPeriod == 0 ? 12 : selectedBookedTime.hourOfPeriod,
              hours,
                  (value) => _selectTime(value, selectedBookedTime.minute, isPM),
            ),
            Text(' : ', style: AppTextStyle.f24W600BColorTextStyle),
            _buildScrollableNumber(
              selectedBookedTime.minute,
              minutes,
                  (value) => _selectTime(
                    selectedBookedTime.hourOfPeriod == 0 ? 12 : selectedBookedTime.hourOfPeriod,
                value,
                isPM,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              isPM ? 'PM' : 'AM',
              style: AppTextStyle.f20W600BColorTextStyle,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildScrollableNumber(int value, List<int> items, Function(int) onSelect) {
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