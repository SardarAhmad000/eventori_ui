import 'dart:async';

import 'package:eventori/view/roles/customer/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../search/widgets/custom_fav_vendor_card.dart';
import '../../search/widgets/vendor_booking_bottom_sheet.dart';

class FaviourteVendorsScreen extends StatefulWidget {
  const FaviourteVendorsScreen({super.key});
  @override
  State<FaviourteVendorsScreen> createState() => _FaviourteVendorsScreenState();
}

class _FaviourteVendorsScreenState extends State<FaviourteVendorsScreen> {
  HomeController homeController =Get.find();
  final TextEditingController searchFavVendorsController = TextEditingController();
  Timer? _searchDebouncer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getFavoriteVendor();
  }

  @override
  void dispose() {
    _searchDebouncer?.cancel();
    searchFavVendorsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Obx(
          () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  AppAssets.appLogo,
                  width: 38,
                  height: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: AbsorbPointer(
                    absorbing: true,
                    child: CustomTextField(
                      controller: searchFavVendorsController,
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
                      onChanged: (value) {
                        // Cancel previous timer
                        _searchDebouncer?.cancel();

                        // Start new timer - searches after user stops typing for 500ms
                        _searchDebouncer = Timer(const Duration(milliseconds: 500), () {
                          homeController.getAllVendors(searchQuery: value);
                        });
                      },
                    ),
                  ),

              ),


              Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  padding: EdgeInsets.zero,
                  itemCount: homeController.favVendorList.length,
                  itemBuilder: (context, index) {
                    final favVendor = homeController.favVendorList[index];


                    return FavoriteVendorCard(
                      vendorName: favVendor.businessName,
                      description: favVendor.serviceDescription,
                      location: favVendor.operatingAddress,
                      imagePath: favVendor.portfolio.first,
                      rating: 4.6,
                      isTopRated: true,
                      isVerified: true,
                      isFavorite: true,
                      onChatPressed: () {},
                      onBookPressed: () {
                        showBookingBottomSheet(context, "Elegant Moments Photography");
                      },
                      onFavoritePressed: () {},
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