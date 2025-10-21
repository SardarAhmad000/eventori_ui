import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../AppTheme/widgets/app_theme.dart';
import 'app_fonts.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.Text,
    this.width,
    this.height,
    this.textSize,
    this.maxlines,
    this.iconHeight,
    this.onTap,
    this.buttonColor,
    this.buttonName,
    this.textColor,
    this.fontFamily,
    this.decoration,
    this.borderColor,
    this.isAuth,
    this.isGoogle,
    this.isOnBoarding,
    this.onBoardingText,
    this.iconPath,
    this.iconColor,
  });

  final String Text;
  final String? iconPath;
  final Color? iconColor;
  final String? fontFamily;
  final String? buttonName;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? iconHeight;
  final double? textSize;
  final int? maxlines;
  final Function()? onTap;
  final Color? buttonColor;
  final Color? borderColor;
  final Decoration? decoration;
  final bool? isAuth;
  final bool? isGoogle;
  final bool? isOnBoarding;
  final Widget? onBoardingText;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 48,
        width: widget.width,
        decoration: widget.decoration ??
            BoxDecoration(
              color: widget.buttonColor ?? AppTheme.lightCyanColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 1.3,
                color: widget.borderColor ?? AppTheme.lightCyanColor,
              ),
            ),
        child: Center(
          child: widget.isAuth == null
              ? Text(
            widget.Text,
            maxLines: widget.maxlines,
            style: TextStyle(
              color: widget.textColor ?? AppTheme.greyColor,
              fontSize: widget.textSize ?? 16,
              fontWeight: FontWeight.w400,
            ),
          )
              : widget.isOnBoarding == true
              ? widget.onBoardingText
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.iconPath != null)
                Image.asset(
                  widget.iconPath!,
                  height: widget.iconHeight ?? 18,
                  color: widget.iconColor,
                ),
              if (widget.iconPath != null)
                const SizedBox(width: 8),
              Text(
                widget.Text,
                maxLines: widget.maxlines,
                style: TextStyle(
                  color: widget.textColor ?? AppTheme.greyColor,
                  fontSize: widget.textSize ?? 16,
                  fontFamily: widget.fontFamily ?? AppFonts.medium,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}