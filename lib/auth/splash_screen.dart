import 'package:feet_finder_workout/core/app_images.dart';
import 'package:feet_finder_workout/widgets/buttom_navigator.dart';
import 'package:feet_finder_workout/widgets/spaces.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigatorScreen(),
        ),
        (protected) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height2 = getHeight(context);
    return Scaffold(
      body: Container(
        width: getWidth(context),
        height: height2,
        // decoration: BoxDecoration(
        //   image: const DecorationImage(
        //     image: AssetImage(AppImages.iPhone14),
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
}
