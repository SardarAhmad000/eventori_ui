import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../routes/app_routes.dart';
import '../../home/controller/home_controller.dart';
import '../../home/widgets/custom_category_tab_bar.dart';
import '../../home/widgets/custom_vendor_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            AbsorbPointer(
              absorbing: true,
              child: CustomTextField(
                borderRadius: 99,
                hintText: 'Search Vendors',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Image.asset(
                    AppAssets.searchIcon,
                    color: AppTheme.slateGreyColor,
                    width: 45,
                    height: 45,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {},
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: Obx(
                    () => CustomCategoryTabBar(
                  categories: controller.vendorCategories,
                  initialIndex: controller.selectedCategoryIndex.value,
                  onCategorySelected: (index) {
                    controller.selectVendorCategory(index);
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 90),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final vendorData = {
                      'imagePaths': [
                        AppAssets.vendorDummyImage,
                        AppAssets.eventImage1,
                        AppAssets.featuredImage1,
                        AppAssets.vendor2Image,
                      ],
                      'vendorName': 'Royal Events & Catering',
                      // 'vendorName': index == 0
                      //     ? 'Royal Events & Catering'
                      //     : 'Elegant Moments Photography',
                      'location': 'Lahore, Pakistan',
                      'isTopRated': true,
                      'rating': 4.8,
                      'isVerified': true,
                      'isSponsored': true,
                      'categories': const ['WEDDING', 'EVENT', 'CATERING'],
                    };
                    return CustomVendorCard(
                      imagePaths: vendorData['imagePaths'] as List<String>,
                      vendorName: vendorData['vendorName'] as String,
                      location: vendorData['location'] as String,
                      isTopRated: vendorData['isTopRated'] as bool,
                      rating: vendorData['rating'] as double,
                      isVerified: vendorData['isVerified'] as bool,
                      isSponsored: vendorData['isSponsored'] as bool,
                      categories: vendorData['categories'] as List<String>,
                      onAddToEvent: () {},
                      onContact: () {},
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.vendorDetailedScreen,
                          arguments: {
                            'imagePaths': vendorData['imagePaths'],
                            'vendorName': vendorData['vendorName'],
                            'location': vendorData['location'],
                            'isTopRated': vendorData['isTopRated'],
                            'rating': vendorData['rating'],
                            'isVerified': vendorData['isVerified'],
                            'categories': vendorData['categories'],
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}