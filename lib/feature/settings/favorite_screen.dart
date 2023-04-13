import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/workout/widget/widget_row_workout.dart';
import 'package:feet_finder_workout/logic/blocs/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:feet_finder_workout/widgets/app_error_text.dart';
import 'package:feet_finder_workout/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Favourite",
          style: AppTextStyles.s19W700(color: Colors.black),
        ),
      ),
      body: BlocProvider(
        create: (context) => GetWorkoutsCubit()..getFavoriteWorkouts(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
      ),
    );
  }
}
