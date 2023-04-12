import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/auth/premium_screen.dart';
import 'package:feet_finder_workout/config/check_premium.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/plan/widget/widget_row.dart';
import 'package:feet_finder_workout/widgets/custom_button.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailPlanScreen extends StatelessWidget {
  const DetailPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          "7 minute workout",
          style: AppTextStyles.s19W700(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CachedNetworkImage(
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
                  return Container(
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
                  );
                }),
            const SizedBox(height: 12),
            Text(
              "developed according to ACSM research, improves physical fitness",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s15W400(color: Colors.black),
            ),
            const SizedBox(height: 12),
            FutureBuilder(
                future: CheckPremium.getSubscription(),
                builder: (context, AsyncSnapshot<bool?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!) {
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => WidgetRow(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: 6,
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
      ),
    );
  }
}
