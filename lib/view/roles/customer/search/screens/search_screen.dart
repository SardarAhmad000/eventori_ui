import 'dart:async';
import 'package:eventori/app_widgets/custom_text_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../routes/app_routes.dart';
import '../../../../../services/contact_service.dart';
import '../../home/controller/home_controller.dart';
import '../../home/widgets/custom_vendor_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = Get.find();
  final TextEditingController searchVendorsController = TextEditingController();
  Timer? _searchDebouncer;

  final Map<int, bool> _favoriteStatus = {};
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    homeController.getVendorCategory();
    homeController.getAllVendors();
  }

  @override
  void dispose() {
    _searchDebouncer?.cancel();
    searchVendorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Obx(
              () => Column(
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
              CustomTextField(
                controller: searchVendorsController,
                borderRadius: 99,
                hintText: 'Search Vendors',
                onChanged: (value) {
                  // Cancel previous timer
                  _searchDebouncer?.cancel();

                  // Start new timer - searches after user stops typing for 500ms
                  _searchDebouncer = Timer(const Duration(milliseconds: 500), () {
                    homeController.getAllVendors(searchQuery: value);
                  });
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 7),
                  child: Icon(
                    Icons.search,
                    color: AppTheme.slateGreyColor,
                    size: 20,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Clear button - shows only when there's text
                    ValueListenableBuilder(
                      valueListenable: searchVendorsController,
                      builder: (context, value, child) {
                        if (value.text.isEmpty) return const SizedBox.shrink();

                        return GestureDetector(
                          onTap: () {
                            searchVendorsController.clear();
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
                        // TODO: Implement filter functionality
                        // Example: showFilterBottomSheet(context);
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: SizedBox(
                  height: 32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.eventCategoryList.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedIndex == index;
                      var eventCategory = homeController.eventCategoryList[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            print(_selectedIndex);
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
              ),
              Expanded(
                child:  homeController.eventAllVendorsList.isEmpty
                    ? CustomTextPlaceHolder(
                  text: "There are no vendors in this category",
                  height: 50.h,
                ): ListView.builder(
                  padding: const EdgeInsets.only(bottom: 90),
                  itemCount: homeController.eventAllVendorsList.length,
                  itemBuilder: (context, index) {
                    var eventVendor = homeController.eventAllVendorsList[index];
                    return CustomVendorCard(
                      imagePaths: eventVendor.portfolio,
                      vendorName: eventVendor.businessName,
                      location: eventVendor.operatingAddress,
                      isTopRated: true,
                      rating: 4.8,
                      isVerified: true,
                      isSponsored: true,
                      categories: eventVendor.servicesProvided,
                      isFavorite: _favoriteStatus[index] ?? false,
                      onFavoriteToggle: () {
                        setState(() {
                          _favoriteStatus[index] = !(_favoriteStatus[index] ?? false);
                        });
                      },
                      onAddToEvent: () {},
                      onContact: () async {
                        await ContactService.launchContact(
                          contactValue: eventVendor.preferredContactValue,
                          context: context,
                        );
                      },
                      onTap: () {
                        print(eventVendor.portfolio);
                        print("hahahaha ${eventVendor.id}");
                        Get.toNamed(
                          AppRoutes.vendorDetailedScreen,
                          arguments: {
                            'vendorId' : eventVendor.id,
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
            ],
          ),
        ),
      ),
    );
  }
}