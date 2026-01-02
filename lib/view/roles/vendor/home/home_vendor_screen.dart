import 'package:eventori/app_widgets/custom_button.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/shared_preferences/shared_preference.dart';

class HomeVendorScreen extends StatefulWidget {
  const HomeVendorScreen({super.key});

  @override
  State<HomeVendorScreen> createState() => _HomeVendorScreenState();
}

class _HomeVendorScreenState extends State<HomeVendorScreen> {
  final AuthPreference _authPreference = AuthPreference.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Text('Home Vendor Screen', style: AppTextStyle.f20W600BColorTextStyle,),
                CustomButton(
                    Text: 'Logout',
                  onTap: (){
                      Get.offAllNamed(AppRoutes.loginScreen);
                      _authPreference.setUserLoggedIn(false,"Event_Vendor");
                      print('Logout');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
