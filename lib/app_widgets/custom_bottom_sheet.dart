import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    required List<String> descriptionTexts,
    required String primaryActionText,
    required VoidCallback onPrimaryAction,
    String secondaryActionText = 'Cancel',
    VoidCallback? onSecondaryAction,
    String? primaryActionIcon,
    String? secondaryActionIcon,
    Color? primaryActionTextColor,
    Color? secondaryActionTextColor,
    Color? primaryActionIconColor,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with title and close button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyle.f16W500BColorTextStyle,
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.textfieldBorderColor,
                    ),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          AppAssets.closeIcon,
                          color: AppTheme.blackColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Description container
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.textfieldBorderColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: descriptionTexts.asMap().entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: entry.key < descriptionTexts.length - 1 ? 8.0 : 0,
                        ),
                        child: Text(
                          entry.value,
                          style: AppTextStyle.f14W400SGColorTextStyle,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Primary action button
              InkWell(
                onTap: () {
                  onPrimaryAction();
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.textfieldBorderColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            primaryActionText,
                            style: (primaryActionTextColor != null
                                ? AppTextStyle.f14W400RColorTextStyle.copyWith(
                                color: primaryActionTextColor)
                                : AppTextStyle.f14W400RColorTextStyle),
                          ),
                        ),
                        if (primaryActionIcon != null)
                          Image.asset(
                            primaryActionIcon,
                            color: primaryActionIconColor ?? AppTheme.redColor,
                            width: 18,
                            height: 18,
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Secondary action button
              InkWell(
                onTap: () {
                  if (onSecondaryAction != null) {
                    onSecondaryAction();
                  }
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.textfieldBorderColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            secondaryActionText,
                            style: (secondaryActionTextColor != null
                                ? AppTextStyle.f14W400RColorTextStyle.copyWith(
                                color: secondaryActionTextColor)
                                : AppTextStyle.f14W400RColorTextStyle),
                          ),
                        ),
                        if (secondaryActionIcon != null)
                          Image.asset(
                            secondaryActionIcon,
                            width: 20,
                            height: 20,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}