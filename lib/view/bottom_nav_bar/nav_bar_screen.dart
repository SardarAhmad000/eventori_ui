import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/view/roles/customer/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../../AppTheme/widgets/app_theme.dart';
import '../roles/customer/event/create_event_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    // const HomePage(),
    const Center(child: Text('Search Screen', style: TextStyle(fontSize: 18))),
    const CreateEventScreen(),
    const Center(child: Text('Chat Screen', style: TextStyle(fontSize: 18))),
    const Center(child: Text('Dashboard Screen', style: TextStyle(fontSize: 18))),
  ];

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
  }) {
    return FABBottomAppBarItem(
      activeIcon: Image.asset(
        assetIcon,
        width: 16,
        height: 18,
        color: activeColor,
        fit: BoxFit.contain,
      ),
      inActiveIcon: Image.asset(
        assetIcon,
        width: 16,
        height: 18,
        color: inActiveColor,
        fit: BoxFit.contain,
      ),
      text: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
        onTab: (value) {},
        activeIcon: _buildActionButton(isActive: true),
        inActiveIcon: _buildActionButton(isActive: false),
        // text: "Create",
      ),

      activeColor: AppTheme.purplishColor,
      inActiveColor: AppTheme.blackColor,
      navBarBackgroundColor: AppTheme.whiteColor,

      // Provide items and body widgets (lengths must match)
      appBarItems: [
        _buildNavBarItem(
          assetIcon: AppAssets.homeSmileIcon,
          label: 'Home',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.searchIcon,
          label: 'Search',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.messageChatIcon,
          label: 'Chat',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
        ),
        _buildNavBarItem(
          assetIcon: AppAssets.gridIcon,
          label: 'Dashboard',
          activeColor: AppTheme.purplishColor,
          inActiveColor: AppTheme.blackColor,
        ),
      ],

      bodyItems: [
        _screens[0],
        _screens[1],
        _screens[3],
        _screens[4],
      ],

      actionBarView: _screens[2],

      extendBody: true,
    );
  }
}
