import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetWorkoutConatiner extends StatelessWidget {
  const WidgetWorkoutConatiner({
    required this.isActive,
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        height: 26,
        decoration: BoxDecoration(
          color: isActive ? AppColors.colorFF2ECFPink : AppColors.grey,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          text,
          style: AppTextStyles.s13W700(
            color: isActive ? Colors.white : AppColors.color530AA2Purple,
          ),
        ),
      ),
    );
  }
}
