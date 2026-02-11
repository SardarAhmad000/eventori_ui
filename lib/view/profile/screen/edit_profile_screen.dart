import 'dart:io';
import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../AppTheme/app_theme.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../app_widgets/custom_dropdown.dart';
import '../../../app_widgets/custom_image_handler.dart';
import '../../../app_widgets/custom_image_picker.dart';
import '../../../app_widgets/custom_textfield.dart';
import '../../../constants/aap_assets.dart';
import '../../../constants/app_text_style.dart';
import '../../../constants/custom_validators.dart';
import '../controller/profile_controller.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final CustomImagePicker _customImagePicker = CustomImagePicker();

  // File? selectedProfileImage;

  ProfileController profileController = Get.find();
  AuthController authController = Get.find();

  @override
  void initState() {
    super.initState();
    // profileController.editLocationController.text = authController.userData.value!.location;
    profileController.onInit();

    profileController.selectedImage.value = Get.put(AuthController()).userData.value!.image??'';
    profileController.editEmailController.text = Get.put(AuthController()).userData.value!.email;
    profileController.editPhoneController.text = Get.put(AuthController()).userData.value!.phoneNumber;
    profileController.selectedGender.value = Get.put(AuthController()).userData.value!.gender;
    profileController.selectedCountry.value = Get.put(AuthController()).userData.value!.country;
    profileController.selectedCity.value = Get.put(AuthController()).userData.value!.city;


    print( profileController.selectedImage.value);
    print( authController.userData.value!.phoneNumber);
    print( authController.userData.value!.gender+" gender is");
    print( authController.userData.value!.country+"  Country is....");
    print( authController.userData.value!.city);



  }


  Future<void> _showImageSourceOptions() async {
    final File? pickedImage = await _customImagePicker.showImageSourceBottomSheet(context);

    if (pickedImage != null && mounted) {
      setState(() {
        profileController.selectedImage.value = pickedImage.path;
      });
      print('Image selected: ${profileController.selectedImage.value}');
    } else {
      print('No image selected');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Image.asset(
                        AppAssets.arrowLeftIcon,
                        color: AppTheme.blackColor,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: AppTextStyle.f18W600BColorTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showImageSourceOptions,
                        child: Stack(
                          children: [

                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.denimBlueColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child:Obx(() => ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: profileController.selectedImage.value.isNotEmpty
                                    ? (profileController.selectedImage.value.startsWith('http')
                                    ? CustomImageHandler(
                                  imagePath: profileController.selectedImage.value,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorAsset: AppAssets.userAvatarIcon,
                                  loaderColor: AppTheme.lightCyanColor,
                                  loaderSize: 24,
                                )
                                    : Image.file(
                                  File(profileController.selectedImage.value),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ))
                                    : Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: CustomImageHandler(
                                        imagePath: '',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                        errorAsset: AppAssets.userAvatarIcon,
                                        loaderColor: AppTheme.lightCyanColor,
                                        loaderSize: 24,
                                      ),
                                    ),
                              )),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _showImageSourceOptions,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppTheme.whiteColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppAssets.cameraIcon,
                                      width: 16,
                                      height: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      AbsorbPointer(
                        child: CustomTextField(
                          controller: profileController.editEmailController,
                          hintText: 'sardarahmad232@gmail.com',
                          prefixIcon: Image.asset(
                            AppAssets.mailIcon,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: profileController.editPhoneController,
                        hintText: 'Enter Phone Number',
                        prefixIcon: Image.asset(
                          AppAssets.phoneIcon,
                        ),
                        validator: CustomValidator.phone,
                      ),
                      const SizedBox(height: 12),
                      Obx(() => CustomDropdownField(
                        prefixIcon: AppAssets.userIcon,
                        hintText: 'Gender',
                        value: profileController.selectedGender.value.isEmpty
                            ? null
                            : profileController.selectedGender.value,
                        items: const [
                          DropdownMenuItem(value: 'Male', child: Text('Male')),
                          DropdownMenuItem(value: 'Female', child: Text('Female')),
                          DropdownMenuItem(value: 'Other', child: Text('Other')),
                        ],
                        onChanged: (value) {
                          profileController.updateGender(value);
                        },
                        validator: CustomValidator.selectGenderRange,
                      )),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  key: profileController.countryKey,
                                  onTap: () async {
                                    final renderBox = profileController
                                        .countryKey.currentContext!
                                        .findRenderObject() as RenderBox;
                                    final position = renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCountryData();
                                    countrySelect(
                                      context,
                                      position,
                                      size,
                                      profileController.countryVN,
                                    );

                                    // Validate country after selection
                                    final validationError = CustomValidator.country(
                                        profileController.selectedCountry.value);
                                    profileController.countryError.value = validationError;

                                    print("sadh");
                                    print(profileController.selectedCountry.value);
                                    print("ashdasdjk");
                                  },
                                  child: Obx(() => Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color:
                                        profileController.countryError.value != null
                                            ? AppTheme.redColor
                                            : AppTheme.textfieldBorderColor,
                                        width: 1.3,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Expanded(
                                          child: Text(
                                            profileController.selectedCountry.value==null|| profileController.selectedCountry.value!.isEmpty?
                                            'Country': profileController.selectedCountry.value!,
                                            style: AppTextStyle.f16W400SColorTextStyle
                                                .copyWith(
                                                color: profileController.selectedCountry.value == null || profileController.selectedCountry.value!.isEmpty
                                                    ? AppTheme.silverColor
                                                    : AppTheme.darkpurpleColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down, color: AppTheme.slateGreyColor, size: 20),

                                      ],
                                    ),
                                  )),
                                ),
                                Obx(() {
                                  if (profileController.countryError.value != null) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 4),
                                      child: Text(
                                        profileController.countryError.value!,
                                        style: AppTextStyle.f12W400RColorTextStyle
                                            .copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(() => GestureDetector(
                                  key: profileController.cityKey,
                                  onTap: profileController.selectedCountry.value == null
                                      ? () {
                                    profileController.countryError.value =
                                        CustomValidator.country(null);
                                  }
                                      : () async {
                                    final renderBox = profileController
                                        .cityKey.currentContext!
                                        .findRenderObject() as RenderBox;
                                    final position =
                                    renderBox.localToGlobal(Offset.zero);
                                    final size = renderBox.size;
                                    await loadCityData(
                                        country: profileController.countryVN);
                                    citySelect(
                                      context,
                                      position,
                                      size,
                                      profileController.cityVN,
                                      country: profileController.countryVN,
                                    );

                                    // Validate city after selection
                                    final validationError = CustomValidator.city(
                                        profileController.selectedCity.value);
                                    profileController.cityError.value =
                                        validationError;
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppTheme.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: profileController.cityError.value != null
                                            ? AppTheme.redColor
                                            : AppTheme.textfieldBorderColor,
                                        width: 1.3,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            profileController.selectedCity.value==null|| profileController.selectedCity.value!.isEmpty?
                                            'City': profileController.selectedCity.value!,
                                            // profileController.selectedCity.value ?? 'City',
                                            style: AppTextStyle.f16W400SColorTextStyle
                                                .copyWith(
                                              color: profileController
                                                  .selectedCity.value == null || profileController.selectedCity.value!.isEmpty
                                                  ? AppTheme.silverColor
                                                  : AppTheme.darkpurpleColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down,
                                            color: AppTheme.slateGreyColor, size: 20),
                                      ],
                                    ),
                                  ),
                                )),
                                Obx(() {
                                  if (profileController.cityError.value != null) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 4, left: 4),
                                      child: Text(
                                        profileController.cityError.value!,
                                        style: AppTextStyle.f12W400RColorTextStyle
                                            .copyWith(fontWeight: FontWeight.bold),
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: CustomButton(
                Text: 'Save Changes',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    print('Email: ${authController.selectedProfileImage.value}');
                    print('Email: ${profileController.editEmailController.text.trim()}');
                    print('Phone: ${profileController.editPhoneController.text.trim()}');
                    print('Gender: ${profileController.selectedGender.value}');
                    print(
                        'Location: ${profileController.selectedCountry.value} ${profileController.selectedCity.value}');

                    if (profileController.selectedImage.value != null) {
                      print('Profile Image Path: ${profileController.selectedImage.value!}');
                      print('Profile Image Selected: Yes');
                    } else {
                      print('Profile Image Selected: No');
                    }
                    profileController.updateProfile(
                        profileController.selectedCity.toString(),
                        profileController.selectedCountry.toString(),
                        profileController.selectedGender.value,
                        profileController.editPhoneController.text,
                        profileController.selectedImage.value,
                        authController.userData.value!.role,
                    );
                    // Get.back();
                  } else {
                    print('Validation Failed: Please fill in all required fields');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}