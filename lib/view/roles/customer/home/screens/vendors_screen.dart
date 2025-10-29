import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_vendor_card.dart';
import '../controller/vendor_controller.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VendorController controller = Get.find<VendorController>();

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Obx(
                  () => CustomCategoryTabBar(
                categories: controller.categories,
                initialIndex: controller.selectedCategoryIndex.value,
                onCategorySelected: (index) {
                  controller.selectCategory(index);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 98),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomVendorCard(
                  imagePath: AppAssets.vendorDummyImage,
                  vendorName: 'Royal Events & Catering',
                  location: 'Lahore, Pakistan',
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
        ],
      ),
    );
  }
}