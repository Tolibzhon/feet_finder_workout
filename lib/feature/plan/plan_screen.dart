import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/widget/widget_plan_container.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Plan',
                style: AppTextStyles.s19W700(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => WidgetPlanContainer(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
