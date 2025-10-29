import 'package:flutter/material.dart';

import '../AppTheme/app_theme.dart';

class CustomToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color thumbColor;
  final double width;
  final double height;

   CustomToggleSwitch({
    Key? key,
    this.initialValue = false,
    this.onChanged,
     required this.activeColor,
    required this.inactiveColor,
    this.thumbColor = Colors.white,
    this.width = 36,
    this.height = 20,
  }) : super(key: key);

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool _isToggled;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.initialValue;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (_isToggled) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSwitch() {
    setState(() {
      _isToggled = !_isToggled;
      if (_isToggled) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
      widget.onChanged?.call(_isToggled);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: Color.lerp(
                widget.inactiveColor,
                widget.activeColor,
                _animation.value,
              ),
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            padding:  EdgeInsets.all(2),
            child: Align(
              alignment: Alignment.lerp(
                Alignment.centerLeft,
                Alignment.centerRight,
                _animation.value,
              )!,
              child: Container(
                width: widget.height - 4,
                height: widget.height - 4,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.blackColor.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}