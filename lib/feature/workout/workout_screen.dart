import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/workout/page/amauter_screen.dart';
import 'package:feet_finder_workout/feature/workout/page/beginner_screen.dart';
import 'package:feet_finder_workout/feature/workout/page/pro_screen.dart';
import 'package:feet_finder_workout/feature/workout/widget/widget_workout_container.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int activeIndex = 0;
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
                'Workout',
                style: AppTextStyles.s19W700(
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  WidgetWorkoutConatiner(
                    isActive: activeIndex == 0,
                    text: 'Beginner',
                    onTap: () {
                      setState(() {
                        activeIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  WidgetWorkoutConatiner(
                    isActive: activeIndex == 1,
                    text: 'Amauter',
                    onTap: () {
                      setState(() {
                        activeIndex = 1;
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  WidgetWorkoutConatiner(
                    isActive: activeIndex == 2,
                    text: 'Pro',
                    onTap: () {
                      setState(() {
                        activeIndex = 2;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: screns[activeIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> screns = [
    const BeginnerScreen(),
    const AmauterScreen(),
    const ProScreen(),
  ];
}
