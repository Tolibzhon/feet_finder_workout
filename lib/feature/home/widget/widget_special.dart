import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/workout/detail_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetSpecial extends StatelessWidget {
  const WidgetSpecial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailWorkoutScreen(),
          ),
        );
      },
      child: Row(
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
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Workout plan for \nbeginners",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s19W700(color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  "4 min",
                  style:
                      AppTextStyles.s15W700(color: AppColors.colorFF2ECFPink),
                ),
              ],
            ),
          )
        ],
      ),
    );
    ;
  }
}
