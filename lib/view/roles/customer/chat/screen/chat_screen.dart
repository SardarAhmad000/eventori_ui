import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_clear_chat_dialog.dart';
import '../widgets/chat_item.dart';
import '../widgets/chat_tab_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final vendorsController = TextEditingController();
  String selectedTab = 'All';

  void _handleClearChat(int index) {
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
                      controller: vendorsController,
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
                  Container(
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
                            isSelected: selectedTab == 'All',
                            onTap: () {
                              setState(() {
                                selectedTab = 'All';
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: ChatTabBar(
                            title: 'Saved',
                            isSelected: selectedTab == 'Saved',
                            onTap: () {
                              setState(() {
                                selectedTab = 'Saved';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ChatItem(
                    avatarUrl: AppAssets.featuredImage1,
                    name: 'Noraiz Raja',
                    lastMessage: 'Ok Done!',
                    messageCount: 4,
                    onTap: () {
                      // Navigate to chat detail screen
                    },
                    menuOptions: [
                      PopupMenuOption(
                        title: 'Delete chat',
                        onTap: () => _handleClearChat(index),
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