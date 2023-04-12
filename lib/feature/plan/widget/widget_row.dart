import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/start_screen.dart';
import 'package:feet_finder_workout/logic/model/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetRow extends StatelessWidget {
  const WidgetRow({Key? key, required this.model, required this.index})
      : super(key: key);
  final Workouts model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              index.toString(),
              style: AppTextStyles.s19W700(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              model.title,
              style: AppTextStyles.s19W700(color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              model.duration,
              style: AppTextStyles.s15W700(color: AppColors.colorFF2ECFPink),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 60),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(
                          model: model,
                        ),
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
