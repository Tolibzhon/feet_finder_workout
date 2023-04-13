class WorkoutModel {
  late final String title;
  late final String image;
  late final String duration;
  late final int calories;
  late final String description;
  late final String category;
  late String? id;
  late bool isPro;
  late bool isLiked;

  WorkoutModel({
    required this.title,
    required this.image,
    required this.duration,
    required this.calories,
    required this.description,
    required this.category,
    this.id,
    this.isPro = false,
    this.isLiked = false,
  });

  WorkoutModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    isPro = false;
    isLiked = false;
    title = json['title'];
    // image = json['image'];
    image = "https://autodmir.ru/logo/1/2312/photo.jpg";
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
