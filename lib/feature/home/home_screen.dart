import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/home/widget/widget_popular.dart';
import 'package:feet_finder_workout/feature/home/widget/widget_special.dart';
import 'package:feet_finder_workout/feature/plan/widget/widget_plan_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Plan',
                  style: AppTextStyles.s19W700(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: WidgetPlanContainer(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Popular workout',
                  style: AppTextStyles.s19W700(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: SizedBox(
                  height: 124,
                  child: Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => WidgetPopular(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemCount: 6,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Special for you',
                  style: AppTextStyles.s19W700(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => WidgetSpecial(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: 6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
