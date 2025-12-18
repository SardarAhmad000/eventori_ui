import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_text_style.dart';

class CustomTextPlaceHolder extends StatelessWidget {
  const CustomTextPlaceHolder({super.key,this.height,this.text});
  final double? height;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:height?? 60.h,
      child: Center(
        child: Text(text??"No Data Found.",style: AppTextStyle.f16W400BColorTextStyle),
      ),
    );
  }
}