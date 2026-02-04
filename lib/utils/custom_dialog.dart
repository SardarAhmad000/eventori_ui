import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AppTheme/app_theme.dart';

class CustomDialog {

  static void showLoading([String? message]) {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur
          (
          sigmaX: .2,  // soft blur
          sigmaY: .2,
        ), // blur background
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.lightCyanColor,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

}