import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/workout/detail_workout_screen.dart';
import 'package:feet_finder_workout/logic/model/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetSpecial extends StatelessWidget {
  const WidgetSpecial({Key? key, required this.model}) : super(key: key);
  final WorkoutModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailWorkoutScreen(
              model: model,
            ),
          ),
        );
      },
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: model.image,
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
                      image: NetworkImage(model.image),
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
                  model.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.s19W700(color: Colors.black),
                ),
                const SizedBox(height: 12),
                Text(
                  model.duration,
                  style:
                      AppTextStyles.s15W700(color: AppColors.colorFF2ECFPink),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
