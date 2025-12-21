import 'dart:async';
import 'package:eventori/view/auth/controller/auth_controller.dart';
import 'package:eventori/view/auth/widget/pin_code_input_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:get/get.dart';

import '../../../constants/app_text_style.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {

  AuthController authController = Get.find();
  TextEditingController controller=TextEditingController();
  int _secondsRemaining = 59;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _secondsRemaining = 59;
    });

    if(_secondsRemaining==0){
      _startTimer();
      // authController.resendOtpToVerifyRegisteredUser();
    }else{
      authController.resendOtpToVerifyRegisteredUser();
      print("sdah");
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            /// Header
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),

            const SizedBox(height: 20),
            Text('Verify your account', style: AppTextStyle.f32W600DPColorTextStyle),
            const SizedBox(height: 8),
            Text(
              'We\'ve sent a 5-digit code to your email. Please enter it below to reset your password.',
              style: AppTextStyle.f16W400SIColorTextStyle,
            ),
            const SizedBox(height: 32),

            PinCodeInputWidget(
                controller: controller,
                length: 5,
                onChanged: (value){
                },
                onCompleted: (value){
                  debugPrint("Entered OTP: $value");
                }
            ),

            const SizedBox(height: 24),

            CustomButton(
              Text: 'Verify code',
              width: double.infinity,
              height: 48,
              buttonColor: AppTheme.lightCyanColor,
              textColor: AppTheme.whiteColor,
              textSize: 16,
              onTap: (){
                if(controller.text.isEmpty){
                  print("enter otp");
                }else{
                  authController.verifyEmailRegisteredUser(controller.text);
                }
              },
            ),

            const SizedBox(height: 16),

            Center(
              child: GestureDetector(
                onTap: _resendCode,
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.f16W400SIColorTextStyle,
                    children: [
                      TextSpan(
                        text: 'Resend code ',
                        style: AppTextStyle.f16W400SColorTextStyle.copyWith(
                            color: _secondsRemaining == 0
                                ? AppTheme.lightCyanColor
                                : AppTheme.silverColor,
                        ),
                      ),
                      TextSpan(
                        text: '$_secondsRemaining seconds',
                        style: AppTextStyle.f16W400DPColorTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
