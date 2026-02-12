import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_text_placeholder.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../services/contact_service.dart';
import '../../../../onboarding/widgets/build_header.dart';
import '../controller/home_controller.dart';
import '../widgets/custom_vendor_card.dart';

class ViewAllVendorsScreen extends StatefulWidget {
  ViewAllVendorsScreen({super.key});

  @override
  State<ViewAllVendorsScreen> createState() => _ViewAllVendorsScreenState();
}

class _ViewAllVendorsScreenState extends State<ViewAllVendorsScreen> {
  HomeController homeController = Get.find();
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getVendorCategory();
    homeController.getAllVendors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Obx(
            () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8,right: 16, left: 16),
              child: Column(
                children: [
                  CustomHeader(
                    backgroundColor: AppTheme.whiteColor,
                    arrowColor: AppTheme.blackColor,
                    containerBackgroundColor: AppTheme.whiteColor,
                    borderColor: AppTheme.lightGrayishColor,
                    showLogo: true,
                  ),
                  const SizedBox(height: 16),
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
                              homeController.getAllVendors(eventCategory: eventCategory.id.toString());
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

                ],
              ),
            ),
            Expanded(
              child: homeController.eventAllVendorsList.isEmpty
                  ? CustomTextPlaceHolder(
                text: "There are no vendors in this category",
                height: 50.h,
              )
                  : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 110),
                  itemCount: homeController.eventAllVendorsList.length,
                  itemBuilder: (context, index) {
                    var eventVendor = homeController.eventAllVendorsList[index];
                    return CustomVendorCard(
                      imagePaths: eventVendor.portfolio,
                      vendorName: eventVendor.businessName,
                      location: eventVendor.operatingAddress,
                      categories: eventVendor.servicesProvided,
                      isTopRated: true,
                      rating: 4.8,
                      isVerified: true,
                      isSponsored: true,
                      onAddToEvent: () {},
                      onContact: () async {
                        await ContactService.launchContact(
                          contactValue: eventVendor.preferredContactValue,
                          context: context,
                        );
                      },
                      onTap: () {
                        print(eventVendor.portfolio);
                        Get.toNamed(
                          AppRoutes.vendorDetailedScreen,
                          arguments: {
                            'imagePaths': eventVendor.portfolio,
                            'vendorName': eventVendor.businessName,
                            'location': eventVendor.operatingAddress,
                            'isTopRated': ['isTopRated'],
                            'rating': ['rating'],
                            'isVerified': ['isVerified'],
                            'categories': eventVendor.servicesProvided,
                            'email': eventVendor.user.email,
                            'preferredContactValue': eventVendor.preferredContactValue,
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

// imagePaths : [
//   AppAssets.vendorDummyImage,
//   AppAssets.eventImage1,
//   AppAssets.featuredImage1,
//   AppAssets.vendor2Image,
// ],
// vendorName: 'Royal Events & Catering',
// location: 'Jinnah Boulevard sector E DHA phase 3 islamabad',
// categories: ['WEDDING', 'EVENT', 'CATERING'],