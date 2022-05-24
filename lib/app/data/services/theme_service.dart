import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxController {
  final _getStorage = GetStorage();
  final storageKey = "isDarkMode";
  bool isDarkMode = false;

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() => _getStorage.read(storageKey) ?? false;

  void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  void changeThemeMode(bool value) {
    isDarkMode = !isDarkMode;
    isDarkMode = value;
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
    update();
  }

  void toggleTheme(bool value) {
    isDarkMode = value;
    if (isDarkMode) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
    saveThemeMode(isDarkMode);
  }
}
