import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_bottom_sheet.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/roles/customer/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../services/contact_service.dart';
import '../../home/widgets/custom_category_tab_bar.dart';
import '../widgets/badge_item.dart';

class VendorDetailedScreen extends StatefulWidget {
  const VendorDetailedScreen({super.key});
  @override
  State<VendorDetailedScreen> createState() => _VendorDetailedScreenState();
}

class _VendorDetailedScreenState extends State<VendorDetailedScreen> {

  HomeController homeController = Get.find();


  final Map<String, dynamic> args = Get.arguments ?? {};
   List<String> imagePaths =  [
    AppAssets.vendorDummyImage,
    AppAssets.eventImage1,
    AppAssets.featuredImage1,
  ];
  late final String vendorName;
  late final String preferredContactValue;
  late final int vendorId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeController.getAllVendors();
    vendorId = args['vendorId'];
    imagePaths= args['imagePaths'];
    vendorName = args['vendorName'] ?? 'Vendor Name';
    preferredContactValue = args['preferredContactValue'] ?? '';
    print(imagePaths);
  }

  final List<String> vendorDetailedCategories = [
    'ABOUT',
    'PORTFOLIO',
    // 'REVIEWS',
    // 'REWARDS',
    // 'PAST EVENTS',
  ];
  final GlobalKey menuKey = GlobalKey();


  var selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.silverColor.withOpacity(.2),
                      ),
                      child: Center(
                        child: Image.asset(
                          width: 24,
                          height: 24,
                          AppAssets.arrowIcon,
                          color: AppTheme.blackColor,
                        ),
                      ),
                    ),
                  ),
                  CustomPopupMenu(
                    menuKey: menuKey, options: [
                      PopupMenuOption(
                        title: 'Block',
                        onTap: () => CustomBottomSheet.show(
                          context: context,
                          title: 'Block this vendor?',
                          descriptionTexts: [
                            'Are you sure you want to block this vendor? You’ll no longer receive messages or quotes from them.',
                            'They won’t know you blocked or reported them.',
                          ],
                          primaryActionText: 'Yes, Block Vendor',
                          primaryActionIcon: AppAssets.reportIcon,
                          onPrimaryAction: () {
                            print('Vendor blocked');
                            },
                          secondaryActionText: 'Cancel',
                          secondaryActionIcon: AppAssets.blockIcon,
                        ),
                      ),
                    PopupMenuOption(
                      title: 'Report',
                      onTap: () => CustomBottomSheet.show(
                        context: context,
                        title: 'Report Vendor to Eventori',
                        descriptionTexts: [
                          'Are you sure you want to block and report this vendor? You’ll no longer receive messages or quotes from them.',
                          'Your report will help us review any suspicious or inappropriate behaviour.',
                        ],
                        primaryActionText: 'Yes, Report ',
                        primaryActionIcon: AppAssets.blockIcon,
                        onPrimaryAction: () {
                          Navigator.pop(context);
                          Future.delayed(const Duration(milliseconds: 100), () {
                            Get.toNamed(AppRoutes.reportVendorScreen, arguments: {
                              'vendorId' : vendorId,
                            });
                          });
                          print('Report Vendor');
                          },
                        secondaryActionText: 'Cancel',
                        secondaryActionIcon: AppAssets.reportIcon,
                      ),
                    ),
                  ],
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.silverColor.withOpacity(.2),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppAssets.layoutIcon, width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                    decoration: BoxDecoration(color: AppTheme.whiteColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 120,
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 100.w,
                                  height: 120,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    itemCount: imagePaths.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: index < imagePaths.length - 1 ? 12 : 0,
                                    ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: CustomImageHandler(
                                            imagePath: imagePaths[index],
                                            width: 98,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                      },
                                  ),
                                ),
                                Positioned(
                                  bottom: -55,
                                  child: Container(
                                  width: 94,
                                  height: 94,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppTheme.lightCyanColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: ClipOval(
                                      child: CustomImageHandler(
                                        imagePath: imagePaths.isNotEmpty
                                            ? imagePaths.first
                                          : AppAssets.uploadImageIcon,
                                        width: 94,
                                        height: 94,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                        const SizedBox(height: 70),
                        Text(
                          vendorName,
                          style: AppTextStyle.f18W500BColorTextStyle,
                          textAlign: TextAlign.center,
                        ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              spacing: 4,
                              runSpacing: 8,
                              children: [
                                BadgeItem(
                                  icon: AppAssets.topRatedBadgeIcon,
                                  label: 'Top- rated',
                                  backgroundColor: AppTheme.blueGrayColor,
                                ),
                                BadgeItem(
                                  icon: AppAssets.starIcon,
                                  label: 'Star Rating',
                                  backgroundColor: AppTheme.blueGrayColor.withOpacity(.8),
                                ),
                                BadgeItem(
                                  icon: AppAssets.verifiedIcon,
                                  label: 'Verified Id',
                                  backgroundColor: AppTheme.blueGrayColor.withOpacity(.7),
                                ),
                                BadgeItem(
                                  icon: Icons.bolt,
                                  label: 'Fast Responder',
                                  backgroundColor: AppTheme.blueGrayColor.withOpacity(.6),
                                  isIconData: true,
                                ),

                                BadgeItem(
                                  icon: Icons.account_balance,
                                  label: 'Established',
                                  backgroundColor: AppTheme.blueGrayColor.withOpacity(.5),
                                  iconColor: AppTheme.blackColor,
                                  textColor: AppTheme.blackColor,
                                  isIconData: true,
                                ),

                                BadgeItem(
                                  icon: Icons.rocket_launch,
                                  label: 'Rising Star',
                                  backgroundColor: AppTheme.blueGrayColor.withOpacity(.3),
                                  iconColor: AppTheme.blackColor,
                                  textColor: AppTheme.blackColor,
                                  isIconData: true,
                                ),


                                // BadgeItem(
                                //   icon: Icons.account_balance,
                                //   label: 'Established',
                                //   backgroundColor: AppTheme.blueGrayColor.withOpacity(.5),
                                //   isIconData: true,
                                //),
                                // BadgeItem(
                                //   icon: Icons.rocket_launch,
                                //   label: 'Rising Star',
                                //   backgroundColor: AppTheme.blueGrayColor.withOpacity(.3),
                                //   isIconData: true,
                                // ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  Text: "Add to event",
                                  onTap: () {},
                                  buttonColor: AppTheme.lightCyanColor,
                                  textColor: AppTheme.whiteColor,
                                  height: 48,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: CustomButton(
                                  Text: "Contact",
                                  onTap: ()
                                  async {
                                    await ContactService.launchContact(
                                      // contactValue: eventVendor.preferredContactValue,
                                      contactValue: preferredContactValue,
                                      context: context,
                                    );
                                  },
                                  buttonColor: AppTheme.whiteColor,
                                  textColor: AppTheme.lightCyanColor,
                                  height: 48,
                                  borderColor: AppTheme.lightCyanColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: CustomCategoryTabBar(
                        categories: vendorDetailedCategories,
                        initialIndex: selectedCategoryIndex,
                        onCategorySelected: (index){
                          setState(() {
                            selectedCategoryIndex = index;
                            print(index);
                          });
                          print('Selected category: ${vendorDetailedCategories[index]}');
                        },
                      ),
                    ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              selectedCategoryIndex == 0?'About':"Portfolio",
                              style: AppTextStyle.f18W500BColorTextStyle,
                            ),
                          ),
                          const SizedBox(height: 12),
                          selectedCategoryIndex == 0? Text(
                            homeController.eventAllVendorsList.first.serviceDescription,
                            style: AppTextStyle.f14W400SColorTextStyle,
                          ):  GridView.builder(
                            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: imagePaths.length,
                            itemBuilder: (context, index) {

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox.expand(
                                  child: CustomImageHandler(
                                    imagePath: imagePaths[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                  ],
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}


// final double rating = args['rating'] ?? 4.8;
// final bool isTopRated = args['isTopRated'] ?? true;
// final bool isVerified = args['isVerified'] ?? true;
// final String location = args['location'] ?? 'Lahore, Pakistan';
// final List<String> categories = args['categories'] ?? ['WEDDING', 'EVENT'];