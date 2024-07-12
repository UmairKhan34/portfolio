import 'package:hive/hive.dart';

class HiveDb {
  static final _hive = Hive.box('languageBox');

  Future<void> setThemeMode(String themeMode) async {
    await _hive.put(Hivekeys.themeMode, themeMode);
  }

  static Future<String?> getThemeMode() async {
    return _hive.get(Hivekeys.themeMode) as String?;
  }
}

class Hivekeys {
  static const String themeMode = 'themeMode';
}
