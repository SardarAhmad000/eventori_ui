// import 'package:flutter/material.dart';
// import '../../../AppTheme/widgets/app_theme.dart';
// import '../../../constants/custom_validators.dart';
//
// class OtpInputField extends StatefulWidget {
//   final int otpLength;
//   final Function(String) onCompleted;
//
//   const OtpInputField({
//     super.key,
//     this.otpLength = 5,
//     required this.onCompleted,
//   });
//
//   @override
//   // return the now-public state type
//   State<OtpInputField> createState() => OtpInputFieldState();
// }
//
// // NOTE: made public (no leading underscore)
// class OtpInputFieldState extends State<OtpInputField> {
//   late List<TextEditingController> _otpControllers;
//   late List<FocusNode> _focusNodes;
//   String? _errorText;
//
//   @override
//   void initState() {
//     super.initState();
//     _otpControllers =
//         List.generate(widget.otpLength, (index) => TextEditingController());
//     _focusNodes = List.generate(widget.otpLength, (index) => FocusNode());
//   }
//
//   @override
//   void dispose() {
//     for (var controller in _otpControllers) {
//       controller.dispose();
//     }
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }
//
//   // expose current OTP as public getter
//   String get currentOtp => _otpControllers.map((c) => c.text).join();
//
//   void _onOtpChange() {
//     final otp = currentOtp;
//     setState(() {
//       _errorText = null; // clear previous error while typing
//     });
//
//     if (otp.length == widget.otpLength) {
//       // unfocus all when complete
//       FocusScope.of(context).unfocus();
//
//       widget.onCompleted(otp);
//     }
//   }
//
//   /// Public method to validate OTP (callable from parent via key)
//   bool validateOtp() {
//     final otp = currentOtp;
//     final error = CustomValidator.otpRequired(otp, widget.otpLength);
//
//     setState(() {
//       _errorText = error;
//     });
//
//     return error == null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: List.generate(widget.otpLength, (index) {
//             return SizedBox(
//               width: 60,
//               height: 60,
//               child: TextField(
//                 controller: _otpControllers[index],
//                 focusNode: _focusNodes[index],
//                 textAlign: TextAlign.center,
//                 keyboardType: TextInputType.number,
//                 maxLength: 1,
//                 style: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 decoration: InputDecoration(
//                   counterText: '',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(
//                       color: AppTheme.textfieldBorderColor,
//                       width: 1,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide(
//                       color: AppTheme.buttonCyanColor,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   if (value.isNotEmpty && index < widget.otpLength - 1) {
//                     _focusNodes[index + 1].requestFocus();
//                   } else if (value.isEmpty && index > 0) {
//                     _focusNodes[index - 1].requestFocus();
//                   }
//                   _onOtpChange();
//                 },
//               ),
//             );
//           }),
//         ),
//         if (_errorText != null)
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               _errorText!,
//               style: const TextStyle(color: Colors.red, fontSize: 14),
//             ),
//           ),
//       ],
//     );
//   }
// }
