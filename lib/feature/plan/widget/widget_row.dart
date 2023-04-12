import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetRow extends StatelessWidget {
  const WidgetRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
            imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
            placeholder: (_, url) {
              return SizedBox(
                width: 124,
                height: 160,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.4),
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              );
            },
            imageBuilder: (_, imageProvider) {
              return Container(
                width: 124,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://autodmir.ru/logo/1/2312/photo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1",
              style: AppTextStyles.s19W700(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "Workout plan for \nbeginners",
              style: AppTextStyles.s19W700(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              "4 min",
              style: AppTextStyles.s15W700(color: AppColors.colorFF2ECFPink),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 60),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StartScreen(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.colorFF2ECFPink,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Start",
                      style: AppTextStyles.s15W700(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
