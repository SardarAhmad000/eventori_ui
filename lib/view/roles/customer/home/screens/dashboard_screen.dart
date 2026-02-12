import 'dart:async';
import 'package:eventori/app_widgets/custom_textfield.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
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
import '../../home/controller/home_controller.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/filter_bottom_sheet.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTabIndex = 0;
  AuthController authController = Get.find();
  HomeController homeController = Get.find();

  final TextEditingController searchController = TextEditingController();
  Timer? _searchDebouncer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      authController.getUserData();
    });
  }

  @override
  void dispose() {
    _searchDebouncer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  // Get hint text based on selected tab
  String getHintText() {
    switch (_selectedTabIndex) {
      case 0:
        return "Search";
      case 1:
        return "Search Vendor";
      case 2:
        return "Search Event";
      case 3:
        return "Search Forum";
      default:
        return "Search";
    }
  }

  // Check if suffix icon should be shown
  bool shouldShowSuffixIcon() {
    return _selectedTabIndex == 1; // Only show for VendorsScreen
  }

  // Handle search based on selected tab
  void handleSearch(String value) {
    _searchDebouncer?.cancel();

    _searchDebouncer = Timer(const Duration(milliseconds: 500), () {
      switch (_selectedTabIndex) {
        case 1: // VendorsScreen
          homeController.getAllVendors(searchQuery: value);
          break;
        case 0: // HomeScreen
        // Add home search logic if needed
          break;
        case 2: // EventsScreen
        // Add events search logic if needed
          break;
        case 3: // ForumScreen
        // Add forum search logic if needed
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
                () => Container(
              width: 100.w,
              height: 218,
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
                              onTap: () {
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
                                    imagePath: authController.userData.value!.image,
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
                                Row(
                                  children: [
                                    Text('Hi', style: AppTextStyle.f12W400LGColorTextStyle),
                                    SizedBox(width: 4),
                                    Text(authController.userData.value!.firstName ?? '',
                                        style: AppTextStyle.f12W400LGColorTextStyle),
                                  ],
                                ),
                                const SizedBox(height: 2),
                                Text('Welcome Back!', style: AppTextStyle.f16W400WColorTextStyle),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppAssets.bellIcon, width: 18, height: 18),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.faviourteVendorsScreen);
                              },
                              child: Image.asset(AppAssets.heartIcon, width: 18, height: 18),
                            ),
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.profileScreen);
                              },
                              child: Image.asset(AppAssets.settingsIcon, width: 18, height: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: searchController,
                      borderRadius: 99,
                      hintText: getHintText(),
                      onChanged: (value) {
                        handleSearch(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Image.asset(
                          AppAssets.searchIcon,
                          color: AppTheme.slateGreyColor,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      suffixIcon: shouldShowSuffixIcon()
                          ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Clear button
                          ValueListenableBuilder(
                            valueListenable: searchController,
                            builder: (context, value, child) {
                              if (value.text.isEmpty) return const SizedBox.shrink();

                              return GestureDetector(
                                onTap: () {
                                  searchController.clear();
                                  homeController.getAllVendors(searchQuery: '');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(
                                    Icons.clear,
                                    size: 20,
                                    color: AppTheme.slateGreyColor,
                                  ),
                                ),
                              );
                            },
                          ),
                          // Filter button
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => DraggableScrollableSheet(
                                  initialChildSize: 0.9,
                                  minChildSize: 0.5,
                                  maxChildSize: 0.95,
                                  builder: (_, controller) => FilterBottomSheet(),
                                ),
                              ).then((filters) {
                                if (filters != null) {
                                  print('Country: ${filters['country']}');
                                  print('City: ${filters['city']}');
                                  print('Notice: ${filters['notice']}');
                                  print('Rating: ${filters['rating']}');
                                  print('Travel Availability: ${filters['travelAvailability']}');
                                  print('Catering: ${filters['catering']}');
                                  print('DJ: ${filters['dj']}');
                                  print('Photography: ${filters['photography']}');
                                  print('Floral: ${filters['floral']}');
                                  print('Verified ID: ${filters['verifiedId']}');
                                }
                              });
                            },
                            child: Padding(
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
                        ],
                      )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomTabBar(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
                searchController.clear(); // Clear search when switching tabs
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