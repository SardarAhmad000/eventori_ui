import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/vendor/complete_profile_vendor/controller/complete_profile_vendor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../widgets/custom_stepper.dart';
import '../widgets/day_availability_row.dart';

class SetAvailabilityScreen extends StatefulWidget {
  const SetAvailabilityScreen({super.key});
  @override
  State<SetAvailabilityScreen> createState() => _SetAvailabilityScreenState();
}

class _SetAvailabilityScreenState extends State<SetAvailabilityScreen> {
  CompleteProfileVendorController completeProfileVendorController =Get.find();

  // Store availability data for each day
  Map<String, Map<String, dynamic>> availability = {
    'Monday': {'isAvailable': true, 'from': '', 'to': ''},
    'Tuesday': {'isAvailable': true, 'from': '', 'to': ''},
    'Wednesday': {'isAvailable': true, 'from': '', 'to': ''},
    'Thursday': {'isAvailable': true, 'from': '', 'to': ''},
    'Friday': {'isAvailable': true, 'from': '', 'to': ''},
    'Saturday': {'isAvailable': false, 'from': '', 'to': ''},
    'Sunday': {'isAvailable': false, 'from': '', 'to': ''},
  };

  // Store validation errors for each day
  Map<String, String?> validationErrors = {};

  void _updateAvailability(String day, bool isAvailable, String from, String to) {
    setState(() {
      availability[day] = {
        'isAvailable': isAvailable,
        'from': from,
        'to': to,
      };
      // Clear validation error when user makes changes
      validationErrors[day] = null;
    });
  }

  bool _validateAllDays() {
    bool isValid = true;
    setState(() {
      validationErrors.clear();
      availability.forEach((day, data) {
        String? error = CustomValidator.validateAvailability(
          data['isAvailable'],
          data['from'],
          data['to'],
        );
        if (error != null) {
          validationErrors[day] = error;
          isValid = false;
        }
      });
    });
    return isValid;
  }

  List<Map<String, String>> _getSelectedAvailability() {
    List<Map<String, String>> availabilityList = [];
    availability.forEach((day, data) {
      if (data['isAvailable'] && data['from'].isNotEmpty && data['to'].isNotEmpty) {
        availabilityList.add({
          "day": day,
          "from": data['from'],
          "to": data['to'],
        });
      }
    });
    return availabilityList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              AppAssets.appLogo,
              width: 38,
              height: 32,
            ),
            const SizedBox(height: 20),
            const CustomStepper(currentStep: 3),
            const SizedBox(height: 20),
            Text(
              'Set Availability',
              style: AppTextStyle.f20W600BColorTextStyle,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: availability.keys.map((day) {
                  final data = availability[day]!;
                  return DayAvailabilityRow(
                    day: day,
                    initialIsAvailable: data['isAvailable'],
                    initialFrom: data['from'],
                    initialTo: data['to'],
                    validationError: validationErrors[day],
                    onChanged: (isAvailable, from, to) {
                      _updateAvailability(day, isAvailable, from, to);
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              Text: 'Next',
              height: 48,
              width: double.infinity,
              buttonColor: AppTheme.lightCyanColor,
              textColor: AppTheme.whiteColor,
              textSize: 16,
              onTap: () {
                if (_validateAllDays()) {
                  // Get the formatted data
                  List<Map<String, String>> selectedData = _getSelectedAvailability();
                  // Print for debugging
                  print('=== Availability Data for Backend ===');
                  print(selectedData);
                  print('====================================');

                  completeProfileVendorController.storedAvailabilityTimeForReuse.value = selectedData.toString();

                  Get.toNamed(AppRoutes.preferenceFinalizationScreen);

                } else {
                  print('Validation Error');
                }
                },
            ),
          ],
        ),
      ),
    );
  }
}