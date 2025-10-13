import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/onboarding/widgets/build_header.dart';
import 'package:eventori/view/onboarding/widgets/selection_tittle.dart';
import 'package:flutter/material.dart';

import '../../AppTheme/widgets/app_theme.dart';
import '../../constants/custom_button.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  String? selectedAccountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _buildHeader(),
              HeaderWidget(
                onBackPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 24),
              SelectionTitle(),

              const Spacer(),

              _buildAccountOptions(),
              SizedBox(height: 12),

              CustomButton(
                Text: "Get Started",
                width: double.infinity,
                onTap: () {
                },
              ),

              SizedBox(height: 12,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOptions() {
    return Column(
      children: [
        _buildAccountTypeCard(
          'Customer',
          'Browse trusted vendors and find the right services for your event.',
          'customer',
        ),
        const SizedBox(height: 16),
        _buildAccountTypeCard(
          'Event Vendor',
          'Showcase your services and grow your business.',
          'vendor',
        ),
        const SizedBox(height: 16),
        _buildAccountTypeCard(
          'Event Planner',
          'Organize events and promote your services.',
          'planner',
        ),
      ],
    );
  }

  Widget _buildAccountTypeCard(String title, String description, String type) {
    final isSelected = selectedAccountType == type;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAccountType = type;
        });
      },

      child: SingleChildScrollView(
        child: Container(
          height: 78,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.cardColour : AppTheme.cardColour,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppTheme.cardBorder : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              _buildRadioButton(isSelected),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.cardTitle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyle.cardDescp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool isSelected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppTheme.radioButtonColour : AppTheme.whiteColor,
          width: 1,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.radioButtonColour,
          ),
        ),
      )
          : null,
    );
  }
}


