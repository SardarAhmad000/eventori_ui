import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../AppTheme/app_theme.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key,this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:height?? 50.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircularProgressIndicator(
                color: AppTheme.lightCyanColor,
              ),
            ),
          ],
        ));
  }
}