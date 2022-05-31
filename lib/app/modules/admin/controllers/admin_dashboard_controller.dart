import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/services/theme_service.dart';

class AdminDashboardController extends GetxController {
  signOut() {
    Get.dialog(
      AlertDialog(
        title: const Text('Log out'),
        content: const Text('are you sure you want to log out ?'),
        actions: [
          MaterialButton(
            onPressed: () => Get.back(),
            child: const Text('cancel'),
          ),
          MaterialButton(
            onPressed: () => firebaseAuth.signOut(),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
  }

  changeTheme() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          children: [
            const Text(
              'Change Theme',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.light_mode),
              title: const Text('Light Theme'),
              onTap: () => ThemeService().lightTheme(),
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Theme'),
              onTap: () => ThemeService().darkTheme(),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor:
          ThemeService().isSavedDarkMode() ? Colors.white : Colors.black,
    );
  }
}
