import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final VoidCallback onBackPressed;

  const HeaderWidget({
    Key? key,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppTheme.onboardingArrowColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppTheme.onboardingArrowColor,
                width: 1,
              ),
            ),
            child: Image.asset(
              AppAssets.arrowIcon,
              width: 24,
              height: 24,
            ),
          ),
          Image.asset(
            AppAssets.appLogo,
            width: 38,
            height: 32,
          ),
          SizedBox(
            width: 40,
          )
        ],
    );
  }
}
