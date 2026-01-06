// import 'package:flutter/material.dart';
//
// import '../AppTheme/app_theme.dart';
// import '../constants/app_text_style.dart';
//
//
// class CustomRadioButton extends StatelessWidget {
//   final String label;
//   final String? value;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const CustomRadioButton({
//     Key? key,
//     required this.label,
//     this.value,
//     required this.isSelected,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Container(
//             width: 20,
//             height: 20,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: isSelected ? AppTheme.lightIndigoColor : AppTheme.charcoalVioletColor.withOpacity(.3),
//                 width: 3,
//               ),
//             ),
//             child: isSelected
//                 ? Center(
//               child: Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppTheme.lightIndigoColor,
//                 ),
//               ),
//             )
//                 : null,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               label,
//               style: AppTextStyle.f12W400DSBColorTextStyle,
//             ),
//           ),
//           // if (value != null) ...[
//           //   Text(
//           //     value!,
//           //     style: AppTextStyle.titleTextStyle.copyWith(fontSize: 14),
//           //   ),
//           // ],
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../AppTheme/app_theme.dart';
import '../constants/app_text_style.dart';


class CustomRadioButton extends StatelessWidget {
  final String label;
  final String? value;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton({
    Key? key,
    required this.label,
    this.value,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min, // CRITICAL FIX: Added this line
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppTheme.lightCyanColor : AppTheme.charcoalVioletColor.withOpacity(.3),
                width: 3,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.lightCyanColor,
                ),
              ),
            )
                : null,
          ),
          if (label.isNotEmpty) ...[  // CRITICAL FIX: Only show if label is not empty
            const SizedBox(width: 8),
            Flexible(  // CRITICAL FIX: Changed from Expanded to Flexible
              child: Text(
                label,
                style: AppTextStyle.f12W400DSBColorTextStyle,
              ),
            ),
          ],
          // if (value != null) ...[
          //   Text(
          //     value!,
          //     style: AppTextStyle.titleTextStyle.copyWith(fontSize: 14),
          //   ),
          // ],
        ],
      ),
    );
  }
}