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

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }

  lightTheme() {
    Get.changeThemeMode(ThemeMode.light);
    saveThemeMode(!isSavedDarkMode());
  }

  darkTheme() {
    Get.changeThemeMode(ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
  }
}
