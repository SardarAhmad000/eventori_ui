import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../constants/app_text_style.dart';
import '../../../../onboarding/widgets/build_header.dart';
import '../../home/widgets/custom_category_tab_bar.dart';
import '../widgets/custom_task_card.dart';

class TasksDashboardScreen extends StatefulWidget {
  const TasksDashboardScreen({super.key});

  @override
  State<TasksDashboardScreen> createState() => _TasksDashboardScreenState();
}

class _TasksDashboardScreenState extends State<TasksDashboardScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.paperWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              backgroundColor: AppTheme.whiteColor,
              arrowColor: AppTheme.blackColor,
              containerBackgroundColor: AppTheme.whiteColor,
              borderColor: AppTheme.lightGrayishColor,
              showLogo: true,
            ),
            const SizedBox(height: 16),
            Text(
              'Tasks',
              style: AppTextStyle.f32W600DPColorTextStyle,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: CustomCategoryTabBar(
                  categories: const ['All tasks', 'Completed', 'Pending'],
                  initialIndex: 0,
                  onCategorySelected: (index) {

                  },
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ListView.builder(
                  shrinkWrap: false, // Set to false for better performance
                  padding: EdgeInsets.zero,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return const TaskCard(
                      title: 'Confirm venue',
                      deadline: '25 Sept*',
                      completedDate: '20 Sept',
                      status: 'Pending',
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




//     TaskCard(
//     title: 'Catering Finalization',
//     deadline: '18 Sept',
//     status: 'Pending',
//   ),