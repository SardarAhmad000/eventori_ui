import 'package:intl/intl.dart';

class CustomValidator {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return ' Email address is required';
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return ' Please enter valid email';
    }
    return null;
  }

  static String? team(String? value) {
    if (value!.isEmpty) {
      return ' Enter team name';
    }
    return null;
  }

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
    if (value!.isEmpty) {
      return ' Enter event name';
    }
    return null;
  }
  static String? venue(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter venue';
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



  static String? dateAndTime(String? value) {
    if (value!.isEmpty) {
      return ' Please select date and Time';
    }
    return null;
  }

  static String? startDateAndTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a start date";
    }
    return null;
  }

  static String? gameData(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select game date";
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


  static String? score(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add score';
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
      return ' Enter group name';
    }
    return null;
  }

  static String? description(String? value) {
    if (value!.isEmpty) {
      return ' Enter group description';
    }
    return null;
  }

  static String? password(String? value) {
    // if (value!.isEmpty) {
    //   return 'Enter password';
    // } else if (value.length < 8) {
    //   return 'Password must be at least 8 characters';
    // }
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
    }
    // else if (value.length < 8) {
    //   return ' Password must be at least 8 characters';
    // }
    // else if (value != oldPassword) {
    //   return ' Confirm password is not matched';
    // }
    return null;
  }

  static String? firstName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your First Name';
    }
    return null;
  }

  static String? otp(String? value) {
    if (value!.isEmpty) {
      return 'Please enter otp';
    }
    if (value.length<4) {
      return 'Please enter valid otp';
    }
    return null;
  }

  static String? lastName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your Last Name';
    }
    return null;
  }
  static String? isEmptyFirstName(String? value) {
    // Check if the value is empty
    if (value!.isEmpty) {
      return "First name is required";
    }

    // Check if the value contains any digits
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return "First name cannot contain numbers";  // Add this message in Languages
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
    // Ensure value is not null or empty
    if (value == null || value.isEmpty) {
      return 'Please select gender';
    }

    // Check if the input contains any digits
    final RegExp numberRegex = RegExp(r'[0-9]');
    if (numberRegex.hasMatch(value)) {
      return 'Gender cannot contain numbers';
    }

    return null; // No errors
  }
}