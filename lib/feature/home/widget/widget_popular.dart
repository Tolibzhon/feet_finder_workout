import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/feature/workout/detail_workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetPopular extends StatelessWidget {
  const WidgetPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailWorkoutScreen(),
          ),
        );
      },
      child: CachedNetworkImage(
          imageUrl: "https://autodmir.ru/logo/1/2312/photo.jpg",
          placeholder: (_, url) {
            return SizedBox(
              width: 162,
              height: 124,
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
              width: 162,
              height: 124,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image:
                      NetworkImage("https://autodmir.ru/logo/1/2312/photo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
