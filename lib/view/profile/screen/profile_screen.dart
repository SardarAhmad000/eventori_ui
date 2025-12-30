import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/app_widgets/custom_image_handler.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:eventori/routes/app_routes.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:eventori/view/profile/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../app_widgets/custom_clear_chat_dialog.dart';
import '../../../app_widgets/custom_toggle.dart';
import '../controller/profile_controller.dart';
import '../widgets/change_password_bottem_sheet.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthController authController =Get.find();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // profileController.profileEmailController.text=authController.userData.value!.email;
  //   // profileController.phoneNoController.text=authController.userData.value!.phoneNumber;
  //   // profileController.selectedGender.value =authController.userData.value!.gender;
  //   // profileController.locationController.text =authController.userData.value!.location;
  //
  // }
  ProfileController profileController = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180,
                width: 100.w,
                decoration: BoxDecoration(
                  color: AppTheme.denimBlueColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Image.asset(
                          width: 38,
                          height: 32,
                          AppAssets.appLogo,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              AppAssets.arrowLeftIcon,
                              color: AppTheme.whiteColor,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              profileController.logout();
                            },
                            child: Image.asset(
                              AppAssets.logoutIcon,
                              color: AppTheme.whiteColor,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                child: Stack(
                  children: [
                    Obx(
                          ()=> Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppTheme.denimBlueColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.whiteColor,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: (authController.userData.value?.image == null || authController.userData.value!.image!.isEmpty)
                                  ? const EdgeInsets.all(12)
                                  : EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CustomImageHandler(
                                  imagePath: authController.userData.value?.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )

                    ),
                    // Positioned(
                    //   bottom: 10,
                    //   right: 2,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       profileController.uploadProfilePicture();
                    //     },
                    //     child: Icon(
                    //       Icons.camera_alt,
                    //       color: AppTheme.stormyGrayColor,
                    //       size: 24,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 55),
          GestureDetector(
            onTap: ()async {
               await authController.getUserData();
              Get.toNamed(AppRoutes.editProfileScreen);
              // profileController.updateUserProfileData();
              //
            },
            child: Text(
              'Edit',
              style: AppTextStyle.f14W400RColorTextStyle.copyWith(color: AppTheme.lightCyanColor),
            ),
          ),

          // Name Text (Fixed)
          Text(
            authController.userData.value!.firstName +' '+authController.userData.value!.lastName,
            style: AppTextStyle.f24W600BColorTextStyle,
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                child: Column(
                  children: [
                    // CustomTextField(
                    //   controller: profileController.profileNameController,
                    //   hintText: 'First Name',
                    //   prefixIcon: Image.asset(
                    //     AppAssets.userIcon,
                    //     color: AppTheme.silverColor,
                    //   ),
                    //   // validator: CustomValidator.firstName,
                    // ),
                    // const SizedBox(height: 12),
                    // CustomTextField(
                    //   controller: profileController.profileEmailController,
                    //   hintText: 'Email Address',
                    //   prefixIcon: Image.asset(
                    //     AppAssets.mailIcon,
                    //     color: AppTheme.silverColor,
                    //   ),
                    //   // validator: CustomValidator.email,
                    // ),
                    // const SizedBox(height: 12),
                    // CustomTextField(
                    //   controller: profileController.phoneNoController,
                    //   hintText: '+44799999999',
                    //   prefixIcon: Image.asset(
                    //     AppAssets.phoneIcon,
                    //     color: AppTheme.silverColor,
                    //   ),
                    //   // validator: CustomValidator.phoneNo,
                    // ),
                    // const SizedBox(height: 12),
                    // Obx(() => CustomDropdownField(
                    //   prefixIcon: AppAssets.userIcon,
                    //   hintText: 'Gender',
                    //   value: profileController.selectedGender.value.isEmpty
                    //       ? null
                    //       : profileController.selectedGender.value,
                    //   items: const [
                    //     DropdownMenuItem(value: 'Male', child: Text('Male')),
                    //     DropdownMenuItem(value: 'Female', child: Text('Female')),
                    //     DropdownMenuItem(value: 'Other', child: Text('Other')),
                    //   ],
                    //   onChanged: (value) {
                    //     profileController.updateGender(value);
                    //   },
                    // )),
                    // const SizedBox(height: 12),

                    // CustomTextField(
                    //   controller: profileController.locationController,
                    //   hintText: 'Location',
                    //   prefixIcon: Image.asset(
                    //     AppAssets.locationIcon,
                    //     color: AppTheme.silverColor,
                    //   ),
                    //   // validator: CustomValidator.lo,
                    // ),
                    // const SizedBox(height: 12),


                    // GestureDetector(
                    //   onTap: () {
                    //     showCountryPicker(
                    //       context: context,
                    //       showPhoneCode: false,
                    //       onSelect: (Country country) {
                    //         profileController.updateCountry(country.name);
                    //       },
                    //       countryListTheme: CountryListThemeData(
                    //         borderRadius: BorderRadius.circular(8),
                    //         inputDecoration: InputDecoration(
                    //           hintText: 'Location',
                    //           hintStyle: AppTextStyle.f14W400SColorTextStyle,
                    //           prefixIcon: Padding(
                    //             padding: const EdgeInsets.all(10.0),
                    //             child: Image.asset(
                    //               AppAssets.loactionIcon,
                    //               width: 18,
                    //               height: 18,
                    //               color: AppTheme.silverColor,
                    //             ),
                    //           ),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(8),
                    //             borderSide: BorderSide(
                    //               color: AppTheme.textfieldBorderColor,
                    //               width: 2,
                    //             ),
                    //           ),
                    //         ),
                    //         searchTextStyle: AppTextStyle.f14W400BColorTextStyle,
                    //         textStyle: AppTextStyle.f14W400BColorTextStyle,
                    //       ),
                    //     );
                    //   },
                    //   child: Obx(() => Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    //     decoration: BoxDecoration(
                    //       color: AppTheme.whiteColor,
                    //       borderRadius: BorderRadius.circular(8),
                    //       border: Border.all(
                    //         color: AppTheme.textfieldBorderColor,
                    //         width: 2,
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           profileController.selectedCountry.value.isEmpty
                    //               ? 'Location'
                    //               : profileController.selectedCountry.value,
                    //           style: profileController.selectedCountry.value.isEmpty
                    //               ? AppTextStyle.f14W400SColorTextStyle
                    //               : AppTextStyle.f14W400BColorTextStyle,
                    //         ),
                    //         Icon(
                    //           Icons.keyboard_arrow_down,
                    //           color: AppTheme.silverColor,
                    //         ),
                    //       ],
                    //     ),
                    //   )),
                    // ),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.textfieldBorderColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allow Notifications',
                                  style: AppTextStyle.f14W400SColorTextStyle,
                                ),
                                    CustomToggleSwitch(
                                  initialValue: false,
                                  activeColor: AppTheme.lightCyanColor,
                                  inactiveColor: AppTheme.textfieldBorderColor,
                                  width: 45,
                                  height: 28,
                                  onChanged: (value){
                                    profileController.changeNotificationStatus(value);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppTheme.dividerColor),
                          // MenuItemWidget(
                          //   title: 'Change Password',
                          //   iconPath: AppAssets.chevronIcon,
                          //   onTap: () {
                          //     showModalBottomSheet(
                          //       context: context,
                          //       isScrollControlled: true,
                          //       backgroundColor: Colors.transparent,
                          //       builder: (context) => const ChangePasswordBottomSheet(),
                          //     );
                          //     print('Change password');
                          //   },
                          // ),

                          MenuItemWidget(
                            title: 'Change Password',
                            iconPath: AppAssets.chevronIcon,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: true,
                                enableDrag: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                  ),
                                  child: const ChangePasswordBottomSheet(),
                                ),
                              );
                              print('Change password');
                            },
                          ),
                          Divider(color: AppTheme.dividerColor),
                          MenuItemWidget(
                            title: 'Privacy Policy',
                            iconPath: AppAssets.chevronIcon,
                            onTap: () {
                              profileController.openPrivacyPolicy();
                            },
                          ),
                          Divider(color: AppTheme.dividerColor),
                          MenuItemWidget(
                            title: 'Term & Conditions',
                            iconPath: AppAssets.chevronIcon,
                            onTap: () {
                              profileController.openTermsAndConditions();
                            },
                          ),
                          Divider(color: AppTheme.dividerColor),
                          MenuItemWidget(
                            title: 'Contact Us',
                            iconPath: AppAssets.chevronIcon,
                            onTap: () {
                              profileController.contactUs();
                            },
                          ),
                          Divider(color: AppTheme.dividerColor),
                          MenuItemWidget(
                            title: 'Rate Us',
                            iconPath: AppAssets.chevronIcon,
                            onTap: () {
                              profileController.rateUs();
                            },
                          ),
                          Divider(color: AppTheme.dividerColor),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 13),
                            child: MenuItemWidget(
                              title: 'Delete Account',
                              isDelete: true,
                              onTap: () {
                                CustomClearChatDialog.show(
                                  context: context,
                                  title: 'Delete Account',
                                  subtitle: 'This will permanently remove your account from Eventori.',
                                  buttonText: 'Yes, Delete it',
                                  icon: AppAssets.deleteIcon,
                                  iconColor: AppTheme.redColor,
                                  buttonColor: AppTheme.redColor,
                                  buttonTextColor: AppTheme.whiteColor,
                                  isIconData: false,
                                  onConfirm: () {
                                    profileController.deleteUser();
                                    print('Delete account');
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          //   child: Column(
          //     children: [
          //       CustomButton(
          //         Text: "Edit",
          //         onTap: () {
          //           profileController.editProfile();
          //         },
          //         buttonColor: AppTheme.whiteColor,
          //         textColor: AppTheme.blackColor,
          //         height: 48,
          //         borderColor: AppTheme.lightCyanColor,
          //       ),
          //       const SizedBox(height: 12),
          //       CustomButton(
          //         Text: "Save changes",
          //         onTap: () {
          //           profileController.saveChanges();
          //         },
          //         buttonColor: AppTheme.lightCyanColor,
          //         textColor: AppTheme.whiteColor,
          //         height: 48,
          //         borderColor: AppTheme.lightCyanColor,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}