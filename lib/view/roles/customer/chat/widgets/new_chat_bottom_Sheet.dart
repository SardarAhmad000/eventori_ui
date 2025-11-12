import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_profile_card.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../app_widgets/custom_textfield.dart';
import '../../../../../app_widgets/custom_button.dart';

class NewChatBottomSheet extends StatefulWidget {
  const NewChatBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const NewChatBottomSheet(),
    );
  }

  @override
  State<NewChatBottomSheet> createState() => _NewChatBottomSheetState();
}

class _NewChatBottomSheetState extends State<NewChatBottomSheet> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Chat',
                  style: AppTextStyle.f16W500MBColorTextStyle,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.stormyGrayColor,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 16,
                      color: AppTheme.stormyGrayColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    borderRadius: 99,
                    hintText: 'Search name',
                    controller: searchController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Image.asset(
                        AppAssets.searchIcon,
                        color: AppTheme.slateGreyColor,
                        width: 45,
                        height: 45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppTheme.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.textfieldBorderColor,
                        width: 1,
                      ),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        controller: contactController,
                        hintText: 'New Contact',
                        prefixIcon: Image.asset(
                          AppAssets.userIcon,
                          color: AppTheme.silverColor,
                        ),
                        // validator: CustomValidator.firstName,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Collaborators',
                    style: AppTextStyle.f16W400BColorTextStyle,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: CustomProfileCard(
                          imageUrl: AppAssets.profileImage,
                          name: 'Sara',
                          role: 'Owner',
                        ),
                      );
                    },
                  ),
                  CustomButton(
                    Text: "Add collaboartors +",
                    onTap: () {},
                    buttonColor: AppTheme.whiteColor,
                    textColor: AppTheme.blackColor,
                    height: 48,
                    borderColor: AppTheme.lightCyanColor,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
