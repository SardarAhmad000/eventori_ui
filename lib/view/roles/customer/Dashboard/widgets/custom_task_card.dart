import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../AppTheme/app_theme.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String deadline;
  final String? completedDate;
  final String status;

  const TaskCard({
    Key? key,
    required this.title,
    required this.deadline,
    this.completedDate,
    required this.status,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppTheme.greenColor;
      case 'pending':
        return AppTheme.yellowColor;
      default:
        return AppTheme.blackColor;
    }
  }

  Color _getStatusBackgroundColor() {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppTheme.greenColor.withOpacity(.1);
      case 'pending':
        return AppTheme.yellowColor.withOpacity(.1);
      default:
        return AppTheme.whiteColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.textfieldBorderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.f14W500BColorTextStyle
                ),
                const SizedBox(height: 6),
                Text(
                  completedDate != null
                      ? 'Deadline: $deadline / Completed on $completedDate'
                      : '(Completed on $deadline)',
                  style: AppTextStyle.f12W400SGColorTextStyle,
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _getStatusBackgroundColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style:AppTextStyle.f10W500GColorTextStyle.copyWith(color: _getStatusColor()),
            ),
          ),
        ],
      ),
    );
  }
}
