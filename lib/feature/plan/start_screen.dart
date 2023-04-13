import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/logic/model/plan_model.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key, required this.model}) : super(key: key);
  final Workouts model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          model.title,
          style: AppTextStyles.s19W700(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: model.image,
              placeholder: (_, url) {
                return SizedBox(
                  width: getWidth(context),
                  height: 400,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.4),
                    highlightColor: Colors.white,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              imageBuilder: (_, imageProvider) {
                return Stack(
                  children: [
                    Container(
                      width: getWidth(context),
                      height: 400,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(model.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: Text(
                          model.duration,
                          style: AppTextStyles.s15W700(
                              color: AppColors.colorFF2ECFPink),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 56,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: Text(
                          '${model.calories} calories',
                          style: AppTextStyles.s15W700(
                              color: AppColors.colorFF2ECFPink),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                model.description,
                textAlign: TextAlign.left,
                style: AppTextStyles.s15W400(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
