import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../AppTheme/app_theme.dart';
import '../../../../app_widgets/custom_image_handler.dart';
import '../../../../constants/aap_assets.dart';
import '../../../../routes/app_routes.dart';
import '../../../../services/shared_preferences/shared_preference.dart';

class HomeVendorScreen extends StatefulWidget {
  const HomeVendorScreen({super.key});

  @override
  State<HomeVendorScreen> createState() => _HomeVendorScreenState();
}

class _HomeVendorScreenState extends State<HomeVendorScreen> {
  final AuthPreference _authPreference = AuthPreference.instance;
  AuthController authController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.w,
            // height: 218,
            decoration: BoxDecoration(
              color: AppTheme.stormyIndigoColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              border: Border.all(
                color: AppTheme.stormyIndigoColor,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      AppAssets.appLogo,
                      width: 38,
                      height: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.profileScreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.denimBlueColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.slateGreyColor,
                                  width: 1,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CustomImageHandler(
                                  imagePath: authController.userData.value!.image,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Hi '+ authController.userData.value!.firstName,
                                  style: AppTextStyle.f12W400LGColorTextStyle),
                              const SizedBox(height: 2),
                              Text('Welcome Back!',
                                  style: AppTextStyle.f16W400WColorTextStyle),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppAssets.bellIcon,
                              width: 18, height: 18),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.faviourteVendorsScreen);
                            },
                            child: Image.asset(AppAssets.heartIcon,
                                width: 18, height: 18),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.profileScreen);
                            },
                            child: Image.asset(AppAssets.settingsIcon,
                                width: 18, height: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Manage your events, bookings, and clients easily',
                    style: AppTextStyle.f18W500LGColorTextStyle,
                  ),
                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          // Center(
          //   child: Column(
          //     children: [
          //       Text('Home Vendor Screen', style: AppTextStyle.f20W600BColorTextStyle,),
          //       CustomButton(
          //           Text: 'Logout',
          //         onTap: (){
          //             Get.offAllNamed(AppRoutes.loginScreen);
          //             _authPreference.setUserLoggedIn(false,"Event_Vendor");
          //             print('Logout');
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
