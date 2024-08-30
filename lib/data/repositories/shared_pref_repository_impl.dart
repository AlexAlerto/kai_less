import 'package:kai_less/domain/repositories/shared_pref_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepositoryImpl extends SharedPrefRepository {
  late SharedPreferences _sharedPreferences;
  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  bool? getBool(String key) => _sharedPreferences.getBool(key);

  @override
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  int? getInt(String key) => _sharedPreferences.getInt(key);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  @override
  Future<bool> setBool(String key, bool value) async =>
      await _sharedPreferences.setBool(key, value);

  @override
  Future<bool> setDouble(String key, double value) async =>
      await _sharedPreferences.setDouble(key, value);

  @override
  Future<bool> setInt(String key, int value) async =>
      await _sharedPreferences.setInt(key, value);

  @override
  Future<bool> setString(String key, String value) async =>
      await _sharedPreferences.setString(key, value);

  @override
  Future<bool> setStringList(String key, List<String> value) async =>
      await _sharedPreferences.setStringList(key, value);

  @override
  Future<bool> remove(String key) async => await _sharedPreferences.remove(key);

  @override
  Future<bool> clear() async => await _sharedPreferences.clear();

  @override
  Future<void> reload() async => await _sharedPreferences.reload();
}
