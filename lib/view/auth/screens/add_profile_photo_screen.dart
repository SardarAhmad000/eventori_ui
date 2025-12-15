import 'package:eventori/app_widgets/custom_button.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../AppTheme/app_theme.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../routes/app_routes.dart';
import '../../../app_widgets/custom_image_picker.dart';
import '../../onboarding/widgets/build_header.dart';

class AddProfilePhotoPage extends StatelessWidget {
  const AddProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final CustomImagePicker _imagePicker = CustomImagePicker();

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            CustomHeader(
              showLogo: false,
              arrowColor: AppTheme.midnightBlueColor,
              containerBackgroundColor: AppTheme.whiteColor,
            ),
            const SizedBox(height: 18),
            Text(
              'Add a profile photo',
              style: AppTextStyle.f32W600DPColorTextStyle,
            ),
            const SizedBox(height: 8),
            Text(
              'Upload a clear photo to personalise your profile.',
              style: AppTextStyle.f16W400SIColorTextStyle,
            ),
            const SizedBox(height: 30),

            // Profile Image Display Section
            Center(
              child: Obx(() {
                final image = authController.selectedProfileImage.value;

                return GestureDetector(
                  onTap: () async {
                    // Show bottom sheet to choose between gallery and camera
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppTheme.whiteColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo_library, color: AppTheme.lightCyanColor),
                              title: Text('Upload from Gallery', style: AppTextStyle.f16W500BColorTextStyle),
                              onTap: () async {
                                Navigator.pop(context);
                                final pickedImage = await _imagePicker.pickImageFromGallery();
                                if (pickedImage != null) {
                                  authController.setProfileImage(pickedImage);
                                }
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt, color: AppTheme.lightCyanColor),
                              title: Text('Take a Photo', style: AppTextStyle.f16W500BColorTextStyle),
                              onTap: () async {
                                Navigator.pop(context);
                                final pickedImage = await _imagePicker.pickImageFromCamera();
                                if (pickedImage != null) {
                                  authController.setProfileImage(pickedImage);
                                }
                              },
                            ),
                            if (image != null)
                              ListTile(
                                leading: Icon(Icons.delete, color: AppTheme.redColor),
                                title: Text('Remove Photo', style: AppTextStyle.f16W500BColorTextStyle),
                                onTap: () {
                                  Navigator.pop(context);
                                  authController.removeProfileImage();
                                },
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 169,
                        height: 169,
                        decoration: BoxDecoration(
                          color: image == null ? AppTheme.dividerColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(99999),
                          border: Border.all(
                            color: AppTheme.lightGrayishColor,
                            width: 1,
                          ),
                        ),
                        child: image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(99999),
                          child: Image.file(
                            image,
                            width: 169,
                            height: 169,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Center(
                          child: Image.asset(
                            AppAssets.uploadImageIcon,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      if (image != null)
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppTheme.lightCyanColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.edit,
                              color: AppTheme.whiteColor,
                              size: 16,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),

            const SizedBox(height: 16),
            Divider(
              thickness: 1,
              height: 1,
              color: AppTheme.dividerColor,
            ),
            const SizedBox(height: 15),

            // Upload/Take Photo Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    Text: "Upload a photo",
                    onTap: () async {
                      final image = await _imagePicker.pickImageFromGallery();
                      if (image != null) {
                        authController.setProfileImage(image);
                      }
                    },
                    buttonColor: AppTheme.paperWhiteColor,
                    textColor: AppTheme.lightCyanColor,
                    height: 48,
                    borderColor: AppTheme.lightCyanColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    Text: "Take a photo",
                    onTap: () async {
                      final image = await _imagePicker.pickImageFromCamera();
                      if (image != null) {
                        authController.setProfileImage(image);
                      }
                    },
                    buttonColor: AppTheme.paperWhiteColor,
                    textColor: AppTheme.silverColor,
                    height: 48,
                    borderColor: AppTheme.dividerColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              Text: "Continue",
              onTap: () {
                final imagePath = authController.getImagePath();
                if (imagePath != null) {
                  // print('Continuing with Profile Image Path: $imagePath');
                  // print(imagePath);
                  authController.imagePath.value=imagePath;
                  print(authController.imagePath.value);

                } else {
                  print('Continuing without profile image');
                }
                Get.toNamed(AppRoutes.signUpScreen, arguments: {
                  'role': Get.arguments['role'],
                  'profileImage': authController.selectedProfileImage.value,
                  // 'profileImagePath': imagePath,
                });
              },
              buttonColor: AppTheme.lightCyanColor,
              textColor: AppTheme.whiteColor,
              height: 48,
              width: double.infinity,
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  authController.imagePath.value='';
                  print('Skipping profile photo upload');
                  Get.toNamed(AppRoutes.signUpScreen, arguments: {
                    'role': Get.arguments['role'],
                  });
                },
                child: Text(
                  'Skip',
                  style: AppTextStyle.f16W400SColorTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppTheme.dividerColor,
                    thickness: 1,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Divider(
                    color: AppTheme.dividerColor,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:eventori/app_widgets/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../AppTheme/app_theme.dart';
// import '../../../constants/aap_assets.dart';
// import '../../../constants/app_text_style.dart';
// import '../../../routes/app_routes.dart';
// import '../../onboarding/widgets/build_header.dart';
//
// class AddProfilePhotoPage extends StatelessWidget {
//   const AddProfilePhotoPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.paperWhiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             CustomHeader(
//               showLogo: false,
//               arrowColor: AppTheme.midnightBlueColor,
//               containerBackgroundColor: AppTheme.whiteColor,
//             ),
//             const SizedBox(height: 18),
//             Text(
//               'Add a profile photo',
//               style: AppTextStyle.f32W600DPColorTextStyle,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Upload a clear photo to personalise your profile.',
//               style: AppTextStyle.f16W400SIColorTextStyle,
//             ),
//             const SizedBox(height: 30),
//             Center(
//               child: Container(
//                 width: 169,
//                 height: 169,
//                 decoration: BoxDecoration(
//                   color: AppTheme.dividerColor,
//                   borderRadius: BorderRadius.circular(99999),
//                   border: Border.all(
//                     color: AppTheme.lightGrayishColor,
//                     width: 1,
//                   ),
//                 ),
//                 child: Center(
//                   child: Image.asset(
//                     AppAssets.uploadImageIcon,
//                     width: 40,
//                     height: 40,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Divider(
//               thickness: 1,
//               height: 1,
//               color: AppTheme.dividerColor,
//             ),
//             const SizedBox(height: 15),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: CustomButton(
//                     Text: "Upload a photo",
//                     onTap: () {},
//                     buttonColor: AppTheme.paperWhiteColor,
//                     textColor: AppTheme.lightCyanColor,
//                     height: 48,
//                     borderColor: AppTheme.lightCyanColor,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: CustomButton(
//                     Text: "Take a photo",
//                     onTap: () {},
//                     buttonColor: AppTheme.paperWhiteColor,
//                     textColor: AppTheme.silverColor,
//                     height: 48,
//                     borderColor: AppTheme.dividerColor,
//                   ),
//                 ),
//               ],
//             ),
//
//             const Spacer(),
//
//             CustomButton(
//               Text: "Continue",
//               onTap: () {
//                 Get.toNamed(AppRoutes.signUpScreen,arguments: {
//                   'role':Get.arguments['role']
//                 });
//                 print(Get.arguments['role']);
//               },
//               buttonColor: AppTheme.lightCyanColor,
//               textColor: AppTheme.whiteColor,
//               height: 48,
//               width: double.infinity,
//             ),
//             const SizedBox(height: 20),
//             Center(
//               child: GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   'Skip',
//                   style: AppTextStyle.f16W400SColorTextStyle,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Divider(
//                     color: AppTheme.dividerColor,
//                     thickness: 1,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Divider(
//                     color: AppTheme.dividerColor,
//                     thickness: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }