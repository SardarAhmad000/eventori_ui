import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/view/roles/customer/home/screens/dashboard_screen.dart';
import 'package:eventori/view/roles/customer/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppTheme/app_theme.dart';
import '../../roles/customer/Dashboard/screen/customer_dashboard_screen.dart';
import '../../roles/customer/chat/screen/chat_screen.dart';
import '../../roles/customer/event/screen/create_event_screen.dart';
import '../controller/nav_bar_controller.dart';


class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final NavBarController controller = Get.put(NavBarController());

    final List<Widget> screens = [
      const DashboardScreen(),
      SearchScreen(),
      CreateEventScreen(),
      const ChatScreen(),
      const EventDashboardScreen(),
    ];

    return Scaffold(
      body: Obx(() {
        // Show action bar view (CreateEventScreen) when action button is active
        if (controller.isActionButtonActive.value) {
          return screens[2];
        }

        // Show screens based on current index
        switch (controller.currentIndex.value) {
          case 0:
            return screens[0]; // DashboardScreen
          case 1:
            return screens[1]; // SearchScreen
          case 2:
            return screens[3]; // ChatScreen
          case 3:
            return screens[4]; // EventDashboardScreen
          default:
            return screens[0];
        }
      }),
      extendBody: true,
      bottomNavigationBar: Obx(() => _buildBottomNavBar(controller, screens)),
    );
  }

  Widget _buildBottomNavBar(NavBarController controller, List<Widget> screens) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
        onTab: (value) {
          controller.onTapActionButton();
        },
        activeIcon: _buildActionButton(isActive: controller.isActionButtonActive.value),
        inActiveIcon: _buildActionButton(isActive: false),
      ),
      activeColor: AppTheme.purplishColor,
      inActiveColor: AppTheme.blackColor,
      navBarBackgroundColor: AppTheme.whiteColor,
      appBarItems: [
        _buildNavBarItem(
          assetIcon: AppAssets.homeSmileIcon,
          label: 'Home',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
          onTap: () => controller.onBottomBarTap(0),
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.searchIcon,
          label: 'Search',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
          onTap: () => controller.onBottomBarTap(1),
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.messageChatIcon,
          label: 'Chat',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
          onTap: () => controller.onBottomBarTap(2),
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.gridIcon,
          label: 'Dashboard',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
          onTap: () => controller.onBottomBarTap(3),
        ),
      ],
      bodyItems: [
        screens[0],
        screens[1],
        screens[3],
        screens[4],
      ],
      actionBarView: screens[2],
    );
  }

  Widget _buildActionButton({required bool isActive}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.whiteColor : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppTheme.purplishColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppTheme.whiteColor,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.blackColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Icons.add,
          size: 24,
          color: AppTheme.whiteColor,
        ),
      ),
    );
  }

  FABBottomAppBarItem _buildNavBarItem({
    required String assetIcon,
    required String label,
    required Color activeColor,
    required Color inActiveColor,
    VoidCallback? onTap,
  }) {
    return FABBottomAppBarItem(
      activeIcon: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          assetIcon,
          width: 16,
          height: 18,
          color: activeColor,
          fit: BoxFit.contain,
        ),
      ),
      inActiveIcon: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          assetIcon,
          width: 16,
          height: 18,
          color: inActiveColor,
          fit: BoxFit.contain,
        ),
      ),
      text: label,
    );
  }
}