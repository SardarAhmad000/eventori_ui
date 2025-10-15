// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class AddProfilePhotoPageController extends GetxController {
//   final ImagePicker _picker = ImagePicker();
//
//   // Observable for profile image
//   Rx<File?> profileImage = Rx<File?>(null);
//
//   // Loading state
//   RxBool isLoading = false.obs;
//
//   // Pick image from gallery
//   Future<void> uploadPhoto() async {
//     try {
//       isLoading.value = true;
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.gallery,
//         maxWidth: 1080,
//         maxHeight: 1080,
//         imageQuality: 85,
//       );
//
//       if (pickedFile != null) {
//         profileImage.value = File(pickedFile.path);
//         Get.snackbar(
//           'Success',
//           'Photo uploaded successfully',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: const Duration(seconds: 2),
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//       Get.snackbar(
//         'Error',
//         'Failed to upload photo: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 2),
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Take photo with camera
//   Future<void> takePhoto() async {
//     try {
//       isLoading.value = true;
//       final XFile? pickedFile = await _picker.pickImage(
//         source: ImageSource.camera,
//         maxWidth: 1080,
//         maxHeight: 1080,
//         imageQuality: 85,
//       );
//
//       if (pickedFile != null) {
//         profileImage.value = File(pickedFile.path);
//         Get.snackbar(
//           'Success',
//           'Photo captured successfully',
//           snackPosition: SnackPosition.BOTTOM,
//           duration: const Duration(seconds: 2),
//         );
//       }
//     } catch (e) {
//       print(e.toString());
//       Get.snackbar(
//         'Error',
//         'Failed to capture photo: ${e.toString()}',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 2),
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Remove photo
//   void removePhoto() {
//     profileImage.value = null;
//   }
//
//   // Continue with selected photo
//   void continueWithPhoto() {
//     if (profileImage.value != null) {
//       // Navigate to next screen or save data
//       Get.snackbar(
//         'Success',
//         'Profile photo saved',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 2),
//       );
//       // Add your navigation logic here
//       // Get.toNamed(AppRoutes.nextPage);
//     } else {
//       Get.snackbar(
//         'Warning',
//         'Please select a photo first',
//         snackPosition: SnackPosition.BOTTOM,
//         duration: const Duration(seconds: 2),
//       );
//     }
//   }
//
//   // Skip photo upload
//   void skipPhotoUpload() {
//     // Navigate to next screen without photo
//     Get.snackbar(
//       'Skipped',
//       'You can add a photo later',
//       snackPosition: SnackPosition.BOTTOM,
//       duration: const Duration(seconds: 2),
//     );
//     // Add your navigation logic here
//     // Get.toNamed(AppRoutes.nextPage);
//   }
//
//   @override
//   void onClose() {
//     // Clean up resources
//     super.onClose();
//   }
// }