import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/auth/premium_screen.dart';
import 'package:feet_finder_workout/config/check_premium.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/core/date_formats.dart';
import 'package:feet_finder_workout/core/local_db.dart';
import 'package:feet_finder_workout/core/local_liked_ds.dart';
import 'package:feet_finder_workout/logic/model/workout_model.dart';
import 'package:feet_finder_workout/widgets/buttom_navigator.dart';
import 'package:feet_finder_workout/widgets/custom_button.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:feet_finder_workout/widgets/styled_toasts.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailWorkoutScreen extends StatefulWidget {
  const DetailWorkoutScreen({Key? key, required this.model}) : super(key: key);
  final WorkoutModel model;

  @override
  State<DetailWorkoutScreen> createState() => _DetailWorkoutScreenState();
}

class _DetailWorkoutScreenState extends State<DetailWorkoutScreen> {
  late bool isLiked = widget.model.isLiked;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BackButton(),
                Expanded(
                  child: Text(
                    widget.model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s19W700(color: Colors.black),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    if (isLiked) {
                      await LocalLikedPosts.setLikedPost(
                          widget.model.id.toString());
                      widget.model.isLiked = true;
                    } else {
                      await LocalLikedPosts.deleteLikedPost(
                          widget.model.id.toString());
                      widget.model.isLiked = false;
                    }
                  },
                  child: Image.asset(
                    isLiked ? AppImages.saveActiveIcon : AppImages.saveIcon,
                    width: 13,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            CachedNetworkImage(
              imageUrl: widget.model.image,
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
                          image: NetworkImage(widget.model.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: Text(
                          widget.model.duration,
                          style: AppTextStyles.s15W700(
                              color: AppColors.colorFF2ECFPink),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 66,
                      left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(41),
                        ),
                        child: Text(
                          '${widget.model.calories} calories',
                          style: AppTextStyles.s15W700(
                              color: AppColors.colorFF2ECFPink),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
            FutureBuilder(
              future: CheckPremium.getSubscription(),
              builder: (context, AsyncSnapshot<bool?> snapshot) {
                if (snapshot.hasData) {
                  if (!snapshot.data! && widget.model.isPro) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Column(
                          children: [
                            const Spacer(),
                            Image.asset(
                              AppImages.lockIcon,
                              width: 56,
                            ),
                            const Spacer(),
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
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    );
                  }
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            widget.model.description,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.s15W400(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          FutureBuilder(
                            future: SavedData.getTitles(),
                            builder: (context,
                                AsyncSnapshot<List<String>?> snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data!
                                    .contains(widget.model.title)) {
                                  return const SizedBox();
                                }
                              }
                              return CustomButton(
                                text: 'Finish',
                                onPressed: () async {
                                  await SavedData.setCalosies(
                                    widget.model.calories,
                                  );
                                  await SavedData.setTimes(30);
                                  await SavedData.setTitles(
                                    widget.model.title,
                                  );
                                  await SavedData.setDates(
                                    dayMont.format(
                                      DateTime.now(),
                                    ),
                                  );
                                  showSuccessSnackBar('Finished');
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BottomNavigatorScreen(),
                                    ),
                                    (protected) => false,
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
