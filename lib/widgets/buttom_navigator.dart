import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/feature/home/home_screen.dart';
import 'package:feet_finder_workout/feature/plan/plan_screen.dart';
import 'package:feet_finder_workout/feature/settings/settings_screen.dart';
import 'package:feet_finder_workout/feature/statistics/statistics_screen.dart';
import 'package:feet_finder_workout/feature/workout/workout_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColors.color530AA2Purple,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white.withOpacity(0.5),
          currentIndex: index,
          onTap: (indexFrom) {
            setState(() {
              index = indexFrom;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarHomeActive,
                height: 40,
              ),
              icon: Image.asset(
                AppImages.navbarHome,
                height: 40,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarWorkoutActive,
                height: 40,
              ),
              icon: Image.asset(
                AppImages.navbarWorkout,
                height: 40,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarPlanActive,
                height: 40,
              ),
              icon: Image.asset(
                AppImages.navbarPlan,
                height: 40,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarStatisticsActive,
                height: 40,
              ),
              icon: Image.asset(
                AppImages.navbarStatistics,
                height: 40,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                AppImages.navbarSettingsActive,
                height: 40,
              ),
              icon: Image.asset(
                AppImages.navbarSettings,
                height: 40,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const WorkoutScreen(),
  const PlanScreen(),
  const StatisticsScreen(),
  const SettingsScreen(),
];
