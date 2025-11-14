import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../onboarding/widgets/build_header.dart';
import '../widgets/stats_card.dart';
import '../widgets/vendor_dashboard_card.dart';

class VendorsDashboardScreen extends StatefulWidget {
  const VendorsDashboardScreen({super.key});

  @override
  State<VendorsDashboardScreen> createState() => _VendorsDashboardScreenState();
}

class _VendorsDashboardScreenState extends State<VendorsDashboardScreen> {
  final TextEditingController searchVendorController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),
            const SizedBox(height: 16),
            Text(
              'Vendors',
              style: AppTextStyle.f32W600DPColorTextStyle,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              borderRadius: 99,
              hintText: 'Search Vendors',
              controller: searchVendorController,
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
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StatsCard(
                        iconPath: AppAssets.vendorBookedIcon,
                        iconColor: AppTheme.purpleColor,
                        value: '09',
                        label: 'Total vendors',
                        onTap: (){},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: StatsCard(
                        iconPath: AppAssets.vendorBookedIcon,
                        iconColor: AppTheme.purpleColor,
                        value: '05',
                        label: 'Vendors Booked',
                        onTap: (){},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: StatsCard(
                        iconPath: AppAssets.vendorBookedIcon,
                        iconColor: AppTheme.purpleColor,
                        value: '04',
                        label: 'Remaining',
                        onTap: (){},
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return VendorDashboardCard(
                      imageUrl: AppAssets.picImage,
                      title: 'Decor & Dreams',
                      profession: 'Decorator',
                      status: 'Pending',
                      onTapCard: () {
                        print('Tapped On Vendor Card');
                      },
                      onTapIcon: () {
                        print('icon tapped');
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
