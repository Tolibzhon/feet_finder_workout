class PlanModel {
  late final String title;
  late final String subtitle;
  late final String image;
  late final List<Workouts> workouts;
  late String id;
  late bool isPro;

  PlanModel({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.workouts,
    required this.id,
    this.isPro = false,
  });

  PlanModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    isPro = false;
    title = json['title'];
    subtitle = json['subtitle'];
    // image = json['image'];
    image = "https://autodmir.ru/logo/1/2312/photo.jpg";
    workouts = <Workouts>[];
    if (json['workouts'] != null) {
      json['workouts'].forEach((v) {
        workouts.add(Workouts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['image'] = image;
    data['workouts'] = workouts.map((v) => v.toJson()).toList();
    return data;
  }
}

class Workouts {
  late final String title;
  late final String image;
  late final String duration;
  late final int calories;
  late final String description;
  late final String category;

  Workouts({
    required this.title,
    required this.image,
    required this.duration,
    required this.calories,
    required this.description,
    required this.category,
  });

  Workouts.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'];
    image = json['image'];
    duration = json['duration'];
    calories = json['calories'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['duration'] = duration;
    data['calories'] = calories;
    data['description'] = description;
    data['category'] = category;
    return data;
  }
}
