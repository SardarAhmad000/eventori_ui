// import 'package:eventori/AppTheme/widgets/app_theme.dart';
// import 'package:eventori/constants/aap_assets.dart';
// import 'package:flutter/material.dart';
//
// class HeaderWidget extends StatelessWidget {
//   final VoidCallback onBackPressed;
//
//   const HeaderWidget({
//     Key? key,
//     required this.onBackPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: onBackPressed,
//             child: Container(
//               width: 36,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: AppTheme.onboardingArrowColor,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: AppTheme.onboardingArrowColor,
//                   width: 1,
//                 ),
//               ),
//               child: Image.asset(
//                 AppAssets.arrowIcon,
//                 width: 24,
//                 height: 24,
//               ),
//             ),
//           ),
//           Image.asset(
//             AppAssets.appLogo,
//             width: 38,
//             height: 32,
//           ),
//           SizedBox(
//             width: 40,
//           )
//         ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/aap_assets.dart';

class CustomHeader extends StatelessWidget {
  final Color backgroundColor;
  final Color arrowColor;
  final Color containerBackgroundColor;
  final Color borderColor;
  final VoidCallback? onBackPressed;
  final bool showLogo;

  const CustomHeader({
    Key? key,
    this.backgroundColor = Colors.white,
    this.arrowColor = Colors.black,
    this.containerBackgroundColor = Colors.white,
    this.borderColor = const Color(0xFFE0E0E0),
    this.onBackPressed,
    this.showLogo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBackPressed ?? Get.back,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: containerBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
              ),
              child: Image.asset(
                AppAssets.arrowIcon,
                color: arrowColor,
                width: 24,
                height: 24,
              ),
            ),
          ),
          if (showLogo)
            Image.asset(
              AppAssets.appLogo,
              width: 38,
              height: 32,
            )
          else
            const SizedBox.shrink(),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}