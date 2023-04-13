import 'package:shared_preferences/shared_preferences.dart';

class SavedData {
  static Future<List<String>> getTitles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('titles') ?? [];
  }

  static Future<void> setTitles(String titile) async {
    final prefs = await SharedPreferences.getInstance();
    final titleSaved = prefs.getStringList('titles') ?? [];
    titleSaved.add(titile);
    prefs.setStringList('titles', titleSaved);
  }

  static Future<void> setCalosies(int calories) async {
    final prefs = await SharedPreferences.getInstance();
    final calorySaved = prefs.getStringList('calories') ?? [];
    calorySaved.add(calories.toString());
    prefs.setStringList('calories', calorySaved);
  }

  static Future<List<String>> getCalosies() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('calories') ?? [];
  }

  static Future<void> setDates(String dates) async {
    final prefs = await SharedPreferences.getInstance();
    final dateSaved = prefs.getStringList('dates') ?? [];
    dateSaved.add(dates);
    prefs.setStringList('dates', dateSaved);
  }

  static Future<List<String>> getDates() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('dates') ?? [];
  }

  static Future<void> setTimes(int calories) async {
    final prefs = await SharedPreferences.getInstance();
    final timesSaved = prefs.getStringList('times') ?? [];
    timesSaved.add(calories.toString());
    prefs.setStringList('times', timesSaved);
  }

  static Future<List<String>> getTimes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('times') ?? [];
  }
}
