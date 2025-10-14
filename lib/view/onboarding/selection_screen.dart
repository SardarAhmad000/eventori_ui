// import 'package:eventori/constants/app_text_style.dart';
// import 'package:eventori/view/onboarding/widgets/build_header.dart';
// import 'package:eventori/view/onboarding/widgets/selection_tittle.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../AppTheme/widgets/app_theme.dart';
// import '../../constants/custom_button.dart';
// import 'controller/Onboarding_controller.dart';
//
// class SelectionScreen extends StatefulWidget {
//   const SelectionScreen({super.key});
//
//   @override
//   State<SelectionScreen> createState() => _SelectionScreenState();
// }
//
// class _SelectionScreenState extends State<SelectionScreen> {
//   // String? selectedAccountType;
//
//   final List<Map<String, String>> accountTypes = [
//     {
//       'id': 'customer',
//       'title': 'Customer',
//       'description': 'Browse trusted vendors and find the right services for your event.',
//     },
//     {
//       'id': 'vendor',
//       'title': 'Event Vendor',
//       'description': 'Showcase your services and grow your business.',
//     },
//     {
//       'id': 'planner',
//       'title': 'Event Planner',
//       'description': 'Organize events and promote your services.',
//     },
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final controller = Get.find<OnboardingController>();
//
//     return Scaffold(
//       backgroundColor: AppTheme.blackColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             HeaderWidget(
//               onBackPressed: () => Navigator.pop(context),
//             ),
//             const SizedBox(height: 24),
//             const SelectionTitle(),
//             const Spacer(),
//
//             // ListView Builder
//
//             Obx(() => ListView.separated(
//               shrinkWrap: true,
//               itemCount: accountTypes.length,
//               separatorBuilder: (context, index) => const SizedBox(height: 16),
//               itemBuilder: (context, index) {
//                 final accountType = accountTypes[index];
//                 final isSelected = controller.selectedAccountType.value == accountType['id'];
//
//                 return GestureDetector(
//                   onTap: () => controller.selectAccountType(accountType['id']!),
//                   child: Container(
//                     height: 78,
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: AppTheme.cardColour,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(
//                         color: isSelected ? AppTheme.cardBorder : Colors.transparent,
//                         width: 1,
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         // Radio button
//                         Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: isSelected
//                                   ? AppTheme.radioButtonColour
//                                   : AppTheme.whiteColor,
//                               width: 1,
//                             ),
//                           ),
//                           child: isSelected
//                               ? Center(
//                             child: Container(
//                               width: 16,
//                               height: 16,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: AppTheme.radioButtonColour,
//                               ),
//                             ),
//                           )
//                               : null,
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 accountType['title']!,
//                                 style: AppTextStyle.cardTitle,
//                               ),
//                               Text(
//                                 accountType['description']!,
//                                 style: AppTextStyle.cardDescp,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             )),
//
//
//             const SizedBox(height: 12),
//             CustomButton(
//               Text: "Get Started",
//               width: double.infinity,
//               onTap: () {
//                 controller.onGetStarted();
//               },
//             ),
//             const SizedBox(height: 12),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/onboarding/widgets/build_header.dart';
import 'package:eventori/view/onboarding/widgets/selection_tittle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../AppTheme/widgets/app_theme.dart';
import '../../constants/custom_button.dart';
import 'controller/Onboarding_controller.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  final List<Map<String, String>> accountTypes = [
    {
      'id': 'customer',
      'title': 'Customer',
      'description': 'Browse trusted vendors and find the right services for your event.',
    },
    {
      'id': 'vendor',
      'title': 'Event Vendor',
      'description': 'Showcase your services and grow your business.',
    },
    {
      'id': 'planner',
      'title': 'Event Planner',
      'description': 'Organize events and promote your services.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            HeaderWidget(onBackPressed: () => Navigator.of(context).maybePop()),
            const SizedBox(height: 24),
            const SelectionTitle(),
            const Spacer(),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: accountTypes.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final accountType = accountTypes[index];
                return Obx(() {
                  final isSelected =
                      controller.selectedAccountType.value == accountType['id'];
                  return GestureDetector(
                    onTap: () =>
                        controller.selectAccountType(accountType['id']!),
                    child: Container(
                      height: 78,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.cardColour,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? AppTheme.cardBorder
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Radio button
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppTheme.radioButtonColour
                                    : AppTheme.whiteColor,
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
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  accountType['title']!,
                                  style: AppTextStyle.cardTitle,
                                ),
                                Text(
                                  accountType['description']!,
                                  style: AppTextStyle.cardDescp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),

            const SizedBox(height: 12),
            CustomButton(
              Text: "Get Started",
              width: double.infinity,
              onTap: () {
                controller.onGetStarted();
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
