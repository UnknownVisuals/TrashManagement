import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  var isDarkMode = false.obs;

  ThemeMode get theme {
    return isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeController() {
    isDarkMode.value = _loadThemeFromStorage();
  }

  bool _loadThemeFromStorage() {
    if (_box.hasData(_key)) {
      return _box.read<bool>(_key)!;
    } else {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
  }

  void _saveThemeToStorage(bool isDark) {
    _box.write(_key, isDark);
  }

  void toggleTheme(bool isDark) {
    isDarkMode.value = isDark;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToStorage(isDark);
  }
}
