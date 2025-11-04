import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/aap_assets.dart';
import '../../../../../constants/app_text_style.dart';

class BlockVendorBottomSheet {
  static void show(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Block this vendor?',
                    style: AppTextStyle.f16W500BColorTextStyle,
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.dividerColor,
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
              Container(
                width: double.infinity,
                height: 124,
                decoration: BoxDecoration(
                  color: AppTheme.dividerColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'This person won\'t be able to message or call you. They won\'t know you blocked or reported them',
                        style: AppTextStyle.font14W400SGColorTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'If you block and report, the last 5 messages in this chat will also be sent to WhatsApp.***',
                        style: AppTextStyle.font14W400SGColorTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  print('Block and report pressed');
                  // Add your block and report logic here
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Block and report',
                          style: AppTextStyle.f14W400RColorTextStyle,
                        ),
                        const Spacer(),
                        Image.asset(
                          AppAssets.reportIcon,
                          color: AppTheme.redColor,
                          width: 18,
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('Block pressed');
                  // Add your block logic here
                  Navigator.pop(context);
                },
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Block',
                          style: AppTextStyle.f14W400RColorTextStyle,
                        ),
                        const Spacer(),
                        Image.asset(
                          AppAssets.blockIcon,
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