import 'package:flutter/material.dart';

import '../../../AppTheme/widgets/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';

class AddProfilePhotoPage extends StatelessWidget {
  const AddProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.backArrowBorderColor,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    AppAssets.arrowIcon,
                    color: AppTheme.blackColor,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              //// Title + subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add a profile photo',
                    style: AppTextStyle.addProfileTitleStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Upload a clear photo to personalise your profile.',
                    style: AppTextStyle.addProfileSubtitleStyle,
                  ),
                ],
              ),

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 169,
                      height: 169,
                      decoration: BoxDecoration(
                        color: AppTheme.uploadContainerColor,
                        borderRadius: BorderRadius.circular(99999),
                        border: Border.all(
                          color: AppTheme.backArrowBorderColor,
                          width: 1,
                        ),
                      ),
                      child:Image.asset(AppAssets.uploadIcon),
                      // Icon(Icons.file_upload_outlined, size: 40,),
                    ),

                  ],
                ),
              )

              //
              // const SizedBox(height: 28),
              //
              // // Centered circle upload area
              // Center(
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 160,
              //         height: 160,
              //         decoration: BoxDecoration(
              //           color: const Color(0xFFDDE7EE),
              //           shape: BoxShape.circle,
              //         ),
              //         child: Center(
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               // use the provided image if you want, otherwise use icon
              //               // If you want to show the developer-provided image inside this circle,
              //               // replace the Icon with Image.asset('assets/your_image.png')
              //               Icon(
              //                 Icons.cloud_upload_outlined,
              //                 size: 36,
              //                 color: Colors.grey.shade700,
              //               ),
              //               const SizedBox(height: 8),
              //               Text(
              //                 'Upload',
              //                 style: TextStyle(color: Colors.grey.shade700),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //
              //       const SizedBox(height: 30),
              //
              //       // Buttons row: Upload a photo (filled) and Take a photo (outline)
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           // Filled
              //           ElevatedButton(
              //             onPressed: () {
              //               // implement upload action
              //             },
              //             style: ElevatedButton.styleFrom(
              //               // backgroundColor: primaryTeal,
              //               minimumSize: const Size(150, 48),
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //               elevation: 0,
              //             ),
              //             child: const Text(
              //               'Upload a photo',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(width: 12),
              //
              //           // Outlined
              //           OutlinedButton(
              //             onPressed: () {
              //               // implement take photo action
              //             },
              //             style: OutlinedButton.styleFrom(
              //               // side: BorderSide(color: primaryTeal, width: 1.5),
              //               minimumSize: const Size(150, 48),
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(12),
              //               ),
              //             ),
              //             child: Text(
              //               'Take a photo',
              //               style: TextStyle(
              //                 // color: primaryTeal,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              //
              // // Use Expanded to push Continue button to bottom area similar to screenshot
              // const Spacer(),
              //
              // // Continue Button (full width)
              // SizedBox(
              //   width: double.infinity,
              //   height: 52,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       // navigate or continue
              //     },
              //     style: ElevatedButton.styleFrom(
              //       // backgroundColor: primaryTeal,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12),
              //       ),
              //       elevation: 0,
              //     ),
              //     child: const Text(
              //       'Continue',
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              //
              // const SizedBox(height: 12),
              //
              // // Skip text and divider
              // Column(
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         // skip action
              //       },
              //       child: const Text(
              //         'Skip',
              //         style: TextStyle(
              //           color: Color(0xFF9CA3AF),
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(height: 6),
              //     Container(
              //       height: 1,
              //       color: const Color(0xFFE6E9EC),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
    );
  }
}
