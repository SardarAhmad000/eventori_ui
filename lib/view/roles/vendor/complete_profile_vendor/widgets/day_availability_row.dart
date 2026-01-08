import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_checkbox.dart';

class DayAvailabilityRow extends StatefulWidget {
  final String day;
  final bool initialIsAvailable;
  final String initialFrom;
  final String initialTo;
  final Function(bool isAvailable, String from, String to) onChanged;
  final String? validationError;

  const DayAvailabilityRow({
    super.key,
    required this.day,
    required this.initialIsAvailable,
    required this.initialFrom,
    required this.initialTo,
    required this.onChanged,
    this.validationError,
  });

  @override
  State<DayAvailabilityRow> createState() => _DayAvailabilityRowState();
}

class _DayAvailabilityRowState extends State<DayAvailabilityRow> {
  late bool isAvailable;
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isAvailable = widget.initialIsAvailable;
    fromController = TextEditingController(text: widget.initialFrom);
    toController = TextEditingController(text: widget.initialTo);
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: widget.validationError != null
                  ? Border.all(color: Colors.red, width: 1)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CustomCheckbox(
                    initialValue: isAvailable,
                    onChanged: (value) {
                      setState(() {
                        isAvailable = value;
                      });
                      widget.onChanged(isAvailable, fromController.text, toController.text);
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.day,
                      style: AppTextStyle.f16W400SColorTextStyle,
                    ),
                  ),
                  if (isAvailable) ...[
                    Container(
                      width: 82,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.validationError != null
                              ? Colors.red
                              : AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: fromController,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          style: AppTextStyle.f14W400BColorTextStyle,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'From',
                            hintStyle: AppTextStyle.f14W400SColorTextStyle,
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              fromController.text = pickedTime.format(context);
                              widget.onChanged(isAvailable, fromController.text, toController.text);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 82,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.validationError != null
                              ? Colors.red
                              : AppTheme.textfieldBorderColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          controller: toController,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          style: AppTextStyle.f14W400BColorTextStyle,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'To',
                            hintStyle: AppTextStyle.f14W400SColorTextStyle,
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          onTap: () async {
                            final TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              toController.text = pickedTime.format(context);
                              widget.onChanged(isAvailable, fromController.text, toController.text);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (widget.validationError != null)
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 4),
              child: Text(
                widget.validationError!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}