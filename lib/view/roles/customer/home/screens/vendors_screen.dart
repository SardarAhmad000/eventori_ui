import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_vendor_card.dart';

class VendorsScreen extends StatelessWidget {
  VendorsScreen({super.key});

  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8,right: 16, left: 16),
            child: Obx(
                  () => CustomCategoryTabBar(
                categories: controller.vendorCategories,
                //                categories: eventController.eventCategoryList,
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
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 110),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CustomVendorCard(
                    imagePaths : [
                      AppAssets.vendorDummyImage,
                      AppAssets.eventImage1,
                      AppAssets.featuredImage1,
                      AppAssets.vendor2Image,
                    ],
                    vendorName: 'Royal Events & Catering',
                    location: 'Jinnah Boulevard sector E DHA phase 3 islamabad',
                    isTopRated: true,
                    rating: 4.8,
                    isVerified: true,
                    isSponsored: true,
                    categories: ['WEDDING', 'EVENT', 'CATERING'],
                    onAddToEvent: () {},
                    onContact: () {},
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}