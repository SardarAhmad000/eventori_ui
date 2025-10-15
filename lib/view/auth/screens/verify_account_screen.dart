import 'package:flutter/material.dart';
import 'package:eventori/AppTheme/widgets/app_theme.dart';
import 'dart:async';

import '../../../constants/app_text_style.dart';
import '../../../constants/custom_button.dart';
import '../../onboarding/widgets/build_header.dart';
import '../widget/otp_Input_widget.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
    5,
        (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    5,
        (index) => FocusNode(),
  );

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
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
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
    // Add your resend code logic here
  }

  void _verifyCode() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 5) {
      print('OTP: $otp');

    } else {

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Please enter complete code')),
      // );
    }
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
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.backArrowBorderColor,
              showLogo: true,
            ),
            const SizedBox(height: 20),
            Text(
              'Verify your account',
              style: AppTextStyle.addProfileTitleStyle,
            ),
            const SizedBox(height: 8),
            Text(
              'We\'ve sent a 5-digit code to your email. Please enter it below to reset your password.',
              style: AppTextStyle.addProfileSubtitleStyle,
            ),
            const SizedBox(height: 32),

            // OTP Input Fields
            OtpInputField(
              otpLength: 5,
              onCompleted: (otp) {
                debugPrint("Entered OTP: $otp");
              },
            ),

            const SizedBox(height: 24),

            // Verify Button
            CustomButton(
              Text: 'Verify code',
              width: double.infinity,
              height: 48,
              buttonColor: AppTheme.buttonCyanColor,
              textColor: Colors.white,
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
                    style: AppTextStyle.addProfileSubtitleStyle,
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