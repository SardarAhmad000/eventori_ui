import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../widgets/chat_tab_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String selectedTab = 'All';
  int? selectedChatIndex;

  final List<ChatItem> chats = [
    ChatItem(
      name: 'Noraiz Raja',
      message: 'Ok Done!',
      avatar: 'assets/avatar1.jpg',
      isOnline: true,
    ),
    ChatItem(
      name: 'The Sweet Platter',
      message: 'Yesterday 8:32 PM',
      avatar: 'assets/avatar2.jpg',
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                  Image.asset(
                    AppAssets.moreHorizIcon,
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    AppAssets.addIcon,
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      // borderRadius: 99,
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

                  const SizedBox(height: 16),

                  Container(
                    height: 40,

                    decoration: BoxDecoration(
                      color: AppTheme.paperWhiteColor,
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
                        // const SizedBox(width: 80),
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

            const SizedBox(height: 8),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return _buildChatItem(chats[index], index);
                },
              ),
            ),


          ],
        ),
      ),
    );
  }




  Widget _buildChatItem(ChatItem chat, int index) {
    final isSelected = selectedChatIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChatIndex = isSelected ? null : index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  // Avatar
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color(0xFFE5E5EA),
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[600],
                          size: 28,
                        ),
                      ),
                      if (chat.isOnline)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 14,
                            height: 14,
                            decoration: BoxDecoration(
                              color: const Color(0xFF34C759),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Name and Message
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          chat.message,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More Icon
                  IconButton(
                    icon: const Icon(Icons.more_vert, size: 20),
                    onPressed: () {
                      setState(() {
                        selectedChatIndex = index;
                      });
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),

            // Context Menu
            if (isSelected)
              Positioned(
                right: 50,
                top: 10,
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildMenuItem('Delete chat', Colors.red),
                      _buildMenuItem('Save', Colors.black),
                      _buildMenuItem('Block', Colors.black),
                      _buildMenuItem('Report', Colors.black),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedChatIndex = null;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: color,
          ),
        ),
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String avatar;
  final bool isOnline;

  ChatItem({
    required this.name,
    required this.message,
    required this.avatar,
    required this.isOnline,
  });
}