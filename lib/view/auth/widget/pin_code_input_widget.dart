import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:eventori/AppTheme/widgets/app_theme.dart';
import '../../../constants/app_text_style.dart';

class PinCodeInputWidget extends StatefulWidget {
  final int length;
  final Function(String) onChanged;
  final Function(String) onCompleted;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;

  const PinCodeInputWidget({
    super.key,
    this.length = 5,
    required this.onChanged,
    required this.onCompleted,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.number,
  });

  @override
  // Return the now-public state type
  State<PinCodeInputWidget> createState() => PinCodeInputWidgetState();
}

// NOTE: made public (no leading underscore)
class PinCodeInputWidgetState extends State<PinCodeInputWidget> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  StreamController<ErrorAnimationType>? _errorController;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _errorController?.close();
    super.dispose();
  }

  // Expose current PIN as public getter
  String get currentPin => _controller.text;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: widget.length,
      obscureText: widget.obscureText,
      animationType: AnimationType.none,
      cursorColor: AppTheme.cyanColor,
      keyboardType: widget.keyboardType,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 60,
        borderWidth: 1,
        activeColor: AppTheme.textfieldBorderColor,
        inactiveColor: AppTheme.textfieldBorderColor,
        selectedColor: AppTheme.cyanColor,
        activeFillColor: AppTheme.whiteColor,
        inactiveFillColor: AppTheme.whiteColor,
        selectedFillColor: AppTheme.whiteColor,
        errorBorderColor: AppTheme.redColor,
      ),
      enableActiveFill: true,
      controller: _controller,
      focusNode: _focusNode,
      onChanged: (String value) {
        setState(() {
          _errorText = null; // Clear previous error while typing
        });
        widget.onChanged(value);
      },
      onCompleted: (String value) {
        widget.onCompleted(value);
        _focusNode.unfocus();
      },
      validator: widget.validator,
      errorAnimationController: _errorController,
    );
  }

  /// Method to get current PIN value
  String getCurrentPin() {
    return _controller.text;
  }

  /// Method to validate PIN
  bool validatePin() {
    if (_controller.text.isEmpty || _controller.text.length < widget.length) {
      setState(() {
        _errorText = 'Please enter a valid ${widget.length}-digit code';
      });
      showErrorAnimation();
      return false;
    }
    return true;
  }

  /// Method to clear PIN
  void clearPin() {
    _controller.clear();
    setState(() {
      _errorText = null;
    });
  }

  /// Method to show error animation
  void showErrorAnimation() {
    _errorController?.add(ErrorAnimationType.shake);
  }
}