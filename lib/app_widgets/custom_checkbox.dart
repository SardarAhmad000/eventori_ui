import 'package:flutter/material.dart';
import '../AppTheme/widgets/app_theme.dart';

class CustomCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String? label;
  final TextStyle? labelStyle;

  const CustomCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
    this.label,
    this.labelStyle,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void toggleCheck() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCheck,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: isChecked ? AppTheme.cyanColor : AppTheme.ashGreyColor,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: isChecked ? Colors.cyan : AppTheme.ashGreyColor,
                width: 1.2,
              ),
            ),
            child: isChecked
                ? Icon(
              Icons.check,
              color: AppTheme.whiteColor,
              size: 8,
            )
                : null,
          ),
          if (widget.label != null) ...[
            SizedBox(width: 5),
            Text(
              widget.label!,
              style: widget.labelStyle,
            ),
          ],
        ],
      ),
    );
  }
}
