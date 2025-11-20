import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../../AppTheme/app_theme.dart';

// Reusable Countdown Card Widget
class CountdownCard extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final DateTime targetDate;
  final double height;
  final BorderRadius? borderRadius;
  final bool isNetworkImage;

  const CountdownCard({
    Key? key,
    required this.title,
    required this.backgroundImage,
    required this.targetDate,
    this.height = 132,
    this.borderRadius,
    this.isNetworkImage = false,
  }) : super(key: key);

  @override
  State<CountdownCard> createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _remainingTime = widget.targetDate.difference(DateTime.now());
      if (_remainingTime.isNegative) {
        _remainingTime = Duration.zero;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _remainingTime.inDays;
    final hours = _remainingTime.inHours % 24;
    final minutes = _remainingTime.inMinutes % 60;

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
        image: DecorationImage(
          image: widget.isNetworkImage
              ? NetworkImage(widget.backgroundImage)
              : AssetImage(widget.backgroundImage) as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppTheme.blackColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: AppTextStyle.f20W500WColorTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Days
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.textfieldBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            days.toString().padLeft(2, '0'),
                            style: AppTextStyle.f20W500WColorTextStyle,
                          ),
                        ),
                      ),
                      Text(
                        'Days',
                        style: AppTextStyle.f18W400WColorTextStyle,
                      ),
                    ],
                  ),
                  // Separator
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Hours
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.textfieldBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            hours.toString().padLeft(2, '0'),
                            style: AppTextStyle.f20W500WColorTextStyle,
                          ),
                        ),
                      ),
                      Text(
                        'Hours',
                        style: AppTextStyle.f18W400WColorTextStyle,
                      ),
                    ],
                  ),
                  // Separator
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Minutes
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.textfieldBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            minutes.toString().padLeft(2, '0'),
                            style: AppTextStyle.f20W500WColorTextStyle,
                          ),
                        ),
                      ),
                      Text(
                        'Minutes',
                        style: AppTextStyle.f18W400WColorTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}