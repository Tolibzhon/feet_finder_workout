import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/local_db.dart';
import 'package:feet_finder_workout/feature/statistics/widgets/summ_container.dart';
import 'package:flutter/material.dart';

class WidgetTimesGraphicConatiner extends StatelessWidget {
  const WidgetTimesGraphicConatiner({
    Key? key,
    required this.onTap,
    required this.isActive,
    required this.date,
  }) : super(key: key);
  final Function() onTap;
  final bool isActive;
  final String date;

  @override
  Widget build(BuildContext context) {
    List<String> datesBy = [];
    SavedData.getDates().then((value) => datesBy.addAll(value));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        isActive
            ? FutureBuilder(
                future: SavedData.getTimes(),
                builder: (context, AsyncSnapshot<List<String>?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      int summCalories = 0;

                      for (var i = 0; i < datesBy.length; i++) {
                        if (datesBy[i] == date) {
                          summCalories += int.parse(snapshot.data![i]);
                        }
                      }
                      return SummContainerWidget(text: summCalories.toString());
                    } else {
                      return const SummContainerWidget(text: '0');
                    }
                  }
                  return const SummContainerWidget(text: '0');
                },
              )
            : const SizedBox(),
        const SizedBox(height: 5),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: 20,
            height: isActive ? 180 : 90,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  AppColors.color530AA2Purple,
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}
