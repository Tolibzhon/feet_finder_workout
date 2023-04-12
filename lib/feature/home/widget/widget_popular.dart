import 'package:cached_network_image/cached_network_image.dart';
import 'package:feet_finder_workout/feature/workout/detail_workout_screen.dart';
import 'package:feet_finder_workout/logic/model/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WidgetPopular extends StatelessWidget {
  const WidgetPopular({Key? key, required this.model}) : super(key: key);
  final WorkoutModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailWorkoutScreen(
              model: model,
            ),
          ),
        );
      },
      child: CachedNetworkImage(
        imageUrl: model.image,
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
                image: NetworkImage(model.image),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
