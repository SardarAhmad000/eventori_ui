import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../AppTheme/app_theme.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final Color activeColor;
  final Color inactiveColor;
  final Color completedColor;
  final double stepSize;
  final double lineHeight;

  const CustomStepper({
    Key? key,
    required this.currentStep,
    this.totalSteps = 4,
    this.activeColor = const Color(0xFF3FDDFF),
    this.inactiveColor = const Color(0xFFE0E0E0),
    this.completedColor = const Color(0xFF3FDDFF),
    this.stepSize = 24,
    this.lineHeight = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Divider Line
          Positioned(
            top: stepSize / 2 - lineHeight / 2,
            child: Container(
              width: 100.w,
              height: lineHeight,
              color: activeColor,
            ),
          ),
          // // Progress Line
          // Positioned(
          //   top: stepSize / 2 - lineHeight / 2,
          //   left: 0,
          //   child: Container(
          //     width: _calculateProgressWidth(),
          //     height: lineHeight,
          //     color: completedColor,
          //   ),
          // ),
          // Step Circles
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              totalSteps,
                  (index) => _buildStepCircle(index + 1),
            ),
          ),
        ],
      ),
    );
  }

  // double _calculateProgressWidth() {
  //   if (currentStep <= 1) return 0;
  //   double stepWidth = 100.w / (totalSteps - 1);
  //   return stepWidth * (currentStep - 1);
  // }

  Widget _buildStepCircle(int step) {
    bool isCompleted = step < currentStep;
    bool isActive = step == currentStep;
    bool isInactive = step > currentStep;

    Color circleColor;
    Color borderColor;
    Widget icon;

    if (isCompleted) {
      // Completed steps - white background, cyan border, cyan checkmark
      circleColor = AppTheme.whiteColor;
      borderColor = completedColor;
      icon = Image.asset(
        AppAssets.tickStepperIcon,
        width: 12,
      );
    } else if (isActive) {
      // Active/Current step - filled cyan background, cyan border, white number
      circleColor = activeColor;
      borderColor = activeColor;
      icon = Text(
        '$step',
        style: AppTextStyle.f10W400SGColorTextStyle.copyWith(color: AppTheme.whiteColor,fontWeight: FontWeight.w600),
      );
    } else {
      // Inactive/Future steps - white background, cyan border, cyan number
      circleColor = AppTheme.whiteColor;
      borderColor = activeColor; // Changed to activeColor (cyan) instead of gray
      icon = Text(
        '$step',
        style: AppTextStyle.f10W400SGColorTextStyle.copyWith(color: AppTheme.lightCyanColor,fontWeight: FontWeight.w600),
      );
    }

    return Container(
      width: stepSize,
      height: stepSize,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Center(child: icon),
    );
  }
}
