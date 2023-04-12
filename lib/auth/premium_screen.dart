import 'package:feet_finder_workout/config/app_config.dart';
import 'package:feet_finder_workout/config/check_premium.dart';
import 'package:feet_finder_workout/core/app_colors.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/web_view_screen.dart';
import 'package:feet_finder_workout/widgets/buttom_navigator.dart';
import 'package:feet_finder_workout/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key, this.isPop = false});
  final bool isPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(AppImages.premiumImage),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColors.color530AA2Purple,
            ],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (isPop) {
                        Navigator.pop(context);
                      } else {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorScreen(),
                          ),
                          (protected) => false,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Restore",
                    style:
                        AppTextStyles.s19W700(color: AppColors.colorFF2ECFPink),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 72,
                width: 296,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.color530AA2Purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'PREMIUM',
                  style: AppTextStyles.s36W500(color: Colors.white),
                ),
              ),
              const SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.colorFF2ECFPink,
                    radius: 4,
                  ),
                  const SizedBox(width: 10),
                  Text('More workout plans',
                      style: AppTextStyles.s19W700(color: Colors.white))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.colorFF2ECFPink,
                    radius: 4,
                  ),
                  const SizedBox(width: 10),
                  Text('More workouts',
                      style: AppTextStyles.s19W700(color: Colors.white))
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.colorFF2ECFPink,
                    radius: 4,
                  ),
                  const SizedBox(width: 10),
                  Text('Without advertising',
                      style: AppTextStyles.s19W700(color: Colors.white))
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                icon: AppImages.crownIcon,
                text: 'Buy Premium for \$1.99',
                onPressed: () async {
                  await CheckPremium.setSubscription();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigatorScreen(),
                    ),
                    (protected) => false,
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppConfig.termOfUse,
                            title: "Terms of Use",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Terms of Use',
                      style: AppTextStyles.s15W400(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 12,
                    width: 2,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebViewScreen(
                            url: AppConfig.privacyPolicy,
                            title: "Privacy Policy",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Privacy Policy',
                      style: AppTextStyles.s15W400(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    ));
  }
}
