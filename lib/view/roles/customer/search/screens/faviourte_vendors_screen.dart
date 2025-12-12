import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../widgets/custom_fav_vendor_card.dart';
import '../widgets/vendor_booking_bottom_sheet.dart';

class FaviourteVendorsScreen extends StatefulWidget {
  const FaviourteVendorsScreen({super.key});
  @override
  State<FaviourteVendorsScreen> createState() => _FaviourteVendorsScreenState();
}

class _FaviourteVendorsScreenState extends State<FaviourteVendorsScreen> {
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
                  // controller: ,
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
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return FavoriteVendorCard(
                    vendorName: "Elegant Moments Photography",
                    description: "Capturing timeless memories with elegance",
                    location: "Lahore, Pakistan",
                    imagePath: AppAssets.profileImage,
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
    );
  }
}