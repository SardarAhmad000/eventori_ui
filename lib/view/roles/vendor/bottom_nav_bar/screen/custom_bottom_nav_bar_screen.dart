import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../home/home_vendor_screen.dart';
import '../controller/bottom_nav_controller.dart';
import '../widgets/custom_nav_item.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNavController bottomNavController = Get.find();

  final List<Widget> pages = const [
    HomeVendorScreen(),
    Center(child: Text('Inquires Screen')),
    Center(child: Text('Booking Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) return;
        if (bottomNavController.selectedIndex.value == 0) {
          // Exit dialog or action here
          // SystemNavigator.pop();
        } else {
          bottomNavController.changeIndex(0);
        }
      },
      child: Scaffold(
        body: Obx(
                () => pages[bottomNavController.selectedIndex.value]),
        bottomNavigationBar: Container(
          height: 10.h,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
          ),
          child: Obx(() => Row(
            children: [
              CustomNavItem(
                iconPath: AppAssets.gridIcon,
                title: 'Dashboard',
                isSelected: bottomNavController.selectedIndex.value == 0,
                onTap: () => bottomNavController.changeIndex(0),
              ),
              CustomNavItem(
                iconPath: AppAssets.messageChatIcon,
                title: 'Inquires',
                isSelected: bottomNavController.selectedIndex.value == 1,
                onTap: () => bottomNavController.changeIndex(1),
              ),
              CustomNavItem(
                iconPath: AppAssets.arrowIcon,
                title: 'Booking',
                isSelected: bottomNavController.selectedIndex.value == 2,
                onTap: () => bottomNavController.changeIndex(2),
              ),
              CustomNavItem(
                iconPath: AppAssets.userIcon,
                title: 'Profile',
                isSelected: bottomNavController.selectedIndex.value == 3,
                onTap: () => bottomNavController.changeIndex(3),
              ),
            ],
          )),
        ),
      ),
    );
  }
}