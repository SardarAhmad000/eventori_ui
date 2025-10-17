import 'dart:async';
import 'package:eventori/view/auth/widget/pin_code_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/widgets/app_theme.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/custom_button.dart';
import '../../onboarding/widgets/build_header.dart';
import '../widget/otp_Input_widget.dart'; // Your updated OTP widget file

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {

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

  /// Starts countdown timer for resend OTP
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

  /// Logic for resending OTP
  void _resendCode() {
    setState(() {
      _secondsRemaining = 53;
    });
    _startTimer();

    // // 🔹 Add your resend OTP API call here
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(content: Text('A new OTP has been sent.')),
    // );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
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
              borderColor: AppTheme.backArrowBorderColor,
              showLogo: true,
            ),

            const SizedBox(height: 20),
            Text('Verify your account', style: AppTextStyle.TitleStyle),
            const SizedBox(height: 8),
            Text(
              'We\'ve sent a 5-digit code to your email. Please enter it below to reset your password.',
              style: AppTextStyle.SubtitleStyle,
            ),
            const SizedBox(height: 32),

            /// 🔹 OTP Input Field
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
            //   key: otpKey,
            //   otpLength: 5,
            //   onCompleted: (otp) {
            //     debugPrint("Entered OTP: $otp");
            //   },
            // ),

            const SizedBox(height: 24),

            /// 🔹 Verify Button
            CustomButton(
              Text: 'Verify code',
              width: double.infinity,
              height: 48,
              buttonColor: AppTheme.buttonCyanColor,
              textColor: AppTheme.whiteColor,
              textSize: 16,
              onTap: (){

              },
            ),

            const SizedBox(height: 16),

            /// 🔹 Resend OTP Section
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
                              ? AppTheme.buttonCyanColor
                              : AppTheme.textGreyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '$_secondsRemaining seconds',
                        style: AppTextStyle.secondtextStyle,
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
