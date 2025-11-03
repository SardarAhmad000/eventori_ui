import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/roles/customer/chat/screen/chat_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_clear_chat_dialog.dart';
import '../controller/chat_detailed_controller.dart';
import '../widgets/chat_item.dart';
import '../widgets/chat_tab_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  void _handleClearChat(int index, BuildContext context) {
    CustomClearChatDialog.show(
      context: context,
      title: 'Clear Chat',
      subtitle: 'Are you sure you want to clear the chat? This action cannot be reversed.',
      buttonText: 'Yes, Clear',
      icon: Icons.close,
      iconColor: AppTheme.redColor,
      buttonColor: AppTheme.redColor,
      buttonTextColor: AppTheme.whiteColor,
      onConfirm: () {

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatDetailedController>();
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chats',
                        style: AppTextStyle.font18W700BColorTextStyle,
                      ),
                      Image.asset(
                        AppAssets.filterFunnelIcon,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AbsorbPointer(
                    absorbing: true,
                    child: CustomTextField(
                      controller: controller.vendorsController,
                      hintText: "Search Vendors",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.asset(
                          AppAssets.searchIcon,
                          color: AppTheme.slateGreyColor,
                          width: 45,
                          height: 45,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Obx(() => Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ChatTabBar(
                            title: 'All',
                            isSelected: controller.selectedTab.value == 'All',
                            onTap: () {
                              controller.updateSelectedTab('All');
                            },
                          ),
                        ),
                        Expanded(
                          child: ChatTabBar(
                            title: 'Saved',
                            isSelected: controller.selectedTab.value == 'Saved',
                            onTap: () {
                              controller.updateSelectedTab('Saved');
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ChatItem(
                    avatarUrl: AppAssets.featuredImage1,
                    name: 'Noraiz Raja',
                    lastMessage: 'Ok Done!',
                    messageCount: 3,
                    onTap: () {
                      Get.to(
                            () => const ChatDetailedScreen(),
                        arguments: {
                          'name': 'Noraiz Raja',
                          'avatarUrl':  AppAssets.featuredImage1,
                          'isSaved': true,
                        },
                      );
                      // Get.to(
                      //       () => const TeamChatScreen(),
                      //   arguments: {
                      //     'name': 'Noraiz Raja',
                      //     'avatarUrl': AppAssets.featuredImage1,
                      //     'isSaved': false,
                      //   },
                      // );
                    },
                    menuOptions: [
                      PopupMenuOption(
                        title: 'Delete chat',
                        onTap: () => _handleClearChat(index, context),
                      ),
                      PopupMenuOption(
                        title: 'Mute Notification',
                        onTap: () {},
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}