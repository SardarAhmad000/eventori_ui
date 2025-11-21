// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class VendorBookingController extends GetxController {
//   // Booking Text Controllers
//   final TextEditingController nameBookedController = TextEditingController();
//   final TextEditingController emailBookedController = TextEditingController();
//   final TextEditingController phoneBookedController = TextEditingController();
//
//   // Report Vendor Text Controllers
//   final TextEditingController searchVendorController = TextEditingController();
//   final TextEditingController reasonVendorController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   // Booking Observable variables
//   final Rx<DateTime> selectedBookedDate = DateTime.now().obs;
//   final Rx<TimeOfDay> selectedBookedTime = TimeOfDay.now().obs;
//   final RxBool isBookedDateExpanded = false.obs;
//   final RxBool isBookedTimeExpanded = false.obs;
//   final RxBool isPM = false.obs;
//
//   // Validation error messages for booking
//   final Rxn<String> dateError = Rxn<String>();
//   final Rxn<String> timeError = Rxn<String>();
//
//   // Track if date/time were manually selected
//   final RxBool isDateManuallySelected = false.obs;
//   final RxBool isTimeManuallySelected = false.obs;
//
//   // Report Vendor Observable variables
//   final Rxn<String> selectedReason = Rxn<String>();
//   final RxList<String> reportReasons = <String>[
//     'Inappropriate behavior',
//     'Spam or scam',
//     'Fake profile',
//     'Poor service quality',
//     'Unprofessional conduct',
//     'Other',
//   ].obs;
//
//   // Validation error messages for report
//   final Rxn<String> reasonError = Rxn<String>();
//   final Rxn<String> descriptionError = Rxn<String>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize isPM based on current time
//     final currentHour = DateTime.now().hour;
//     isPM.value = currentHour >= 12;
//     selectedBookedTime.value = TimeOfDay.now();
//   }
//
//   @override
//   void onClose() {
//     // Booking controllers
//     nameBookedController.dispose();
//     emailBookedController.dispose();
//     phoneBookedController.dispose();
//
//     // Report Vendor controllers
//     searchVendorController.dispose();
//     reasonVendorController.dispose();
//     descriptionController.dispose();
//     super.onClose();
//   }
//
//   // ========== Booking Methods ==========
//
//   void selectDate(DateTime date) {
//     selectedBookedDate.value = date;
//     isDateManuallySelected.value = true;
//     dateError.value = null; // Clear error when date is selected
//   }
//
//   void selectTime(int hour, int minute) {
//     int adjustedHour = hour;
//     if (isPM.value && hour != 12) {
//       adjustedHour = hour + 12;
//     } else if (!isPM.value && hour == 12) {
//       adjustedHour = 0;
//     }
//     selectedBookedTime.value = TimeOfDay(hour: adjustedHour, minute: minute);
//     isTimeManuallySelected.value = true;
//     timeError.value = null;
//   }
//
//   void selectPeriod(String period) {
//     isPM.value = period == 'PM';
//     int currentHour = selectedBookedTime.value.hourOfPeriod == 0
//         ? 12
//         : selectedBookedTime.value.hourOfPeriod;
//     selectTime(currentHour, selectedBookedTime.value.minute);
//   }
//
//   void toggleDateExpanded() {
//     isBookedDateExpanded.value = !isBookedDateExpanded.value;
//     if (isBookedDateExpanded.value) {
//       isBookedTimeExpanded.value = false;
//     }
//   }
//
//   void toggleTimeExpanded() {
//     isBookedTimeExpanded.value = !isBookedTimeExpanded.value;
//     if (isBookedTimeExpanded.value) {
//       isBookedDateExpanded.value = false;
//     }
//   }
//
//   void changeMonth(int delta) {
//     selectedBookedDate.value = DateTime(
//       selectedBookedDate.value.year,
//       selectedBookedDate.value.month + delta,
//     );
//   }
//
//   String getFormattedDate() {
//     return DateFormat('MMM dd, yyyy').format(selectedBookedDate.value);
//   }
//
//   String getFormattedTime() {
//     final hour = selectedBookedTime.value.hourOfPeriod == 0
//         ? 12
//         : selectedBookedTime.value.hourOfPeriod;
//     final minute = selectedBookedTime.value.minute.toString().padLeft(2, '0');
//     final period = isPM.value ? 'PM' : 'AM';
//     return '$hour:$minute $period';
//   }
//
//   bool validateBookingForm() {
//     bool isValid = true;
//
//     // Clear previous errors
//     dateError.value = null;
//     timeError.value = null;
//
//     // Validate name
//     if (nameBookedController.text.isEmpty) {
//       isValid = false;
//     }
//
//     // Validate email
//     if (emailBookedController.text.isEmpty) {
//       isValid = false;
//     }
//
//     // Validate phone
//     if (phoneBookedController.text.isEmpty || phoneBookedController.text.length < 10) {
//       isValid = false;
//     }
//
//     // Validate date selection
//     if (!isDateManuallySelected.value) {
//       dateError.value = 'Please select a date';
//       isValid = false;
//     }
//
//     // Validate time selection
//     if (!isTimeManuallySelected.value) {
//       timeError.value = 'Please select a time';
//       isValid = false;
//     }
//
//     return isValid;
//   }
//
//   void submitBooking() {
//     // Print all booking data
//     print('========== BOOKING DATA ==========');
//     print('Name: ${nameBookedController.text}');
//     print('Email: ${emailBookedController.text}');
//     print('Phone: ${phoneBookedController.text}');
//     print('Date: ${getFormattedDate()}');
//     print('Time: ${getFormattedTime()}');
//     print('Selected Date: ${selectedBookedDate.value}');
//     print('Selected Time: ${selectedBookedTime.value.hour}:${selectedBookedTime.value.minute}');
//     print('Is PM: ${isPM.value}');
//     print('Date Manually Selected: ${isDateManuallySelected.value}');
//     print('Time Manually Selected: ${isTimeManuallySelected.value}');
//     print('==================================\n');
//
//     // Add your booking API call here
//     //
//     // // Show success message
//     // Get.snackbar(
//     //   'Success',
//     //   'Booking submitted successfully',
//     //   snackPosition: SnackPosition.BOTTOM,
//     //   backgroundColor: Colors.green,
//     //   colorText: Colors.white,
//     //   duration: Duration(seconds: 2),
//     // );
//
//     // Reset form after successful submission
//     // resetBookingForm();
//   }
//
//   void resetBookingForm() {
//     nameBookedController.clear();
//     emailBookedController.clear();
//     phoneBookedController.clear();
//     selectedBookedDate.value = DateTime.now();
//     selectedBookedTime.value = TimeOfDay.now();
//     isBookedDateExpanded.value = false;
//     isBookedTimeExpanded.value = false;
//     final currentHour = DateTime.now().hour;
//     isPM.value = currentHour >= 12;
//     isDateManuallySelected.value = false;
//     isTimeManuallySelected.value = false;
//     dateError.value = null;
//     timeError.value = null;
//   }
//
//   // ========== Report Vendor Methods ==========
//
//   void selectReason(String? reason) {
//     selectedReason.value = reason;
//     reasonError.value = null; // Clear error when reason is selected
//   }
//
//   void submitReport() {
//     // Clear previous errors
//     reasonError.value = null;
//     descriptionError.value = null;
//
//     // Validate fields
//     bool isValid = true;
//
//     if (selectedReason.value == null) {
//       reasonError.value = 'Please select a reason';
//       isValid = false;
//     }
//
//     if (descriptionController.text.isEmpty) {
//       descriptionError.value = 'Please provide a description';
//       isValid = false;
//     }
//
//     if (!isValid) return;
//
//     // Print all report data
//     print('========== REPORT VENDOR DATA ==========');
//     print('Vendor Name: ${searchVendorController.text}');
//     print('Report Reason: ${selectedReason.value}');
//     print('Description: ${descriptionController.text}');
//     print('Timestamp: ${DateTime.now()}');
//     print('========================================\n');
//
//     // Add your report API call here
//
//     // // Show success message
//     // Get.snackbar(
//     //   'Success',
//     //   'Report submitted successfully',
//     //   snackPosition: SnackPosition.BOTTOM,
//     //   backgroundColor: Colors.green,
//     //   colorText: Colors.white,
//     //   duration: Duration(seconds: 2),
//     // );
//
//     // Reset form after submission
//     resetReportForm();
//   }
//
//   void resetReportForm() {
//     searchVendorController.clear();
//     reasonVendorController.clear();
//     descriptionController.clear();
//     selectedReason.value = null;
//     reasonError.value = null;
//     descriptionError.value = null;
//   }
//
//   // ========== Common Methods ==========
//
//   void resetAllForms() {
//     resetBookingForm();
//     resetReportForm();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VendorBookingController extends GetxController {
  // Booking Text Controllers
  final TextEditingController nameBookedController = TextEditingController();
  final TextEditingController emailBookedController = TextEditingController();
  final TextEditingController phoneBookedController = TextEditingController();

  // Report Vendor Text Controllers
  final TextEditingController searchVendorController = TextEditingController();
  final TextEditingController reasonVendorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  // Booking Observable variables
  final Rx<DateTime> selectedBookedDate = DateTime.now().obs;
  final Rx<TimeOfDay> selectedBookedTime = TimeOfDay.now().obs;
  final RxBool isBookedDateExpanded = false.obs;
  final RxBool isBookedTimeExpanded = false.obs;
  final RxBool isPM = false.obs;

  // Validation error messages for booking
  final Rxn<String> dateError = Rxn<String>();
  final Rxn<String> timeError = Rxn<String>();

  // Track if date/time were manually selected
  final RxBool isDateManuallySelected = false.obs;
  final RxBool isTimeManuallySelected = false.obs;

  // Report Vendor Observable variables
  final Rxn<String> selectedReason = Rxn<String>();
  final RxList<String> reportReasons = <String>[
    'Inappropriate behavior',
    'Spam or scam',
    'Fake profile',
    'Poor service quality',
    'Unprofessional conduct',
    'Other',
  ].obs;

  // Validation error messages for report
  final Rxn<String> reasonError = Rxn<String>();
  final Rxn<String> descriptionError = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    // Initialize isPM based on current time
    final currentHour = DateTime.now().hour;
    isPM.value = currentHour >= 12;
    selectedBookedTime.value = TimeOfDay.now();
  }

  @override
  void onClose() {
    // Booking controllers
    nameBookedController.dispose();
    emailBookedController.dispose();
    phoneBookedController.dispose();

    // Report Vendor controllers
    searchVendorController.dispose();
    reasonVendorController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // ========== Booking Methods ==========

  void selectDate(DateTime date) {
    selectedBookedDate.value = date;
    isDateManuallySelected.value = true;
    dateError.value = null; // Clear error when date is selected
  }

  void selectTime(int hour, int minute) {
    int adjustedHour = hour;
    if (isPM.value && hour != 12) {
      adjustedHour = hour + 12;
    } else if (!isPM.value && hour == 12) {
      adjustedHour = 0;
    }
    selectedBookedTime.value = TimeOfDay(hour: adjustedHour, minute: minute);
    isTimeManuallySelected.value = true;
    timeError.value = null;
  }

  void selectPeriod(String period) {
    isPM.value = period == 'PM';
    int currentHour = selectedBookedTime.value.hourOfPeriod == 0
        ? 12
        : selectedBookedTime.value.hourOfPeriod;
    selectTime(currentHour, selectedBookedTime.value.minute);
  }

  void toggleDateExpanded() {
    isBookedDateExpanded.value = !isBookedDateExpanded.value;
    if (isBookedDateExpanded.value) {
      isBookedTimeExpanded.value = false;
    }
  }

  void toggleTimeExpanded() {
    isBookedTimeExpanded.value = !isBookedTimeExpanded.value;
    if (isBookedTimeExpanded.value) {
      isBookedDateExpanded.value = false;
    }
  }

  void changeMonth(int delta) {
    selectedBookedDate.value = DateTime(
      selectedBookedDate.value.year,
      selectedBookedDate.value.month + delta,
    );
  }

  String getFormattedDate() {
    return DateFormat('MMM dd, yyyy').format(selectedBookedDate.value);
  }

  String getFormattedTime() {
    final hour = selectedBookedTime.value.hourOfPeriod == 0
        ? 12
        : selectedBookedTime.value.hourOfPeriod;
    final minute = selectedBookedTime.value.minute.toString().padLeft(2, '0');
    final period = isPM.value ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  bool validateBookingForm() {
    bool isValid = true;

    // Clear previous errors
    dateError.value = null;
    timeError.value = null;

    // Validate name
    if (nameBookedController.text.isEmpty) {
      isValid = false;
    }

    // Validate email
    if (emailBookedController.text.isEmpty) {
      isValid = false;
    }

    // Validate phone
    if (phoneBookedController.text.isEmpty || phoneBookedController.text.length < 10) {
      isValid = false;
    }

    // Validate date selection
    if (!isDateManuallySelected.value) {
      dateError.value = 'Please select a date';
      isValid = false;
    }

    // Validate time selection
    if (!isTimeManuallySelected.value) {
      timeError.value = 'Please select a time';
      isValid = false;
    }

    return isValid;
  }

  void submitBooking() {
    // Print all booking data with formatted output
    print('\n');

    print(' BOOKING SUBMISSION - SUCCESS ');

    print(' Name: ${nameBookedController.text.padRight(40)}');
    print(' Email: ${emailBookedController.text.padRight(40)}');
    print(' Phone: ${phoneBookedController.text.padRight(40)}');
    print(' Date: ${getFormattedDate().padRight(40)}');
    print(' Time: ${getFormattedTime().padRight(40)}');
    print(' Period: ${(isPM.value ? 'PM' : 'AM').padRight(40)}');

    print(' Technical Details:');
    print(' Selected Date: ${selectedBookedDate.value.toString().substring(0, 10).padRight(40)}');
    print(' Selected Time: ${selectedBookedTime.value.hour.toString().padLeft(2, '0')}:${selectedBookedTime.value.minute.toString().padLeft(2, '0').padRight(37)}║');
    print(' Date Selected: ${(isDateManuallySelected.value ? 'Yes' : 'No').padRight(40)}');
    print(' Time Selected: ${(isTimeManuallySelected.value ? 'Yes' : 'No').padRight(40)}');
    print(' Timestamp: ${DateTime.now().toString().substring(0, 19).padRight(40)}');
    print('\n');

    // Add your booking API call here

  }

  void resetBookingForm() {
    nameBookedController.clear();
    emailBookedController.clear();
    phoneBookedController.clear();
    selectedBookedDate.value = DateTime.now();
    selectedBookedTime.value = TimeOfDay.now();
    isBookedDateExpanded.value = false;
    isBookedTimeExpanded.value = false;
    final currentHour = DateTime.now().hour;
    isPM.value = currentHour >= 12;
    isDateManuallySelected.value = false;
    isTimeManuallySelected.value = false;
    dateError.value = null;
    timeError.value = null;
  }

  // ========== Report Vendor Methods ==========

  void selectReason(String? reason) {
    selectedReason.value = reason;
    reasonError.value = null;
  }

  bool validateReportForm() {
    // Clear previous errors
    reasonError.value = null;
    descriptionError.value = null;

    bool isValid = true;

    // Validate vendor name
    if (searchVendorController.text.trim().isEmpty) {
      print('Validation Error: Vendor name is required');
      isValid = false;
    } else if (searchVendorController.text.trim().length < 2) {
      print(' Validation Error: Vendor name must be at least 2 characters');
      isValid = false;
    }

    // Validate reason selection
    if (selectedReason.value == null || selectedReason.value!.isEmpty) {
      reasonError.value = 'Please select a reason';
      print(' Validation Error: Report reason is required');
      isValid = false;
    }

    // Validate description
    if (descriptionController.text.trim().isEmpty) {
      descriptionError.value = 'Please describe what happened';
      print('Validation Error: Description is required');
      isValid = false;
    } else if (descriptionController.text.trim().length < 20) {
      descriptionError.value = 'Description must be at least 20 characters';
      print('Validation Error: Description must be at least 20 characters (current: ${descriptionController.text.trim().length})');
      isValid = false;
    } else if (descriptionController.text.trim().length > 500) {
      descriptionError.value = 'Description cannot exceed 500 characters';
      print('Validation Error: Description cannot exceed 500 characters (current: ${descriptionController.text.trim().length})');
      isValid = false;
    }

    return isValid;
  }

  void submitReport() {
    // Validate form first
    if (!validateReportForm()) {
      print('REPORT SUBMISSION - VALIDATION FAILED');
      return;
    }
    print('REPORT VENDOR SUBMISSION - SUCCESS ');
    print(' Vendor Name: ${searchVendorController.text.padRight(40)}');
    print('Report Reason: ${(selectedReason.value ?? '').padRight(40)}');
    print(' Description: ');

    // Split description into lines if it's too long
    String description = descriptionController.text;
    List<String> descLines = [];
    while (description.length > 56) {
      int lastSpace = description.substring(0, 56).lastIndexOf(' ');
      if (lastSpace == -1) lastSpace = 56;
      descLines.add(description.substring(0, lastSpace));
      description = description.substring(lastSpace).trim();
    }
    if (description.isNotEmpty) descLines.add(description);

    for (String line in descLines) {
      print(' ${line.padRight(58)}');
    }

    print(' Metadata: ');
    print(' Character Count:${descriptionController.text.length.toString().padRight(40)}');
    print(' Timestamp:${DateTime.now().toString().substring(0, 19).padRight(40)}');
    print(' Status: ${'Submitted'.padRight(40)}');
    // Add your report API call here
    resetReportForm();
  }

  void resetReportForm() {
    searchVendorController.clear();
    reasonVendorController.clear();
    descriptionController.clear();
    selectedReason.value = null;
    reasonError.value = null;
    descriptionError.value = null;

    print('\nReport form has been reset\n');
  }

  // ========== Common Methods ==========

  void resetAllForms() {
    resetBookingForm();
    resetReportForm();
    print('\nAll forms have been reset\n');
  }
}