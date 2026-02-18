import 'package:intl/intl.dart';
import 'dart:io';

class CustomValidator {
  // Existing validators...
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? name(String? value) {
    if (value!.isEmpty) {
      return ' Enter name';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return ' Phone number is required';
    } else if (value.length < 10) {
      return ' Please enter valid phone number';
    }
    return null;
  }

  // NEW: Identity Verification Validators

  /// Validates if a document file has been uploaded
  static String? documentFile(File? file) {
    if (file == null) {
      return 'Please upload a document (PDF)';
    }
    return null;
  }

  /// Validates if at least one portfolio image has been uploaded
  static String? portfolioImages(List<File> images) {
    if (images.isEmpty) {
      return 'Please upload at least one portfolio image';
    }
    return null;
  }

  /// Validates if a logo image has been uploaded
  static String? logoImage(File? file) {
    if (file == null) {
      return 'Please upload a logo';
    }
    return null;
  }

  /// Validates service description
  static String? serviceDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Service description is required';
    }
    if (value.trim().length < 20) {
      return 'Description must be at least 20 characters';
    }
    if (value.trim().length > 500) {
      return 'Description cannot exceed 500 characters';
    }
    return null;
  }

  /// Validates travel settings selection
  static String? travelSettings(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a travel setting';
    }
    return null;
  }

  /// Validates pricing tier selection
  static String? pricingTier(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a pricing tier';
    }
    return null;
  }

  /// Validates notice period selection
  static String? noticePeriod(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a notice period';
    }
    return null;
  }

  // Existing validators continue below...
  static String? position(String? value) {
    if (value!.isEmpty) {
      return ' Enter position name';
    }
    return null;
  }

  static String? competitor(String? value) {
    if (value == null || value.isEmpty) {
      return ' Enter competitor name';
    }
    return null;
  }

  static String? event(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter event name';
    }
    final regex = RegExp(r'^[A-Za-z ]+$');
    if (!regex.hasMatch(value)) {
      return 'Event name should not contain numbers or special characters';
    }
    return null;
  }

  static String? eventCategory(String? value) {
    if (value == null || value.isEmpty) {
      return '          Select event category';
    }
    return null;
  }

  static String? country(String? value) {
    if (value == null || value.isEmpty) {
      return ' Select country';
    }
    return null;
  }

  static String? city(String? value) {
    if (value == null || value.isEmpty) {
      return ' Select city';
    }
    return null;
  }

  static String? eventDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Select event date';
    }
    try {
      final DateTime selectedDate = DateFormat('dd-MM-yy').parseStrict(value.trim());
      final DateTime today = DateTime.now();
      final DateTime todayDate = DateTime(today.year, today.month, today.day);
      final DateTime pickedDate = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
      if (pickedDate.isBefore(todayDate)) {
        return 'Past dates are not allowed';
      }
    } catch (e) {
      return 'Invalid date format';
    }
    return null;
  }

  static String? reason(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter reason';
    }
    return null;
  }

  static String? subVenue(String? value) {
    if (value!.isEmpty) {
      return ' Enter sub venue address';
    }
    return null;
  }

  static String? season(String? value) {
    if (value!.isEmpty) {
      return ' Enter season name';
    }
    return null;
  }

  static String? dateEvent(String? value) {
    if (value!.isEmpty) {
      return ' Please select date ';
    }
    return null;
  }

  static String? startDateAndTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a start date";
    }
    return null;
  }

  static String? dateValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select date";
    }
    return null;
  }

  static String? endDateAndTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a end date";
    }
    return null;
  }

  static String? arrivalTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select arrival time";
    }
    return null;
  }

  static String? startTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select start time";
    }
    return null;
  }

  static String? attendee(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select attendee';
    }
    return null;
  }

  static String? role(String? value) {
    if (value == null || value.isEmpty) {
      return 'Select role';
    }
    return null;
  }

  static String? reminder(String? value) {
    if (value == null || value.isEmpty) {
      return 'Select reminder';
    }
    return null;
  }

  static String? location(String? value) {
    if (value!.isEmpty) {
      return ' Enter location';
    }
    return null;
  }

  static String? group(String? value) {
    if (value!.isEmpty) {
      return ' Enter City name';
    }
    return null;
  }

  static String? description(String? value) {
    if (value == null || value.isEmpty) {
      return ' Enter description';
    }
    if (value.trim().length < 10) {
      return ' Description must be at least 10 characters';
    }
    return null;
  }

  static String? vendorName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Vendor name is required';
    }
    if (value.trim().length < 2) {
      return 'Vendor name must be at least 2 characters';
    }
    return null;
  }

  static String? businessName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Business name is required';
    }
    if (value.trim().length < 2) {
      return 'Business name must be at least 2 characters';
    }
    return null;
  }

  static String? reasonCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a reason';
    }
    return null;
  }

  static String? reportDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please describe what happened';
    }
    if (value.trim().length < 20) {
      return 'Description must be at least 20 characters';
    }
    if (value.trim().length > 500) {
      return 'Description cannot exceed 500 characters';
    }
    return null;
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Enter password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? newPassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter new password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? oldPassword(String? value) {
    if (value!.isEmpty) {
      return 'Enter old password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String oldPassword) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length < 8) {
      return ' Password must be at least 8 characters';
    } else if (value != oldPassword) {
      return ' Confirm password is not matched';
    }
    return null;
  }

  static String? firstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your First Name';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
      return 'First Name should contain only letters';
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your Last Name';
    }
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
      return 'Last Name should contain only letters';
    }
    return null;
  }

  static String? otp(String? value) {
    if (value!.isEmpty) {
      return 'Please enter otp';
    }
    if (value.length < 4) {
      return 'Please enter valid otp';
    }
    return null;
  }

  static String? isEmptyFirstName(String? value) {
    if (value!.isEmpty) {
      return "First name is required";
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "First name cannot contain numbers";
    }
    return null;
  }

  static String? isEmptySubscriptionCode(String? value) {
    if (value!.isEmpty) {
      return 'Please enter subscription code';
    }
    return null;
  }

  static String? selectGenderRange(String? value) {
    if (value == null || value.isEmpty) {
      return '       Please select gender';
    }
    final RegExp numberRegex = RegExp(r'[0-9]');
    if (numberRegex.hasMatch(value)) {
      return 'Gender cannot contain numbers';
    }
    return null;
  }

  static String? otpRequired(String? value, int otpLength) {
    if (value == null || value.isEmpty) {
      return 'Enter your OTP';
    }
    if (value.length < otpLength) {
      return 'Please enter valid OTP';
    }
    return null;
  }

  static bool validateBookingFields({
    required String name,
    required String email,
    required String phone,
    required Function(String?) onNameError,
    required Function(String?) onEmailError,
    required Function(String?) onPhoneError,
  })
  {
    bool isValid = true;
    final nameError = CustomValidator.name(name);
    onNameError(nameError);
    if (nameError != null) isValid = false;
    final emailError = CustomValidator.email(email);
    onEmailError(emailError);
    if (emailError != null) isValid = false;
    final phoneError = CustomValidator.phone(phone);
    onPhoneError(phoneError);
    if (phoneError != null) isValid = false;
    return isValid;
  }

  static String? serviceProvider(String? value) {
    if (value == null || value.isEmpty) {
      return '     Please select a service';
    }
    return null;
  }

  // Validate availability: if from time is selected, to time must be selected
  static String? validateAvailability(bool isAvailable, String from, String to) {
    if (!isAvailable) {
      return null; // If day is not available, no validation needed
    }

    if (from.isNotEmpty && to.isEmpty) {
      return 'Please select "To" time';
    }

    if (from.isEmpty && to.isNotEmpty) {
      return 'Please select "From" time';
    }

    if (isAvailable && from.isEmpty && to.isEmpty) {
      return 'Please select both times';
    }

    return null; // Valid
  }

  static String? instagram(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter Instagram link';
    }

    final instagramRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?instagram\.com\/([A-Za-z0-9_.]+|p\/[A-Za-z0-9_-]+|reel\/[A-Za-z0-9_-]+|stories\/[A-Za-z0-9_.]+\/[0-9]+)\/?$',
      caseSensitive: false,
    );

    if (!instagramRegex.hasMatch(value.trim())) {
      return 'Please enter a valid Instagram link(https://instagram.com/example)';
    }

    return null;
  }

  static String? tiktok(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter TikTok link';
    }

    final tiktokRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?(tiktok\.com\/(@[A-Za-z0-9._]+|v\/[0-9]+|video\/[0-9]+)|vm\.tiktok\.com\/[A-Za-z0-9]+|vt\.tiktok\.com\/[A-Za-z0-9]+)\/?$',
      caseSensitive: false,
    );

    if (!tiktokRegex.hasMatch(value.trim())) {
      return 'Please enter a valid TikTok link(https://tiktok.com/@example)';
    }

    return null;
  }

  static String? facebook(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter Facebook link';
    }

    final facebookRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?facebook\.com\/(profile\.php\?id=\d+|[A-Za-z0-9.\-_/]+)\/?$',
      caseSensitive: false,
    );

    if (!facebookRegex.hasMatch(value.trim())) {
      return 'Please enter a valid Facebook link(https://facebook.com/example)';
    }

    return null;
  }

  static String? preferredContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a preferred contact method';
    }
    return null;
  }

  static String? teamMember(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Team member is optional
    }
    if (value.trim().length < 2) {
      return 'Team member name must be at least 2 characters';
    }
    return null;
  }

  static String? ageConfirmation(bool isConfirmed) {
    if (!isConfirmed) {
      return 'You must confirm you are over 18 years old';
    }
    return null;
  }

  static String? termsAcceptance(bool isAccepted) {
    if (!isAccepted) {
      return 'You must agree to the terms and conditions';
    }
    return null;
  }


}
// import 'package:intl/intl.dart';
//
// class CustomValidator {
//
//   // static String? email(String? value) {
//   //   if (value!.isEmpty) {
//   //     return ' Email address is required';
//   //   } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//   //       .hasMatch(value)) {
//   //     return ' Please enter valid email';
//   //   }
//   //   return null;
//   // }
//
//   // Booking validators
//   static String? email(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Email address is required';
//     }
//     final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
//         if (!emailRegex.hasMatch(value)) {
//     return 'Please enter a valid email';
//     }
//     return null;
//   }
//
//
//   static String? name(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter name';
//     }
//     return null;
//   }
//
//   static String? phone(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Phone number is required';
//     } else if (value.length < 10) {
//       return ' Please enter valid phone number';
//     }
//     return null;
//   }
//
//   static String? position(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter position name';
//     }
//     return null;
//   }
//
//   static String? competitor(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Enter competitor name';
//     }
//     return null;
//   }
//
//   static String? event(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Enter event name';
//     }
//
//     final regex = RegExp(r'^[A-Za-z ]+$');
//
//     if (!regex.hasMatch(value)) {
//       return 'Event name should not contain numbers or special characters';
//     }
//
//     return null;
//   }
//
//   // static String? event(String? value) {
//   //   if (value!.isEmpty) {
//   //     return ' Enter event name';
//   //   }
//   //   return null;
//   // }
//
//   static String? eventCategory(String? value) {
//     if (value == null || value.isEmpty) {
//       return '          Select event category';
//     }
//     return null;
//   }
//
//   // New validators for Create Event Screen
//   static String? country(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Select country';
//     }
//     return null;
//   }
//
//   static String? city(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Select city';
//     }
//     return null;
//   }
//
//
//   static String? eventDate(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Select event date';
//     }
//
//     try {
//       // Parse UI date format: dd-MM-yy
//       final DateTime selectedDate =
//       DateFormat('dd-MM-yy').parseStrict(value.trim());
//
//       // Normalize dates (remove time)
//       final DateTime today = DateTime.now();
//       final DateTime todayDate =
//       DateTime(today.year, today.month, today.day);
//
//       final DateTime pickedDate =
//       DateTime(selectedDate.year, selectedDate.month, selectedDate.day);
//
//       // Check past date
//       if (pickedDate.isBefore(todayDate)) {
//         return 'Past dates are not allowed';
//       }
//     } catch (e) {
//       return 'Invalid date format';
//     }
//
//     return null;
//   }
//
//   // static String? eventDate(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return ' Select event date';
//   //   }
//   //   return null;
//   // }
//
//   static String? reason(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Enter reason';
//     }
//     return null;
//   }
//
//   static String? subVenue(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter sub venue address';
//     }
//     return null;
//   }
//
//   static String? season(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter season name';
//     }
//     return null;
//   }
//
//   static String? dateEvent(String? value) {
//     if (value!.isEmpty) {
//       return ' Please select date ';
//     }
//     return null;
//   }
//
//   static String? startDateAndTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select a start date";
//     }
//     return null;
//   }
//
//   static String? dateValidtor(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select date";
//     }
//     return null;
//   }
//
//   static String? endDateAndTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select a end date";
//     }
//     return null;
//   }
//
//   static String? arrivalTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select arrival time";
//     }
//     return null;
//   }
//
//   static String? startTime(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Please select start time";
//     }
//     return null;
//   }
//
//   static String? attendee(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select attendee';
//     }
//     return null;
//   }
//
//   static String? role(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Select role';
//     }
//     return null;
//   }
//
//   static String? reminder(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Select reminder';
//     }
//     return null;
//   }
//
//
//   static String? location(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter location';
//     }
//     return null;
//   }
//
//   static String? group(String? value) {
//     if (value!.isEmpty) {
//       return ' Enter City name';
//     }
//     return null;
//   }
//
//   static String? description(String? value) {
//     if (value == null || value.isEmpty) {
//       return ' Enter description';
//     }
//     if (value.trim().length < 10) {
//       return ' Description must be at least 10 characters';
//     }
//     return null;
//   }
//
//     // Existing validators (keeping your existing ones)
//   static String? vendorName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Vendor name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Vendor name must be at least 2 characters';
//     }
//     return null;
//   }
//   static String? businessName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Business name is required';
//     }
//     if (value.trim().length < 2) {
//       return 'Business name must be at least 2 characters';
//     }
//     return null;
//   }
//
//   static String? reasonCategory(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select a reason';
//     }
//     return null;
//   }
//
//   static String? reportDescription(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Please describe what happened';
//     }
//     if (value.trim().length < 20) {
//       return 'Description must be at least 20 characters';
//     }
//     if (value.trim().length > 500) {
//       return 'Description cannot exceed 500 characters';
//     }
//     return null;
//   }
//
//   static String? password(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
//
//   static String? newPassword(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter new password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//
//     return null;
//   }
//
//   static String? oldPassword(String? value) {
//     if (value!.isEmpty) {
//       return 'Enter old password';
//     } else if (value.length < 8) {
//       return 'Password must be at least 8 characters';
//     }
//     return null;
//   }
//
//   static String? confirmPassword(String? value, String oldPassword) {
//     if (value!.isEmpty) {
//       return null;
//     }
//     else if (value.length < 8) {
//       return ' Password must be at least 8 characters';
//     }
//     else if (value != oldPassword) {
//       return ' Confirm password is not matched';
//     }
//     return null;
//   }
//   static String? firstName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Please enter your First Name';
//     }
//
//     if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
//       return 'First Name should contain only letters';
//     }
//
//     return null;
//   }
//
//   // static String? firstName(String? value) {
//   //   if (value!.isEmpty) {
//   //     return 'Please enter your First Name';
//   //   }
//   //   return null;
//   // }
//
//   static String? lastName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return 'Please enter your Last Name';
//     }
//
//     if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value.trim())) {
//       return 'Last Name should contain only letters';
//     }
//
//     return null;
//   }
//
//   // static String? lastName(String? value) {
//   //   if (value!.isEmpty) {
//   //     return 'Please enter your Last Name';
//   //   }
//   //   return null;
//   // }
//
//   static String? otp(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter otp';
//     }
//     if (value.length < 4) {
//       return 'Please enter valid otp';
//     }
//     return null;
//   }
//
//
//
//   static String? isEmptyFirstName(String? value) {
//     // Check if the value is empty
//     if (value!.isEmpty) {
//       return "First name is required";
//     }
//
//     // Check if the value contains any digits
//     if (RegExp(r'[0-9]').hasMatch(value)) {
//       return "First name cannot contain numbers"; // Add this message in Languages
//     }
//
//     return null;
//   }
//
//   static String? isEmptySubscriptionCode(String? value) {
//     if (value!.isEmpty) {
//       return 'Please enter subscription code';
//     }
//     return null;
//   }
//
//   static String? selectGenderRange(String? value) {
//     // Ensure value is not null or empty
//     if (value == null || value.isEmpty) {
//       return '       Please select gender';
//     }
//
//     // Check if the input contains any digits
//     final RegExp numberRegex = RegExp(r'[0-9]');
//     if (numberRegex.hasMatch(value)) {
//       return 'Gender cannot contain numbers';
//     }
//
//     return null; // No errors
//   }
//
//   static String? otpRequired(String? value, int otpLength) {
//     if (value == null || value.isEmpty) {
//       return 'Enter your OTP';
//     }
//     if (value.length < otpLength) {
//       return 'Please enter valid OTP';
//     }
//     return null;
//   }
//
//
//   // Booking form validation (returns true if valid)
//   static bool validateBookingFields({
//     required String name,
//     required String email,
//     required String phone,
//     required Function(String?) onNameError,
//     required Function(String?) onEmailError,
//     required Function(String?) onPhoneError,
//   }) {
//     bool isValid = true;
//
//     // Validate name
//     final nameError = CustomValidator.name(name);
//     onNameError(nameError);
//     if (nameError != null) isValid = false;
//
//     // Validate email
//     final emailError = CustomValidator.email(email);
//     onEmailError(emailError);
//     if (emailError != null) isValid = false;
//
//     // Validate phone
//     final phoneError = CustomValidator.phone(phone);
//     onPhoneError(phoneError);
//     if (phoneError != null) isValid = false;
//
//     return isValid;
//   }
//
//   static String? serviceProvider(String? value) {
//     if (value == null || value.isEmpty) {
//       return '     Please select a service';
//     }
//     return null;
//   }
//
// // static String? reasonCategory(String? value) {
// //   if (value == null || value.isEmpty) {
// //     return '           Select a reason';
// //   }
// //   return null;
// // }
//
//
// // static String? vendorName(String? value) {
// //   if (value == null || value.isEmpty) {
// //     return ' Enter vendor name';
// //   }
// //   if (value.trim().length < 2) {
// //     return ' Vendor name must be at least 2 characters';
// //   }
// //   return null;
// // }
//
// // NEW VALIDATOR: Report Description Validation
// // static String? reportDescription(String? value) {
// //   if (value == null || value.isEmpty) {
// //     return ' Please describe what happened';
// //   }
// //   if (value.trim().length < 20) {
// //     return ' Description must be at least 20 characters';
// //   }
// //   if (value.trim().length > 500) {
// //     return ' Description cannot exceed 500 characters';
// //   }
// //   return null;
// // }
//
// }
//
// //class CustomValidator {
//
// //
// //   // Optional: Add more validators as needed
// //   static String? email(String? value) {
// //     if (value == null || value.trim().isEmpty) {
// //       return 'Email is required';
// //     }
// //     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
// //     if (!emailRegex.hasMatch(value)) {
// //       return 'Please enter a valid email';
// //     }
// //     return null;
// //   }
// //
// //   static String? phone(String? value) {
// //     if (value == null || value.trim().isEmpty) {
// //       return 'Phone number is required';
// //     }
// //     if (value.trim().length < 10) {
// //       return 'Phone number must be at least 10 digits';
// //     }
// //     return null;
// //   }
// //
// //   static String? name(String? value) {
// //     if (value == null || value.trim().isEmpty) {
// //       return 'Name is required';
// //     }
// //     if (value.trim().length < 2) {
// //       return 'Name must be at least 2 characters';
// //     }
// //     return null;
// //   }
// // }
//
//
//   // static String? reasonCategory(String? value) {
//   //   if (value == null || value.isEmpty) {
//   //     return 'Please select a reason';
//   //   }
//   //   return null;
//   // }
//
//   // // New validator for report description
//   // static String? reportDescription(String? value) {
//   //   if (value == null || value.trim().isEmpty) {
//   //     return 'Please describe what happened';
//   //   }
//   //   if (value.trim().length < 20) {
//   //     return 'Description must be at least 20 characters';
//   //   }
//   //   if (value.trim().length > 500) {
//   //     return 'Description cannot exceed 500 characters';
//   //   }
//   //   return null;
//   // }