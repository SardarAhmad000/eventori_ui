import 'package:eventori/app_widgets/custom_bottom_sheet.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'dart:io';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../controller/chat_controller.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                    menuKey: controller.menuKey,
                    options: [
                      PopupMenuOption(
                        title: 'Save Chat',
                        onTap: controller.handleSaveChat,
                      ),
                      PopupMenuOption(
                        title: 'Block',
                        onTap: () => CustomBottomSheet.show(
                          context: context,
                          title: 'Block this vendor?',
                          descriptionTexts: [
                            'This person won\'t be able to message or call you. They won\'t know you blocked or reported them.',
                            'If you block and report, the last 5 messages in this chat will also be sent to WhatsApp.***',
                          ],
                          primaryActionText: 'Yes, Block Vendor',
                          primaryActionIcon: AppAssets.reportIcon,
                          onPrimaryAction: () {
                            print('Vendor blocked');},
                          secondaryActionText: 'Cancel',
                          secondaryActionIcon: AppAssets.blockIcon,
                        ),
                      ),
                      PopupMenuOption(
                        title: 'Report',
                        onTap: () => CustomBottomSheet.show(
                          context: context,
                          title: 'Block and Report this Vendor?',
                          descriptionTexts: [
                            'Are you sure you want to block this vendor? You’ll no longer receive messages or quotes from them.  ',
                            'Your report will help us review any suspicious or inappropriate behaviour.',
                          ],
                          primaryActionText: 'Yes, Block and Report ',
                          primaryActionIcon: AppAssets.blockIcon,
                          onPrimaryAction: () {
                            print('Vendor blocked');
                            },
                          secondaryActionText: 'Cancel',
                          secondaryActionIcon: AppAssets.reportIcon,
                        ),
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
            Text(
              controller.isSaved ? 'Saved vendor' : 'Not a saved vendor',
              style: AppTextStyle.f14W400SGColorTextStyle,
            ),
            const SizedBox(height: 16),
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
            Expanded(
              child: Obx(() {
                final messagesList = controller.messages.toList();
                return Chat(
                  messages: messagesList,
                  onSendPressed: controller.handleSendPressed,
                    user: controller.user,
                  onMessageLongPress: controller.handleMessageLongPress,
                  bubbleBuilder: (child,
                      {required message, required nextMessageInGroup}) {
                    return _buildCustomMessage(
                      message,
                      messageWidth:
                      MediaQuery.of(context).size.width * 0.7 ~/ 1,
                      showName: !nextMessageInGroup,
                    );
                    },
                  theme: DefaultChatTheme(
                    backgroundColor: AppTheme.paperWhiteColor,
                    primaryColor: AppTheme.purpleColor,
                    secondaryColor: AppTheme.whiteColor,
                    receivedMessageBodyTextStyle:
                    AppTextStyle.f12W400BColorTextStyle,
                    sentMessageBodyTextStyle:
                    AppTextStyle.f12W500WColorTextStyle,
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
                  showUserNames: false,
                  dateHeaderBuilder: (_) => const SizedBox.shrink(),
                  timeFormat: DateFormat(''),
                  useTopSafeAreaInset: false,
                  // Use empty custom bottom widget since we're handling it outside
                  customBottomWidget: const SizedBox.shrink(),
                );
              }),
            ),
            // Reply Preview (Outside of Chat widget)
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
                    border: Border.all(color: AppTheme.textfieldBorderColor, width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 4,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isOwnMessage ? AppTheme.purpleColor
                        : AppTheme.slateGreyColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(
                          width: 12
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isOwnMessage ? 'You' : authorName,
                              style: AppTextStyle.f12W500WColorTextStyle.copyWith(color: isOwnMessage
                                  ? AppTheme.purpleColor
                                  : AppTheme.slateGreyColor,
                              ),
                            ),
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
                      GestureDetector(
                        onTap: controller.cancelReply,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.close, size: 20,
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
            // Image Preview Container (Outside of Chat widget)
            Obx(() {
              if (controller.selectedImage.value != null) {
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
                      // Image Preview
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          controller.selectedImage.value!,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Image name/info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Selected Image',
                              style: AppTextStyle.f14W600BColorTextStyle,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${(controller.selectedImage.value!.lengthSync() / 1024).toStringAsFixed(2)} KB',
                              style: AppTextStyle.f12W400SGColorTextStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Remove button
                      GestureDetector(
                        onTap: controller.clearSelectedImage,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppTheme.redColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: AppTheme.redColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            // Input Field (Outside of Chat widget)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.paperWhiteColor,
              ),
              child: Row(
                children: [
                  // Camera Icon
                  GestureDetector(
                    onTap: () => controller.handleCameraPressed(context),
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
      ),
    );
  }
  Widget _buildReplyPreview(
      types.Message repliedMessage, ChatController controller) {
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
            color: isOwnMessage
                ? AppTheme.paperWhiteColor
                : AppTheme.paperWhiteColor,
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
            style: AppTextStyle.f12W500SGColorTextStyle.copyWith(
                color: isOwnMessage
                    ? AppTheme.purpleColor
                    : AppTheme.slateGreyColor),
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
  Widget _buildCustomMessage(types.Message message,
      {required int messageWidth, required bool showName}) {
    final controller = Get.find<ChatController>();
    final isTextMessage = message is types.TextMessage;
    if (!isTextMessage) return const SizedBox.shrink();
    final textMessage = message as types.TextMessage;
    final isOwnMessage = message.author.id == controller.user.id;
    final hasReply = textMessage.repliedMessage != null;
    final timeString = _formatTime(
        message.createdAt ?? DateTime.now().millisecondsSinceEpoch);
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
          if (showName && !isOwnMessage) ...[
            Text(
              message.author.firstName ?? 'User',
              style: AppTextStyle.f12W500WColorTextStyle.copyWith(
                  color: isOwnMessage
                      ? AppTheme.whiteColor
                      : AppTheme.blackColor),
            ),
            const SizedBox(height: 4),
          ],
          if (hasReply) ...[
            _buildReplyPreview(textMessage.repliedMessage!, controller),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  textMessage.text,
                  style: isOwnMessage
                      ? AppTextStyle.f12W500WColorTextStyle
                      : AppTextStyle.f12W400BColorTextStyle,
                ),
              ),
              SizedBox(width: 8),
              Text(timeString,
                  style: AppTextStyle.f10W400BColorTextStyle.copyWith(
                    color: isOwnMessage
                        ? AppTheme.whiteColor
                        : AppTheme.slateGreyColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}