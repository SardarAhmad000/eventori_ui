import 'package:eventori/app_widgets/custom_textfield.dart';
import 'package:eventori/view/roles/customer/home/screens/events_screen.dart';
import 'package:eventori/view/roles/customer/home/screens/forum_screen.dart';
import 'package:eventori/view/roles/customer/home/screens/home_screen.dart';
import 'package:eventori/view/roles/customer/home/screens/vendors_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../routes/app_routes.dart';
import '../widgets/custom_tab_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: AppTheme.stormyIndigoColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              border: Border.all(
                color: AppTheme.stormyIndigoColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      AppAssets.appLogo,
                      width: 38,
                      height: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.profileScreen);
                              },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.denimBlueColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.slateGreyColor,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CustomImageHandler(
                                  imagePath: AppAssets.picImage,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Hi Noraiz',
                                  style: AppTextStyle.f12W400LGColorTextStyle),
                              const SizedBox(height: 2),
                              Text('Welcome Back!',
                                  style: AppTextStyle.f16W400WColorTextStyle),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.bellIcon,
                              width: 18, height: 18),
                          const SizedBox(width: 12),
                          Image.asset(AppAssets.heartIcon,
                              width: 18, height: 18),
                          const SizedBox(width: 12),
                          Image.asset(AppAssets.settingsIcon,
                              width: 18, height: 18),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AbsorbPointer(
                    absorbing: true,
                    child: CustomTextField(
                      borderRadius: 99,
                      hintText: "Search",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Image.asset(
                          AppAssets.searchIcon,
                          color: AppTheme.slateGreyColor,
                          width: 45,
                          height: 45,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppTheme.paperWhiteColor,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            AppAssets.filterIcon,
                            width: 16,
                            height: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          CustomTabBar(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),

          Expanded(
            child: buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget buildTabContent() {
    switch (_selectedTabIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return VendorsScreen();
      case 2:
        return EventsScreen();
      case 3:
        return ForumScreen();
      default:
        return HomeScreen();
    }
  }
}