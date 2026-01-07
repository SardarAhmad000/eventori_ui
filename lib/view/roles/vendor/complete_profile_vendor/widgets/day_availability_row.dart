import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_checkbox.dart';

class DayAvailabilityRow extends StatefulWidget {
  final String day;
  final bool initialIsAvailable;
  final String initialFrom;
  final String initialTo;
  final Function(bool isAvailable, String from, String to) onChanged;

  const DayAvailabilityRow({
    super.key,
    required this.day,
    required this.initialIsAvailable,
    required this.initialFrom,
    required this.initialTo,
    required this.onChanged,
  });

  @override
  State<DayAvailabilityRow> createState() => _DayAvailabilityRowState();
}

class _DayAvailabilityRowState extends State<DayAvailabilityRow> {
  late bool isAvailable;
  late TextEditingController fromController;
  late TextEditingController toController;

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

  void _notifyParent() {
    widget.onChanged(isAvailable, fromController.text, toController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CustomCheckbox(
            initialValue: isAvailable,
            onChanged: (value) {
              setState(() {
                isAvailable = value;
              });
              _notifyParent();
            },
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.day,
              style: TextStyle(
                color: AppTheme.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          if (isAvailable) ...[
            _buildTimeInput(
              hint: 'from',
              controller: fromController,
              onTimePicked: () => _notifyParent(),
            ),
            const SizedBox(width: 12),
            _buildTimeInput(
              hint: 'to',
              controller: toController,
              onTimePicked: () => _notifyParent(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTimeInput({
    required String hint,
    required TextEditingController controller,
    required VoidCallback onTimePicked,
  }) {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppTheme.lightGrayishColor,
          width: 1,
        ),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.blackColor,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppTheme.lightGrayishColor,
              fontSize: 14,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          onTap: () async {
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              controller.text = pickedTime.format(context);
              onTimePicked();
            }
          },
          readOnly: true,
        ),
      ),
    );
  }
}