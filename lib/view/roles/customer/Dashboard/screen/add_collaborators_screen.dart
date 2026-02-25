import 'dart:io';

import 'package:eventori/view/roles/customer/Dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_button.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../app_widgets/custom_image_picker.dart';
import '../../../../../app_widgets/custom_profile_card.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_validators.dart';
import '../../../../onboarding/widgets/build_header.dart';

class AddCollaboratorsScreen extends StatefulWidget {
  const AddCollaboratorsScreen({super.key});
  @override
  State<AddCollaboratorsScreen> createState() => _AddCollaboratorsScreenState();
}

class _AddCollaboratorsScreenState extends State<AddCollaboratorsScreen> {
  final DashboardController dashboardController = Get.find();

  final TextEditingController firstNameVendorController = TextEditingController();
  final TextEditingController lastNameVendorController = TextEditingController();
  final TextEditingController emailVendorController = TextEditingController();
  final TextEditingController roleVendorController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();
  Key _formKey = UniqueKey();

  final CustomImagePicker _customImagePicker = CustomImagePicker();


  Future<void> _showImageSourceOptions() async {
    final File? pickedImage = await _customImagePicker.showImageSourceBottomSheet(context);

    if (pickedImage != null && mounted) {
      setState(() {
        dashboardController.selectedImage.value = pickedImage.path;
      });
      print('Image selected: ${dashboardController.selectedImage.value}');
    } else {
      print('No image selected');
    }
  }

  @override
  void dispose() {
    firstNameVendorController.dispose();
    lastNameVendorController.dispose();
    emailVendorController.dispose();
    roleVendorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dashboardController.getCollaborator();
      print("ahahaha : ${dashboardController.getCollaborator()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Obx(
            () =>  Form(
              key: _formKey,
              child: Column(
              children: [
                const SizedBox(height: 16),
                CustomHeader(
                  backgroundColor: AppTheme.whiteColor,
                  arrowColor: AppTheme.blackColor,
                  containerBackgroundColor: AppTheme.whiteColor,
                  borderColor: AppTheme.lightGrayishColor,
                  showLogo: true,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Collaborators',
                          style: AppTextStyle.f32W600DPColorTextStyle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Invite people to help you manage this event.',
                          style: AppTextStyle.f16W400SIColorTextStyle,
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: GestureDetector(
                            onTap: _showImageSourceOptions,
                            child: Stack(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
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
                                    child: dashboardController.selectedImage.value.isNotEmpty
                                        ? (dashboardController.selectedImage.value.startsWith('http')
                                        ? CustomImageHandler(
                                      imagePath: dashboardController.selectedImage.value,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorAsset: AppAssets.userAvatarIcon,
                                      loaderColor: AppTheme.lightCyanColor,
                                      loaderSize: 24,
                                    )
                                        : Image.file(
                                      File(dashboardController.selectedImage.value),
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
                                      width: 22,
                                      height: 22,
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
                                          width: 14,
                                          height: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: firstNameVendorController,
                          hintText: 'First Name',
                          prefixIcon: Image.asset(AppAssets.userIcon, color: AppTheme.silverColor),
                          validator: CustomValidator.firstName,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: lastNameVendorController,
                          hintText: 'Last Name',
                          prefixIcon: Image.asset(AppAssets.userIcon, color: AppTheme.silverColor),
                          validator: CustomValidator.lastName,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: emailVendorController,
                          hintText: 'Email Address',
                          prefixIcon: Image.asset(AppAssets.mailIcon, color: AppTheme.silverColor),
                          validator: CustomValidator.email,
                        ),
                        const SizedBox(height: 12),
                        CustomTextField(
                          controller: roleVendorController,
                          hintText: 'Role',
                          prefixIcon: Image.asset(AppAssets.pencilIcon, color: AppTheme.silverColor),
                        ),
                        const SizedBox(height: 12),
                        CustomButton(
                          Text: "Add Collaborators +",
                          buttonColor: AppTheme.paperWhiteColor,
                          textColor: AppTheme.blackColor,
                          height: 48,
                          borderColor: AppTheme.lightCyanColor,
                          onTap: () async{


                            print(dashboardController.selectedImage.value);
                            print(firstNameVendorController.text.trim());
                            print(lastNameVendorController.text.trim());
                            print(emailVendorController.text.trim());
                            print(roleVendorController.text.trim());


                            await dashboardController.addCollaborator(
                                dashboardController.selectedImage.value,
                                firstNameVendorController.text.trim(),
                                lastNameVendorController.text.trim(),
                                emailVendorController.text.trim(),
                                roleVendorController.text.trim()
                            );

                             // setState(() {
                             //   _formKey = UniqueKey();
                             //   firstNameVendorController.clear();
                             //   lastNameVendorController.clear();
                             //   emailVendorController.clear();
                             //   roleVendorController.clear();
                             // });
                          },
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dashboardController.collaboratorModelList.length,
                            itemBuilder: (context, index) {
                              final collaborator = dashboardController.collaboratorModelList[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: CustomProfileCard(
                                  imageUrl: collaborator.image,
                                  name: '${collaborator.firstName} ${collaborator.lastName}'.trim(),
                                  role: collaborator.role,
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        Text: "Skip",
                        onTap: () {
                          Get.back();
                        },
                        buttonColor: AppTheme.paperWhiteColor,
                        textColor: AppTheme.blackColor,
                        height: 48,
                        borderColor: AppTheme.lightCyanColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        Text: "Save & Continue",
                        onTap: () {
                          Get.back();
                        },
                        buttonColor: AppTheme.lightCyanColor,
                        textColor: AppTheme.whiteColor,
                        height: 48,
                      ),
                    ),
                  ],
                ),
              ],
              ),
            ),
        ),
      ),
    );
  }
}
