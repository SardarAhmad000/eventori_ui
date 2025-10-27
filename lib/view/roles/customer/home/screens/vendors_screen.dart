import 'package:flutter/material.dart';
import '../../../../../AppTheme/widgets/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../widgets/custom_category_tab_bar.dart';
import '../widgets/custom_vendor_card.dart';

class VendorsScreen extends StatefulWidget {
  const VendorsScreen({super.key});

  @override
  State<VendorsScreen> createState() => _VendorsScreenState();
}

class _VendorsScreenState extends State<VendorsScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'PHOTOGRAPHER',
    'CATERING',
    'VENUE',
    'DECORATION',
    'MUSIC',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 16.0,bottom: 8),
            child: CustomCategoryTabBar(
              categories: _categories,
              initialIndex: _selectedCategoryIndex,
              onCategorySelected: (index) {
                setState(() {
                  _selectedCategoryIndex = index;
                });
                print('Selected category: ${_categories[index]}');
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 98),
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
          // SizedBox(height: 68),
        ],
      ),
    );

  }
}
