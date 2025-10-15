import 'package:flutter/material.dart';
import '../../../AppTheme/widgets/app_theme.dart';
import '../../../constants/aap_assets.dart';

class PasswordRequirementWidget extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordRequirementWidget({
    super.key,
    required this.text,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            AppAssets.tickPassIcon,
            width: 16,
            height: 16,
            color: isValid ? AppTheme.buttonColor : AppTheme.iconGreyColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: "Outfit",
                color: isValid ? AppTheme.buttonColor : AppTheme.textGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}