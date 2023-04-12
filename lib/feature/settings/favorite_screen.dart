import 'package:feet_finder_workout/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Favourite",
          style: AppTextStyles.s19W700(color: Colors.black),
        ),
      ),
    );
  }
}
