import 'dart:io';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class CustomImagePicker {
  final ImagePicker _picker = ImagePicker();

  /// Pick single image from gallery
  Future<File?> pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85, // Compress image to 85% quality
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      _showErrorSnackbar('Failed to pick image: $e');
      return null;
    }
  }

  /// Pick single image from camera
  Future<File?> pickImageFromCamera() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
      return null;
    } catch (e) {
      _showErrorSnackbar('Failed to capture image: $e');
      return null;
    }
  }

  /// Pick multiple images from gallery
  Future<List<File>> pickMultipleImages({int maxImages = 5}) async {
    try {
      final List<XFile> pickedFiles = await _picker.pickMultiImage(
        imageQuality: 85,
      );

      if (pickedFiles.isNotEmpty) {
        // Limit the number of images
        final limitedFiles = pickedFiles.take(maxImages).toList();
        return limitedFiles.map((xFile) => File(xFile.path)).toList();
      }
      return [];
    } catch (e) {
      _showErrorSnackbar('Failed to pick images: $e');
      return [];
    }
  }

  /// Show bottom sheet to choose between camera and gallery
  Future<File?> showImageSourceBottomSheet(BuildContext context) async {
    return await showModalBottomSheet<File?>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.silverColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Choose Image Source',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.silverColor,
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.photo_library, color: AppTheme.silverColor),
                  title: const Text('Gallery'),
                  onTap: () async {
                    final file = await pickImageFromGallery();
                    if (context.mounted) {
                      Navigator.pop(context, file);
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt, color: AppTheme.silverColor),
                  title: const Text('Camera'),
                  onTap: () async {
                    final file = await pickImageFromCamera();
                    if (context.mounted) {
                      Navigator.pop(context, file);
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Show error message
  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppTheme.redColor,
      colorText: AppTheme.whiteColor,
      duration: const Duration(seconds: 2),
    );
  }
}
// import 'dart:io';
// import 'package:eventori/AppTheme/app_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:get/get.dart';
//
// class CustomImagePicker {
//   final ImagePicker _picker = ImagePicker();
//
//   /// Pick single image from gallery
//   Future<File?> pickImageFromGallery() async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 85, // Compress image to 85% quality
//       );
//
//       if (pickedFile != null) {
//         return File(pickedFile.path);
//       }
//       return null;
//     } catch (e) {
//       _showErrorSnackbar('Failed to pick image: $e');
//       return null;
//     }
//   }
//
//   /// Pick single image from camera
//   Future<File?> pickImageFromCamera() async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.camera,
//         imageQuality: 85,
//       );
//
//       if (pickedFile != null) {
//         return File(pickedFile.path);
//       }
//       return null;
//     } catch (e) {
//       _showErrorSnackbar('Failed to capture image: $e');
//       return null;
//     }
//   }
//
//   /// Pick multiple images from gallery
//   Future<List<File>> pickMultipleImages({int maxImages = 5}) async {
//     try {
//       final List<XFile> pickedFiles = await _picker.pickMultiImage(
//         imageQuality: 85,
//       );
//
//       if (pickedFiles.isNotEmpty) {
//         // Limit the number of images
//         final limitedFiles = pickedFiles.take(maxImages).toList();
//         return limitedFiles.map((xFile) => File(xFile.path)).toList();
//       }
//       return [];
//     } catch (e) {
//       _showErrorSnackbar('Failed to pick images: $e');
//       return [];
//     }
//   }
//
//   /// Show bottom sheet to choose between camera and gallery
//   Future<File?> showImageSourceBottomSheet(BuildContext context) async {
//     return await showModalBottomSheet<File?>(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   width: 40,
//                   height: 4,
//                   decoration: BoxDecoration(
//                     color: AppTheme.silverColor,
//                     // color: Colors.grey[300],
//                     borderRadius: BorderRadius.circular(2),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Text(
//                   'Choose Image Source',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600,
//                     color: AppTheme.silverColor,
//                     // color: Colors.grey[800],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ListTile(
//                   leading: Icon(Icons.photo_library, color: AppTheme.blueColor),
//                   title: const Text('Gallery'),
//                   onTap: () async {
//                     Navigator.pop(context);
//                     final file = await pickImageFromGallery();
//                     if (context.mounted) {
//                       Navigator.pop(context, file);
//                     }
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.camera_alt, color: AppTheme.greenColor),
//                   title: const Text('Camera'),
//                   onTap: () async {
//                     Navigator.pop(context);
//                     final file = await pickImageFromCamera();
//                     if (context.mounted) {
//                       Navigator.pop(context, file);
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   /// Show error message
//   void _showErrorSnackbar(String message) {
//     Get.snackbar(
//       'Error',
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: AppTheme.redColor,
//       colorText: AppTheme.whiteColor,
//       duration: const Duration(seconds: 2),
//     );
//   }
// }