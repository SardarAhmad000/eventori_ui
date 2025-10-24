import 'package:eventori/constants/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/widgets/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_fonts.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../../constants/custom_button.dart';
import '../../../../../constants/custom_card.dart';
import '../widgets/create_event_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
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
                      child: Container(
                        height: 47,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Row(
                              children: [
                                 CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppTheme.whiteColor,
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Hi Noraiz',
                                        style: AppTextStyle.AlreadyTextStyle),
                                    const SizedBox(height: 2),
                                    Text('Welcome Back!',
                                        style: AppTextStyle.welcomeBackStyle),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(AppAssets.bellIcon, width: 18, height: 18),
                                const SizedBox(width: 12),
                                Image.asset(AppAssets.heartIcon, width: 18, height: 18),
                                const SizedBox(width: 12),
                                Image.asset(AppAssets.settingsIcon,
                                    width: 18, height: 18),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    
                    Text(
                        'Would you like to create a new event or explore vendors first?',
                        style: AppTextStyle.homeAppBarTextStyle
                    ),
                    SizedBox(height: 16),

                    CustomTextField(
                      borderRadius: 99,
                      hintText: "Search Vendors",
                      prefixIcon: Image.asset(
                        AppAssets.searchIcon,
                        color: AppTheme.slateGreyColor,
                        width: 24,
                        height: 24,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: AppTheme.paleGrayBlueColor,
                            borderRadius: BorderRadius.circular(999),
                            // shape: BoxShape.circle,
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
                  ],
                ),
              ),
            ),
            // _buildTabBar(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Events',
                        style: AppTextStyle.myEventsTitle
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CreateEventCard(
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          CustomCard(
                            imagePath: AppAssets.myEventImage,
                            title: 'My Events',
                            subtitle: 'View and manage your past and upcoming events',
                            onTap: () {

                            },
                          )

                        ],
                      ),
                      const SizedBox(height: 12),

                      Text(
                          'Browse Vendors',
                          style: AppTextStyle.myEventsTitle
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomCard(
                            imagePath: AppAssets.vendor1Image,
                            title: 'Surprise Birthday Dinner',
                            subtitle: 'Cozy gathering at restaurant/venue',
                            onTap: () {
                            },
                          ),
                          const SizedBox(width: 8),
                          CustomCard(
                            imagePath: AppAssets.vendor2Image,
                            title: 'Milestone Birthday Party',
                            subtitle: 'For 30th, 40th, 50th birthdays',
                            onTap: () {

                            },
                          ),

                        ],
                      ),
                      const SizedBox(height: 12),

                      CustomButton(
                        Text: 'View all vendors',
                        width: double.infinity,
                        height: 48,
                        buttonColor: Colors.white,
                        textColor: AppTheme.shadowColor,
                        borderColor: AppTheme.cyanColor,
                        textSize: 16,
                        fontFamily: AppFonts.medium,
                        onTap: () {
                        },
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Featured events',
                              style: AppTextStyle.myEventsTitle
                          ),

                          Text(
                              'View All',
                              style: AppTextStyle.viewAllText
                          ),

                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                        ],
                      ),


                      SizedBox(height: 109,),

                    ],
                  ),
                ),
              ),
            ),

            // const SizedBox(height: 108),
          ],
        )


    );
  }
}

