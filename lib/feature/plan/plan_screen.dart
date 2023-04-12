import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/widget/widget_plan_container.dart';
import 'package:feet_finder_workout/logic/blocs/get_plans_cubit/get_plans_cubit.dart';
import 'package:feet_finder_workout/widgets/app_error_text.dart';
import 'package:feet_finder_workout/widgets/app_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetPlansCubit()..getPlans(),
      child: Scaffold(
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
                  child: BlocBuilder<GetPlansCubit, GetPlansState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        error: (error) => AppErrorText(error: error),
                        success: (model) => ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WidgetPlanContainer(
                            model: model[index],
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: model.length,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
