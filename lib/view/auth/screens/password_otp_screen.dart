import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../../constants/app_text_style.dart';
import '../../../app_widgets/custom_button.dart';
import '../../../routes/app_routes.dart';
import '../../onboarding/widgets/build_header.dart';
import '../widget/pin_code_input_widget.dart';

class PasswordOTPScreen extends StatefulWidget {
  const PasswordOTPScreen({super.key});

  @override
  State<PasswordOTPScreen> createState() => PasswordOTPScreenState();
}

class PasswordOTPScreenState extends State<PasswordOTPScreen> {
  // final GlobalKey<OtpInputFieldState> _otpFieldKey = GlobalKey();

  int _secondsRemaining = 53;
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
      _secondsRemaining = 53;
    });
    _startTimer();
    // TODO: Add resend code logic here (e.g., API call)
    debugPrint("Resend OTP triggered");
  }

  void _verifyCode() {
      Get.toNamed(AppRoutes.createNewPasswordScreen);
    // }
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
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),
            const SizedBox(height: 20),
            Text(
              'Verify your account',
              style: AppTextStyle.TitleStyle,
            ),
            const SizedBox(height: 8),
            Text(
              'We\'ve sent a 5-digit code to your email. Please enter it below to reset your password.',
              style: AppTextStyle.SubtitleStyle,
            ),
            const SizedBox(height: 32),

            // OTP Input Fields

            PinCodeInputWidget(
              // key: otpKey,
                length: 5,
                onChanged: (value){

                },
                onCompleted: (value){
                  debugPrint("Entered OTP: $value");

                }
            ),


            // OtpInputField(
            //   key: _otpFieldKey,
            //   otpLength: 5,
            //   onCompleted: (otp) {
            //     debugPrint("OTP Completed: $otp");
            //   },
            // ),

            const SizedBox(height: 24),

            // Verify Button
            CustomButton(
              Text: 'Verify code',
              width: double.infinity,
              height: 48,
              buttonColor: AppTheme.lightCyanColor,
              textColor: AppTheme.whiteColor,
              textSize: 16,
              onTap: _verifyCode,
            ),

            const SizedBox(height: 16),

            // Resend Code
            Center(
              child: GestureDetector(
                onTap: _secondsRemaining == 0 ? _resendCode : null,
                child: RichText(
                  text: TextSpan(
                    style: AppTextStyle.SubtitleStyle,
                    children: [
                      TextSpan(
                        text: 'Resend code ',
                        style: TextStyle(
                          color: _secondsRemaining == 0
                              ? AppTheme.lightCyanColor
                              : AppTheme.silverColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: _secondsRemaining > 0
                            ? '$_secondsRemaining seconds'
                            : '',
                        style: AppTextStyle.font16W400DPColorStyle,
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
