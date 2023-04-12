import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/workout/widget/widget_row_workout.dart';
import 'package:feet_finder_workout/feature/workout/widget/widget_workout_container.dart';
import 'package:feet_finder_workout/logic/blocs/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:feet_finder_workout/widgets/app_error_text.dart';
import 'package:feet_finder_workout/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWorkoutsCubit()..getWorkouts('Cardio'),
      child: Scaffold(
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
                Builder(
                  builder: (context) => Row(
                    children: [
                      WidgetWorkoutConatiner(
                        isActive: activeIndex == 0,
                        text: 'Cardio',
                        onTap: () {
                          setState(() {
                            activeIndex = 0;
                            context
                                .read<GetWorkoutsCubit>()
                                .getWorkouts('Cardio');
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      WidgetWorkoutConatiner(
                        isActive: activeIndex == 1,
                        text: 'Strength',
                        onTap: () {
                          setState(() {
                            activeIndex = 1;
                            context
                                .read<GetWorkoutsCubit>()
                                .getWorkouts('Strength');
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      WidgetWorkoutConatiner(
                        isActive: activeIndex == 2,
                        text: 'Flexibility',
                        onTap: () {
                          setState(() {
                            activeIndex = 2;
                            context
                                .read<GetWorkoutsCubit>()
                                .getWorkouts('Flexibility');
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<GetWorkoutsCubit, GetWorkoutsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          itemBuilder: (context, index) => WidgetWorkoutRow(
                            model: model[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemCount: model.length,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
