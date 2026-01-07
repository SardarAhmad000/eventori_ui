import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../widgets/day_availability_row.dart';

class SetAvailabilityScreen extends StatefulWidget {
  const SetAvailabilityScreen({super.key});

  @override
  State<SetAvailabilityScreen> createState() => _SetAvailabilityScreenState();
}

class _SetAvailabilityScreenState extends State<SetAvailabilityScreen> {
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

  void _updateAvailability(String day, bool isAvailable, String from, String to) {
    availability[day] = {
      'isAvailable': isAvailable,
      'from': from,
      'to': to,
    };
  }

  void _onNextPressed() {
    // Print the results
    print('=== Availability Results ===');
    availability.forEach((day, data) {
      if (data['isAvailable']) {
        print('$day: Available from ${data['from']} to ${data['to']}');
      } else {
        print('$day: Not Available');
      }
    });
    print('========================');

    // Navigate to next screen or perform action
    // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        title: Text(
          'Set Availability',
          style: TextStyle(
            color: AppTheme.blackColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.blackColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: availability.keys.map((day) {
                final data = availability[day]!;
                return DayAvailabilityRow(
                  day: day,
                  initialIsAvailable: data['isAvailable'],
                  initialFrom: data['from'],
                  initialTo: data['to'],
                  onChanged: (isAvailable, from, to) {
                    _updateAvailability(day, isAvailable, from, to);
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _onNextPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.lightCyanColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}