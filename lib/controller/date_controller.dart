import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Your existing date converter function
String convertToIsoFormat(String uiDate, {int utcHour = 18, int utcMinute = 0}) {
  // Parse the input date (22/12/2025)
  final DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(uiDate);

  // Convert to UTC with specified hour & minute
  final DateTime utcDate = DateTime.utc(
    parsedDate.year,
    parsedDate.month,
    parsedDate.day,
    utcHour,
    utcMinute,
  );

  // Return ISO 8601 string
  return utcDate.toIso8601String();
}





// USAGE EXAMPLE IN YOUR CODE:
/*
String backendDate = ''; // Store backend format


*/

// RECOMMENDED: Add to your EventController
/*
class EventController extends GetxController {
  final eventdateController = TextEditingController();
  final eventBackendDate = ''.obs; // Store backend format
  
  void setEventDate(String uiDate) {
    eventdateController.text = uiDate;
    
    // Convert to full format and then to ISO
    final fullDateFormat = DateFormat('dd/MM/yy').parse(uiDate);
    final fullDateString = DateFormat('dd/MM/yyyy').format(fullDateFormat);
    eventBackendDate.value = convertToIsoFormat(fullDateString);
    
    print('UI Date: $uiDate');
    print('Backend Date: ${eventBackendDate.value}');
  }
  
  @override
  void onClose() {
    eventdateController.dispose();
    super.onClose();
  }
}

// Then in your widget:
Obx(() => CustomDateTextField(
  onTapSuffixIcon: () async {
    final selectedDate = await CustomDatePicker.showCustomDatePicker(
      context: context,
    );
    if (selectedDate != null) {
      eventcontroller.setEventDate(selectedDate);
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
*/