import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/detail_plan_screen.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class WidgetPlanContainer extends StatelessWidget {
  const WidgetPlanContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailPlanScreen(),
          ),
        );
      },
      child: Container(
        width: getWidth(context),
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.colorFF2ECFPink.withOpacity(0.6),
            ],
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
          placeholder: (_, url) {
            return SizedBox(
              width: getWidth(context),
              height: 200,
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
            return Stack(
              children: [
                Container(
                  width: getWidth(context),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://autodmir.ru/logo/1/2312/photo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomCenter,
                  width: getWidth(context),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.transparent,
                        AppColors.colorFF2ECFPink.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "7 minute\nworkout",
                        style: AppTextStyles.s32W500(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "developed according to ACSM research, improves physical fitness",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.s15W400(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
