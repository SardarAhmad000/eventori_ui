import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_vendor_card.dart';

class VendorsScreen extends StatefulWidget {
  VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  HomeController homeController = Get.find();
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getVendorCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8,right: 16, left: 16),
            child:
            // Obx(
            // () =>
            SizedBox(
              height: 32,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeController.eventCategoryList.length,
                itemBuilder: (context, index) {
                  final isSelected = _selectedIndex == index;
                  var eventCategory=homeController.eventCategoryList[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        homeController.selectVendorCategory(index);
                      },
                      child: Container(
                        width: 30.w,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.steelBlueColor
                              : AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.steelBlueColor
                                : AppTheme.textfieldBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            eventCategory.categoryName,
                            style: AppTextStyle.f10W400BColorTextStyle.copyWith(
                              color: isSelected
                                  ? AppTheme.whiteColor
                                  : AppTheme.charcoalBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // ),
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