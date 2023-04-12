import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/home/widget/widget_popular.dart';
import 'package:feet_finder_workout/feature/home/widget/widget_special.dart';
import 'package:feet_finder_workout/feature/plan/widget/widget_plan_container.dart';
import 'package:feet_finder_workout/logic/blocs/get_plans_cubit/get_plans_cubit.dart';
import 'package:feet_finder_workout/logic/blocs/get_workouts_cubit/get_workouts_cubit.dart';
import 'package:feet_finder_workout/widgets/app_error_text.dart';
import 'package:feet_finder_workout/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            BlocProvider(
              create: (context) => GetPlansCubit()..getPlans(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocBuilder<GetPlansCubit, GetPlansState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const AppIndicator(),
                      error: (error) => AppErrorText(error: error),
                      success: (model) => ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => WidgetPlanContainer(
                          model: model.first,
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: 1,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
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
            BlocProvider(
              create: (context) =>
                  GetWorkoutsCubit()..getWorkouts('Flexibility'),
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: SizedBox(
                  height: 124,
                  child: BlocBuilder<GetWorkoutsCubit, GetWorkoutsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              WidgetPopular(model: model[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemCount: 3,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
            Expanded(
              child: BlocProvider(
                create: (context) =>
                    GetWorkoutsCubit()..getWorkouts('Strength'),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: BlocBuilder<GetWorkoutsCubit, GetWorkoutsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WidgetSpecial(
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
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
