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

import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../../app_widgets/custom_button.dart';
import '../../../../../constants/aap_assets.dart';

class ChatDetailedController extends GetxController {

  final vendorsController = TextEditingController();
  final selectedTab = 'All'.obs;

  // Observable variables
  final messages = <types.Message>[].obs;
  final textController = TextEditingController();
  final menuKey = GlobalKey();

  // Reply functionality
  final Rx<types.Message?> replyingTo = Rx<types.Message?>(null);

  // User instances
  late final types.User user;
  late final types.User vendor;

  // Parameters from navigation
  String name = 'Noraiz Raja';
  String avatarUrl = AppAssets.featuredImage1;
  bool isSaved = false;

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
    // Add initial messages matching the screenshot - NO STATUS to remove tick
    final message1 = types.TextMessage(
      author: vendor,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)).millisecondsSinceEpoch,
      id: 'msg-1',
      text: 'Hi! Are you available for event',
    );

    final message2 = types.TextMessage(
      author: user,
      createdAt: DateTime.now().subtract(const Duration(hours: 1)).millisecondsSinceEpoch,
      id: 'msg-2',
      text: 'Hello! Yes, I\'m available on that date. ✓',
    );

    final message3 = types.TextMessage(
      author: user,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)).millisecondsSinceEpoch,
      id: 'msg-3',
      text: 'ok',
    );

    messages.addAll([message3, message2, message1]);
  }

  void handleSendPressed(types.PartialText message) {
    // Create the new message with reply if exists
    types.TextMessage textMessage;

    if (replyingTo.value != null) {
      // Create message with reply
      textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message.text,
        repliedMessage: replyingTo.value, // This is the key for showing replies
      );
    } else {
      // Regular message without reply
      textMessage = types.TextMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: message.text,
      );
    }

    messages.insert(0, textMessage);

    // Clear reply after sending
    if (replyingTo.value != null) {
      cancelReply();
    }
  }

  void handleCameraPressed() {
    print('Camera icon pressed');
    // Add your camera logic here
  }

  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      handleSendPressed(types.PartialText(text: textController.text));
      textController.clear();
    }
  }

  // Reply functionality methods
  void handleMessageLongPress(BuildContext context, types.Message message) {
    // Show bottom sheet with reply option
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
                // Add copy functionality if needed
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
    // Focus on text field after selecting reply
    WidgetsBinding.instance.addPostFrameCallback((_) {
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
    });
  }

  void cancelReply() {
    replyingTo.value = null;
  }

  void handleFavorite() {
    print('Favorite pressed');
  }

  void handleBlock() {
    print('Block pressed');

    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Block this vendor?',
                    style: AppTextStyle.f16W500BColorTextStyle
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.dividerColor,
                    ),

                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.closeIcon,
                          color: AppTheme.blackColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
             Container(
               width: double.infinity,
               height: 124,
               decoration: BoxDecoration(
                 color: AppTheme.dividerColor,
               ),

               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     Text(
                         'This person won\'t be able to message or call you. They won\'t know you blocked or reported them',
                         style: AppTextStyle.font14W400SGColorTextStyle
                     ),
                     const SizedBox(height: 8),
                     Text(
                         'If you block and report, the last 5 messages in this chat will also be sent to WhatsApp.***',
                         style: AppTextStyle.font14W400SGColorTextStyle
                     ),
                   ],
                 ),
               ),
             ),
              const SizedBox(height: 16 ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.blueColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Block and report',
                        style: AppTextStyle.f14W40RColorTextStyle
                      ),
                      const Spacer(),
                      Icon(
                        Icons.block,
                        color: Colors.red.withOpacity(0.7),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  print('Block pressed');
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                      color: AppTheme.blackColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),                  ),
                  child: Row(
                    children: [
                      Text(
                        'Block',
                          style: AppTextStyle.f14W40RColorTextStyle
                      ),
                      const Spacer(),
                      Icon(
                        Icons.block,
                        color: Colors.red.withOpacity(0.7),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  void handleReport() {
    print('Report pressed');
  }






  void handleAddVendor() {
    print('Add vendor pressed');
  }

  void handleBlockVendor() {
    print('Block vendor pressed');
  }
}