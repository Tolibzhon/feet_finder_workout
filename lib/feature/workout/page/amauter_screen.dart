import 'package:feet_finder_workout/feature/workout/widget/widget_row_workout.dart';
import 'package:flutter/material.dart';

class AmauterScreen extends StatelessWidget {
  const AmauterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => WidgetWorkoutRow(),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemCount: 6,
          ),
        ),
      ),
    );
  }
}
