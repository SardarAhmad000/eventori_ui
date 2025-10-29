import 'package:flutter/material.dart';
import '../../../constants/app_text_style.dart';

class SelectionTitle extends StatelessWidget {
  const SelectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your account type',
          style: AppTextStyle.selectionTitleStyle,
        ),
        const SizedBox(height: 8),
        Text(
          'Tell us who you are so we can tailor your Eventori experience.',
          style: AppTextStyle.font16W400WhiteColorTextStyle,
        ),
      ],
    );
  }
}
