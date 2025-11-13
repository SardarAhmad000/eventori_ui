import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_clear_chat_dialog.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../controller/chat_controller.dart';
import '../widgets/block_vendor_bottom_sheet.dart';
import '../widgets/report_vendor_bottom_sheet.dart';

class ChatDetailedScreen extends StatelessWidget {
  const ChatDetailedScreen({Key? key}) : super(key: key);


  String _formatTime(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                      ),
                      child: Image.asset(
                        AppAssets.arrowIcon,
                        color: AppTheme.darkpurpleColor,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    onTap: () => Get.back(),
                  ),
                  Text(
                    controller.name,
                    style: AppTextStyle.f14W600BColorTextStyle,
                  ),
                  CustomPopupMenu(
                    // horizontalOffset: -100,
                    menuKey: controller.menuKey,
                    options: [
                      PopupMenuOption(
                        title: 'Save Chat',
                        onTap: controller.handleSaveChat,
                      ),
                      PopupMenuOption(
                        title: 'Block',
                        onTap: () => BlockVendorBottomSheet.show(context),
                      ),
                      PopupMenuOption(
                        title: 'Report',
                        onTap: () => ReportVendorBottomSheet.show(context),
                      ),
                      PopupMenuOption(
                        title: 'Delete chat',
                        onTap: () => controller.handleClearChat(context),
                      ),
                    ],
                    child: Image.asset(
                      AppAssets.moreVerticalIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.silverColor,
                image: controller.avatarUrl.isNotEmpty
                    ? DecorationImage(
                  image: AssetImage(controller.avatarUrl),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              child: controller.avatarUrl.isEmpty
                  ? Icon(
                Icons.person,
                color: AppTheme.whiteColor,
                size: 24,
              )
                  : null,
            ),

            const SizedBox(height: 12),

            // Saved vendor status
            Text(
              controller.isSaved ? 'Saved vendor' : 'Not a saved vendor',
              style: AppTextStyle.f14W400SGColorTextStyle,
            ),

            const SizedBox(height: 16),

            // Add and Block buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      Text: "Add",
                      onTap: controller.handleAddVendor,
                      buttonColor: AppTheme.whiteColor,
                      textColor: AppTheme.silverColor,
                      height: 32,
                      borderColor: AppTheme.lightGrayishColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      Text: "Block",
                      onTap: controller.handleBlockVendor,
                      buttonColor: AppTheme.whiteColor,
                      textColor: AppTheme.redColor,
                      height: 32,
                      borderColor: AppTheme.redColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Text(
            //   'TODAY',
            //   style: AppTextStyle.f12W400BColorTextStyle,
            // ),

            // Chat Messages
            Expanded(
              child: Obx(() {
                final messagesList = controller.messages.toList();
                return Chat(
                  messages: messagesList,
                  onSendPressed: controller.handleSendPressed,
                  user: controller.user,
                  onMessageLongPress: controller.handleMessageLongPress,
                  bubbleBuilder: (child, {required message, required nextMessageInGroup}) {
                    return _buildCustomMessage(
                      message,
                      messageWidth: MediaQuery.of(context).size.width * 0.7 ~/ 1,
                      showName: !nextMessageInGroup,
                    );
                  },
                  theme: DefaultChatTheme(
                    backgroundColor: AppTheme.paperWhiteColor,
                    primaryColor: AppTheme.purpleColor,
                    secondaryColor: AppTheme.whiteColor,
                    receivedMessageBodyTextStyle: AppTextStyle.f12W400BColorTextStyle,
                    sentMessageBodyTextStyle: AppTextStyle.f12W500WColorTextStyle,
                    inputBackgroundColor: AppTheme.whiteColor,
                    inputTextColor: AppTheme.blackColor,
                    inputBorderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    messageBorderRadius: 10,
                  ),
                  showUserAvatars: true,
                  showUserNames: false, // We handle names in custom builder
                  dateHeaderBuilder: (_) => const SizedBox.shrink(), // Remove date headers
                  timeFormat: DateFormat(''), // Remove time between messages
                  useTopSafeAreaInset: false,
                  customBottomWidget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() {
                        if (controller.replyingTo.value != null) {
                          final replyMessage = controller.replyingTo.value!;
                          final isTextMessage = replyMessage is types.TextMessage;
                          final messageText = isTextMessage ? replyMessage.text : 'Message';
                          final authorName = replyMessage.author.firstName ?? 'User';
                          final isOwnMessage = replyMessage.author.id == controller.user.id;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.textfieldBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                // Colored bar on the left (like WhatsApp)
                                Container(
                                  width: 4,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: isOwnMessage ? AppTheme.purpleColor : AppTheme.slateGreyColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Message content
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          isOwnMessage ? 'You' : authorName,
                                          style: AppTextStyle.f12W500WColorTextStyle.copyWith(
                                            color: isOwnMessage ? AppTheme.purpleColor : AppTheme.slateGreyColor,
                                          )),
                                      const SizedBox(height: 4),
                                      Text(
                                        messageText,
                                        style: AppTextStyle.f14W400SGColorTextStyle,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Close button
                                GestureDetector(
                                  onTap: controller.cancelReply,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: AppTheme.silverColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }),

                      // Input Field
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.paperWhiteColor,
                        ),
                        child: Row(
                          children: [
                            // Camera Icon
                            GestureDetector(
                              onTap: controller.handleCameraPressed,
                              child: Image.asset(
                                width: 24,
                                height: 24,
                                AppAssets.cameraIcon,
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Text Input Field
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.whiteColor,
                                  borderRadius: BorderRadius.circular(33),
                                  border: Border.all(
                                    color: AppTheme.textfieldBorderColor,
                                    width: 1,
                                  ),
                                ),
                                child: TextField(
                                  controller: controller.textController,
                                  decoration: InputDecoration(
                                    hintText: 'Type',
                                    hintStyle: AppTextStyle.f14W400SColorTextStyle,
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  style: AppTextStyle.f14W400BColorTextStyle,
                                  maxLines: null,
                                  textCapitalization: TextCapitalization.sentences,
                                  onSubmitted: (_) => controller.sendMessage(),
                                ),
                              ),
                            ),

                            const SizedBox(width: 12),

                            // Send Button
                            GestureDetector(
                              onTap: controller.sendMessage,
                              child: Image.asset(
                                width: 24,
                                height: 24,
                                AppAssets.sendMessageIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyPreview(types.Message repliedMessage, ChatController controller) {
    final isTextMessage = repliedMessage is types.TextMessage;
    final messageText = isTextMessage ? repliedMessage.text : 'Message';
    final authorName = repliedMessage.author.firstName ?? 'User';
    final isOwnMessage = repliedMessage.author.id == controller.user.id;

    return Container(
      width: 100.w,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(
            color: isOwnMessage ? AppTheme.paperWhiteColor : AppTheme.paperWhiteColor,
            width: 3,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isOwnMessage ? 'You' : authorName,
            style: AppTextStyle.f12W500SGColorTextStyle.copyWith(color: isOwnMessage ? AppTheme.purpleColor : AppTheme.slateGreyColor),
          ),
          const SizedBox(height: 2),
          Text(
            messageText,
            style: AppTextStyle.f12W500SGColorTextStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildCustomMessage(types.Message message, {required int messageWidth, required bool showName}) {
    final controller = Get.find<ChatController>();
    final isTextMessage = message is types.TextMessage;
    if (!isTextMessage) return const SizedBox.shrink();

    final textMessage = message as types.TextMessage;
    final isOwnMessage = message.author.id == controller.user.id;
    final hasReply = textMessage.repliedMessage != null;
    final timeString = _formatTime(message.createdAt ?? DateTime.now().millisecondsSinceEpoch);

    return Container(
      constraints: BoxConstraints(maxWidth: messageWidth.toDouble()),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isOwnMessage ? AppTheme.purpleColor : AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Show author name if needed
          if (showName && !isOwnMessage) ...[
            Text(
              message.author.firstName ?? 'User',
              style: AppTextStyle.f12W500WColorTextStyle.copyWith(color: isOwnMessage ? AppTheme.whiteColor : AppTheme.blackColor),
            ),
            const SizedBox(height: 4),
          ],
          if (hasReply) ...[
            _buildReplyPreview(textMessage.repliedMessage!, controller),
          ],

          // Message text with time
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  textMessage.text,
                  style: isOwnMessage ? AppTextStyle.f12W500WColorTextStyle : AppTextStyle.f12W400BColorTextStyle,
                ),
              ),
              SizedBox(width: 8),
              // Spacer(),
              Text(
                  timeString,
                  style: AppTextStyle.f10W400BColorTextStyle.copyWith(color: isOwnMessage ? AppTheme.whiteColor : AppTheme.slateGreyColor,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}