import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/auth/premium_screen.dart';
import 'package:feet_finder_workout/config/check_premium.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/widgets/custom_button.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailWorkoutScreen extends StatefulWidget {
  const DetailWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<DetailWorkoutScreen> createState() => _DetailWorkoutScreenState();
}

class _DetailWorkoutScreenState extends State<DetailWorkoutScreen> {
  bool onActive = false;
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
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                onActive = !onActive;
              });
            },
            child: Image.asset(
              onActive ? AppImages.saveActiveIcon : AppImages.saveIcon,
              width: 13,
            ),
          ),
          const SizedBox(width: 24),
        ],
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
          FutureBuilder(
              future: CheckPremium.getSubscription(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Sed ut perspiciatis unde omnis iste",
                        textAlign: TextAlign.left,
                        style: AppTextStyles.s15W400(color: Colors.black),
                      ),
                    );
                  }
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Image.asset(
                        AppImages.lockIcon,
                        width: 56,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Need Premium access",
                        style: AppTextStyles.s19W700(),
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PremiumScreen(isPop: true),
                            ),
                          );
                        },
                        icon: AppImages.crownIcon,
                        text: "Buy Premium for \$0,99",
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
