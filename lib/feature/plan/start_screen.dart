import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Workout plan for beginners",
          style: AppTextStyles.s19W700(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
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
                          image: NetworkImage(
                              "https://autodmir.ru/logo/1/2312/photo.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 20,
                      child: Container(
                        width: 70,
                        height: 32,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: Text(
                          "4 min",
                          style: AppTextStyles.s15W700(
                              color: AppColors.colorFF2ECFPink),
                        ),
                      ),
                    )
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Sed ut perspiciatis unde omnis iste",
              textAlign: TextAlign.left,
              style: AppTextStyles.s15W400(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
