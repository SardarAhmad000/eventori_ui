import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_bottom_sheet.dart';
import 'package:eventori/routes/app_pages.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../../../../../constants/aap_assets.dart';
import '../../home/widgets/custom_category_tab_bar.dart';
import '../widgets/vendor_detail_card.dart';

class VendorDetailedScreen extends StatelessWidget {
  const VendorDetailedScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> args = Get.arguments ?? {};
    final GlobalKey menuKey = GlobalKey();
    var selectedCategoryIndex = 0;
    final List<String> vendorDetailedCategories = [
      'ABOUT',
      'PORTFOLIO',
      'REVIEWS',
      'REWARDS',
      'PAST EVENTS',
    ];
    void selectVendorCategory(int index) {
      selectedCategoryIndex = 0;
      print('Selected category: ${vendorDetailedCategories[index]}');
    }
    final List<String> imagePaths = args['imagePaths'] ?? [
      AppAssets.vendorDummyImage,
      AppAssets.eventImage1,
      AppAssets.featuredImage1,
    ];

    final String vendorName = args['vendorName'] ?? 'Elegant Moments Photography';
    final double rating = args['rating'] ?? 4.8;
    final bool isTopRated = args['isTopRated'] ?? true;
    final bool isVerified = args['isVerified'] ?? true;
    final String location = args['location'] ?? 'Lahore, Pakistan';
    final List<String> categories = args['categories'] ?? ['WEDDING', 'EVENT'];

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.silverColor.withOpacity(.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          width: 24,
                          height: 24,
                          AppAssets.arrowIcon,
                          color: AppTheme.blackColor,
                        ),
                      ),
                    ),
                  ),
                  CustomPopupMenu(
                    menuKey: menuKey,
                    options: [
                      PopupMenuOption(
                        title: 'Block',
                        onTap: () => CustomBottomSheet.show(
                          context: context,
                          title: 'Block this vendor?',
                          descriptionTexts: [
                            'Are you sure you want to block this vendor? You’ll no longer receive messages or quotes from them.',
                            'They won’t know you blocked or reported them.',
                          ],
                          primaryActionText: 'Yes, Block Vendor',
                          primaryActionIcon: AppAssets.reportIcon,
                          onPrimaryAction: () {
                            print('Vendor blocked');
                          },
                          secondaryActionText: 'Cancel',
                          secondaryActionIcon: AppAssets.blockIcon,
                        ),
                      ),
                      PopupMenuOption(
                        title: 'Report',
                        onTap: () => CustomBottomSheet.show(
                          context: context,
                          title: 'Report Vendor to Eventori',
                          descriptionTexts: [
                            'Are you sure you want to block and report this vendor? You’ll no longer receive messages or quotes from them.',
                            'Your report will help us review any suspicious or inappropriate behaviour.',
                          ],
                          primaryActionText: 'Yes, Block and Report ',
                          primaryActionIcon: AppAssets.reportIcon,
                          onPrimaryAction: () {
                            Navigator.pop(context); // Close bottom sheet using Navigator
                            Future.delayed(Duration(milliseconds: 100), () {
                              Get.toNamed(AppRoutes.reportVendorScreen);
                            });
                            print('Report Vendor');
                          },
                          secondaryActionText: 'Cancel',
                          secondaryActionIcon: AppAssets.blockIcon,
                        ),
                      ),
                    ],
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.silverColor.withOpacity(.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          AppAssets.layoutIcon,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VendorDetailCard(
                      imagePaths: imagePaths,
                      profileImage: imagePaths.isNotEmpty
                          ? imagePaths.first
                          : AppAssets.uploadImageIcon,
                      vendorName: vendorName,
                      isTopRated: isTopRated,
                      rating: rating,
                      isVerified: isVerified,
                      isFastResponder: true,
                      isEstablished: true,
                      isRisingStar: true,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      child: CustomCategoryTabBar(
                        categories: vendorDetailedCategories,
                        initialIndex: selectedCategoryIndex,
                        onCategorySelected: (index) {
                          selectVendorCategory(index);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}