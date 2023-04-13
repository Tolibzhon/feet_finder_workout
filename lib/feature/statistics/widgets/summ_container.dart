import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class SummContainerWidget extends StatelessWidget {
  const SummContainerWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.color530AA2Purple,
      ),
      child: Text(
        text,
        style: AppTextStyles.s15W700(
          color: Colors.white,
        ),
      ),
    );
  }
}
