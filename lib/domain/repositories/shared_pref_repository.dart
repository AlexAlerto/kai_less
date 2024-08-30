import 'package:shared_preferences/shared_preferences.dart';

const String kLessons = 'lessons';
const String kGroupNum = 'groupNum';
const String kUserTheme = 'userTheme';

abstract class SharedPrefRepository {
  late SharedPreferences _sharedPreferences;

  Future<void> init();

  bool? getBool(String key);

  double? getDouble(String key);

  int? getInt(String key);

  String? getString(String key);

  List<String>? getStringList(String key);

  Future<bool> setBool(String key, bool value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setInt(String key, int value);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> remove(String key);

  Future<bool> clear();

  Future<void> reload();
}
