import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class WidgetSettingsRow extends StatelessWidget {
  const WidgetSettingsRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Image.asset(
                icon,
                width: 32,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: AppTextStyles.s15W700(color: Colors.black),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                color: Colors.black,
                size: 30,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
