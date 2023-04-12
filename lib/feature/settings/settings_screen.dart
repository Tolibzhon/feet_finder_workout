import 'package:feet_finder_workout/auth/premium_screen.dart';
import 'package:feet_finder_workout/config/app_config.dart';
import 'package:feet_finder_workout/config/check_premium.dart';
import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:feet_finder_workout/feature/settings/widget/widget_settings_row.dart';
import 'package:feet_finder_workout/web_view_screen.dart';
import 'package:feet_finder_workout/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Settings',
                style: AppTextStyles.s19W700(
                  color: Colors.black,
                ),
              ),
              WidgetSettingsRow(
                  icon: AppImages.favouriteIcon,
                  text: "My projects",
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyProjectScreen(),
                    //   ),
                    // );
                  }),
              WidgetSettingsRow(
                icon: AppImages.privacyIcon,
                text: 'Privacy Policy',
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
              ),
              WidgetSettingsRow(
                icon: AppImages.termsIcon,
                text: 'Terms of Use',
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
              ),
              WidgetSettingsRow(
                icon: AppImages.restoreIcon,
                text: 'Restore purchase',
                onTap: () {},
              ),
              WidgetSettingsRow(
                icon: AppImages.rateIcon,
                text: 'Rate our app',
                onTap: () {},
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: CheckPremium.getSubscription(),
                  builder: (context, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!) {
                        return const SizedBox();
                      }
                    }
                    return CustomButton(
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
