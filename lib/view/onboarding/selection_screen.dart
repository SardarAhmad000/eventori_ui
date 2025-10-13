import 'package:eventori/view/onboarding/widgets/build_header.dart';
import 'package:eventori/view/onboarding/widgets/selection_tittle.dart';
import 'package:flutter/material.dart';

import '../../AppTheme/widgets/app_theme.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
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

              // const SizedBox(height: 40),
              // _buildAccountOptions(),
              // const Spacer(),
              // _buildGetStartedButton(),
              // const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
