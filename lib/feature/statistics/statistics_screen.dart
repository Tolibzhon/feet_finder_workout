import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/core/date_formats.dart';
import 'package:feet_finder_workout/feature/statistics/widgets/widget_calories_grafic_container.dart';
import 'package:feet_finder_workout/feature/statistics/widgets/widget_times_grafic_container.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  final dates = <String>[
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 7,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 6,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 5,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 4,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 3,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 2,
      ),
    ),
    dayMont.format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
    ),
    dayMont.format(
      DateTime.now(),
    ),
  ];
  ////////

  String caloriDate = dayMont.format(
    DateTime.now(),
  );
  String timeDate = dayMont.format(
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Statistics',
                style: AppTextStyles.s19W700(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Text(
                'Calories:',
                style: AppTextStyles.s19W700(
                  color: AppColors.colorFF2ECFPink,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: dates
                      .map((e) => Row(
                            children: [
                              Column(
                                children: [
                                  WidgetCaloriesGraphicConatiner(
                                    date: caloriDate,
                                    onTap: () {
                                      setState(() {
                                        caloriDate = e;
                                      });
                                    },
                                    isActive: caloriDate == e,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(e),
                                ],
                              ),
                              const SizedBox(width: 12),
                            ],
                          ))
                      .toList(),
                ),
              ),
              const Spacer(),
              Text(
                'Times:',
                style: AppTextStyles.s19W700(
                  color: AppColors.colorFF2ECFPink,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: dates
                      .map((e) => Row(
                            children: [
                              Column(
                                children: [
                                  WidgetTimesGraphicConatiner(
                                    date: timeDate,
                                    onTap: () {
                                      setState(() {
                                        timeDate = e;
                                      });
                                    },
                                    isActive: timeDate == e,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(e),
                                ],
                              ),
                              const SizedBox(width: 12),
                            ],
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
