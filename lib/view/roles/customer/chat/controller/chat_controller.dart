// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
//
// class ChatDetailedController extends GetxController {
//
//   final vendorsController = TextEditingController();
//   final selectedTab = 'All'.obs;
//
//   // Observable variables
//   final messages = <types.Message>[].obs;
//   final textController = TextEditingController();
//   final menuKey = GlobalKey();
//
//   // Reply functionality
//   final Rx<types.Message?> replyingTo = Rx<types.Message?>(null);
//
//   // User instances
//   late final types.User user;
//   late final types.User vendor;
//
//   // Parameters from navigation
//   String name = 'Vendor Name';
//   String avatarUrl = '';
//   bool isSaved = false;
//
//   void updateSelectedTab(String tab) {
//     selectedTab.value = tab;
//   }
//
//   @override
//   void onClose() {
//     vendorsController.dispose();
//     textController.dispose();
//     super.onClose();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // Get the passed parameters safely
//     if (Get.arguments != null) {
//       name = Get.arguments['name'] ?? 'Vendor Name';
//       avatarUrl = Get.arguments['avatarUrl'] ?? '';
//       isSaved = Get.arguments['isSaved'] ?? false;
//     }
//
//     // Initialize users
//     user = const types.User(id: 'user-id-1', firstName: 'Jane');
//     vendor = types.User(id: 'vendor-id-1', firstName: name);
//
//     // Load initial messages
//     _loadInitialMessages();
//   }
//
//   void _loadInitialMessages() {
//     // Add initial messages matching the screenshot - NO STATUS to remove tick
//     final message1 = types.TextMessage(
//       author: vendor,
//       createdAt: DateTime.now().subtract(const Duration(hours: 2)).millisecondsSinceEpoch,
//       id: 'msg-1',
//       text: 'Hi! Are you available for event',
//     );
//
//     final message2 = types.TextMessage(
//       author: user,
//       createdAt: DateTime.now().subtract(const Duration(hours: 1)).millisecondsSinceEpoch,
//       id: 'msg-2',
//       text: 'Hello! Yes, I\'m available on that date. ✓',
//       // Removed status property - no tick will be shown
//     );
//
//     final message3 = types.TextMessage(
//       author: user,
//       createdAt: DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch,
//       id: 'msg-3',
//       text: 'ok',
//       // Removed status property - no tick will be shown
//     );
//
//     messages.addAll([message3, message2, message1]);
//   }
//
//   void handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       text: message.text,
//       repliedMessage: replyingTo.value, // Add replied message if any
//       // No status property - no tick will be shown
//     );
//
//     messages.insert(0, textMessage);
//
//     // Clear reply after sending
//     if (replyingTo.value != null) {
//       cancelReply();
//     }
//   }
//
//   void handleCameraPressed() {
//     print('Camera icon pressed');
//     // Add your camera logic here
//   }
//
//   void sendMessage() {
//     if (textController.text.trim().isNotEmpty) {
//       handleSendPressed(types.PartialText(text: textController.text));
//       textController.clear();
//     }
//   }
//
//   // Reply functionality methods
//   void handleMessageLongPress(BuildContext context, types.Message message) {
//     // Show bottom sheet with reply option
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.reply),
//               title: const Text('Reply'),
//               onTap: () {
//                 replyToMessage(message);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.copy),
//               title: const Text('Copy'),
//               onTap: () {
//                 // Add copy functionality if needed
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void replyToMessage(types.Message message) {
//     replyingTo.value = message;
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       textController.selection = TextSelection.fromPosition(
//         TextPosition(offset: textController.text.length),
//       );
//     });
//   }
//
//   void cancelReply() {
//     replyingTo.value = null;
//   }
//
//   void handleFavorite() {
//     // Add favorite logic
//     print('Favorite pressed');
//     Get.snackbar('Favorite', 'Added to favorites');
//   }
//
//   void handleBlock() {
//     // Add block logic
//     print('Block pressed');
//     Get.snackbar('Block', 'User blocked');
//   }
//
//   void handleReport() {
//     // Add report logic
//     print('Report pressed');
//     Get.snackbar('Report', 'User reported');
//   }
//
//   void handleAddVendor() {
//     // Add vendor logic
//     print('Add vendor pressed');
//     Get.snackbar('Add', 'Vendor added');
//   }
//
//   void handleBlockVendor() {
//     // Block vendor logic
//     print('Block vendor pressed');
//     Get.snackbar('Block', 'Vendor blocked');
//   }
// }
import 'dart:io';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:sizer/sizer.dart';
import '../../../../../app_widgets/custom_clear_chat_dialog.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../constants/aap_assets.dart';

class ChatController extends GetxController {
  final vendorsController = TextEditingController();
  final selectedTab = 'All'.obs;

  // Observable variables
  final messages = <types.Message>[].obs;
  final textController = TextEditingController();
  final menuKey = GlobalKey();

  // Reply functionality
  final Rx<types.Message?> replyingTo = Rx<types.Message?>(null);

  // Selected image for preview
  final Rx<File?> selectedImage = Rx<File?>(null);

  // Image picker instance
  final CustomImagePicker _imagePicker = CustomImagePicker();

  // User instances
  late final types.User user;
  late final types.User vendor;

  // Parameters from navigation
  String name = 'Noraiz Raja';
  String avatarUrl = AppAssets.homeProfileImage;
  bool isSaved = false;

  void handleClearChat(BuildContext context) {
    CustomClearChatDialog.show(
      context: context,
      title: 'Delete',
      subtitle:
      'Are you sure you want to clear the chat? This action cannot be reversed.',
      buttonText: 'Delete',
      icon: Icons.close,
      iconColor: AppTheme.redColor,
      buttonColor: AppTheme.redColor,
      buttonTextColor: AppTheme.whiteColor,
      onConfirm: () {
        messages.clear();
      },
    );
  }

  void updateSelectedTab(String tab) {
    selectedTab.value = tab;
  }

  @override
  void onClose() {
    vendorsController.dispose();
    textController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();

    // Get the passed parameters safely
    if (Get.arguments != null) {
      name = Get.arguments['name'] ?? 'Vendor Name';
      avatarUrl = Get.arguments['avatarUrl'] ?? '';
      isSaved = Get.arguments['isSaved'] ?? false;
    }

    // Initialize users
    user = const types.User(id: 'user-id-1', firstName: 'Jane');
    vendor = types.User(id: 'vendor-id-1', firstName: name);

    // Load initial messages
    _loadInitialMessages();
  }

  void _loadInitialMessages() {
    final message1 = types.TextMessage(
      author: vendor,
      createdAt: DateTime.now()
          .subtract(const Duration(hours: 2))
          .millisecondsSinceEpoch,
      id: 'msg-1',
      text: 'Hi! Are you available for event',
    );

    final message2 = types.TextMessage(
      author: user,
      createdAt: DateTime.now()
          .subtract(const Duration(hours: 1))
          .millisecondsSinceEpoch,
      id: 'msg-2',
      text: 'Hello! Yes, I\'m available on that date.',
    );

    final message3 = types.TextMessage(
      author: user,
      createdAt: DateTime.now()
          .subtract(const Duration(minutes: 30))
          .millisecondsSinceEpoch,
      id: 'msg-3',
      text: 'ok',
    );

    messages.addAll([message3, message2, message1]);
  }

  void handleSendPressed(types.PartialText message) {
    types.TextMessage textMessage;

    if (replyingTo.value != null) {
      textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message.text,
        repliedMessage: replyingTo.value,
      );
    } else {
      textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message.text,
      );
    }

    messages.insert(0, textMessage);

    if (replyingTo.value != null) {
      cancelReply();
    }
  }

  // Updated camera pressed handler with debug prints
  Future<void> handleCameraPressed(BuildContext context) async {
    print('🔵 Camera/Gallery button pressed');

    try {
      // Show bottom sheet to choose between camera and gallery
      final File? imageFile = await _showImageSourceBottomSheet(context);

      print('🔵 Returned image file: ${imageFile?.path ?? "null"}');

      if (imageFile != null) {
        // Set the selected image for preview
        selectedImage.value = imageFile;
        print('Image set to selectedImage: ${selectedImage.value?.path}');
        print('Selected image exists: ${selectedImage.value != null}');
      } else {
        print('No image was selected');
      }
    } catch (e) {
      print(' Error in handleCameraPressed: $e');
    }
  }

  // Show custom bottom sheet for image source selection
  Future<File?> _showImageSourceBottomSheet(BuildContext context) async {
    print(' Showing image source bottom sheet');

    return await showModalBottomSheet<File?>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: 100.w,
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.lightCyanColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.photo_library,
                      size: 24,
                      color: AppTheme.silverColor,
                    ),
                  ),
                  title: Text(
                    'Gallery',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  onTap: () async {
                    print(' Gallery selected');
                    Navigator.pop(context); // Close bottom sheet first

                    try {
                      final file = await _imagePicker.pickImageFromGallery();
                      print('Image picked from gallery: ${file?.path ?? "null"}');

                      if (file != null) {
                        // Return the file to handleCameraPressed
                        selectedImage.value = file;
                        print('Image directly set in gallery tap: ${file.path}');
                      }
                    } catch (e) {
                      print(' Error picking from gallery: $e');
                    }
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.lightCyanColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 24,
                      color: AppTheme.silverColor,
                    ),
                  ),
                  title: Text(
                    'Camera',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  onTap: () async {
                    print('Camera selected');
                    Navigator.pop(context); // Close bottom sheet first

                    try {
                      final file = await _imagePicker.pickImageFromCamera();
                      print('Image captured from camera: ${file?.path ?? "null"}');

                      if (file != null) {
                        // Return the file to handleCameraPressed
                        selectedImage.value = file;
                        print('Image directly set in camera tap: ${file.path}');
                      }
                    } catch (e) {
                      print(' Error picking from camera: $e');
                    }
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  // Clear selected image
  void clearSelectedImage() {
    print('Clearing selected image');
    selectedImage.value = null;
  }

  // Send message - handles both text and image
  void sendMessage() {
    print(' Send button pressed');
    print(' Selected image: ${selectedImage.value?.path ?? "null"}');
    print(' Text: ${textController.text}');

    // Check if there's an image to send
    if (selectedImage.value != null) {
      print(' Sending image message');
      _sendImageMessage(selectedImage.value!);
      return;
    }

    // Send text message if text is not empty
    if (textController.text.trim().isNotEmpty) {
      print('Sending text message');
      handleSendPressed(types.PartialText(text: textController.text));
      textController.clear();
    } else {
      print('Nothing to send');
    }
  }

  // Send image as a message
  void _sendImageMessage(File imageFile) {
    print('Creating image message');

    final imageMessage = types.ImageMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'image_${DateTime.now().millisecondsSinceEpoch}.jpg',
      size: imageFile.lengthSync(),
      uri: imageFile.path,
      repliedMessage: replyingTo.value,
    );

    messages.insert(0, imageMessage);
    print(' Image message added to chat');

    // Clear selected image
    clearSelectedImage();

    // Clear reply after sending
    if (replyingTo.value != null) {
      cancelReply();
    }
  }

  void handleMessageLongPress(BuildContext context, types.Message message) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.reply),
              title: const Text('Reply'),
              onTap: () {
                replyToMessage(message);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Copy'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void replyToMessage(types.Message message) {
    replyingTo.value = message;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
    });
  }

  void cancelReply() {
    replyingTo.value = null;
  }

  void handleSaveChat() {
    print('Save Chat pressed');
  }

  void handleAddVendor() {
    print('Add vendor pressed');
  }

  void handleBlockVendor() {
    print('Block vendor pressed');
  }
}