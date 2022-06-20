import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/core/utils/showLoading.dart';
import 'package:rabegn/app/data/services/theme_service.dart';
import 'package:rabegn/app/data/models/feedback.dart' as fb;

class ProfileController extends GetxController {
  RxBool theme = ThemeService().isSavedDarkMode().obs;
  final GlobalKey<FormState> feedbackFormKey = GlobalKey<FormState>();

  final TextEditingController feedbackController = TextEditingController();
  String? validateFeedback(String? value) {
    if (value!.isEmpty) {
      return "Fields is can not be empty";
    } else {
      return null;
    }
  }

  sendFeedback(
    String feedback,
  ) async {
    if (feedbackFormKey.currentState!.validate()) {
      feedbackFormKey.currentState!.save();
      try {
        showLoading();
        final User user = firebaseAuth.currentUser!;
        final uid = user.uid;
        fb.Feedback feedBack = fb.Feedback(
          uid: uid,
          feedback: feedback,
        );
        await firestore.collection('feedback').doc().set(feedBack.toJson());
        dismissLoadingWidget();
        _clearControllers();
        Get.back();
        Get.snackbar('Succes', 'Feedback is sent, thank you');
      } catch (e) {
        Get.back();
        Get.snackbar(
          'Error',
          'error sending feedback',
        );
      }
    }
  }

  feedback() {
    Get.dialog(
      Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 275,
          child: Form(
            key: feedbackFormKey,
            child: Column(
              children: [
                const Text(
                  'Feedback',
                  style: TextStyle(fontSize: 25),
                ),
                const Spacer(),
                TextFormField(
                  maxLines: 4,
                  controller: feedbackController,
                  validator: (value) => validateFeedback(value),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      onPressed: () => Get.back(),
                      child: const Text('cancel'),
                    ),
                    MaterialButton(
                      onPressed: () => sendFeedback(
                        feedbackController.text,
                      ),
                      child: const Text('Send Feedback'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
          ThemeService().isSavedDarkMode() ? Colors.black : Colors.white,
    );
  }

  _clearControllers() {
    feedbackController.clear();
  }

  @override
  void onClose() {
    feedbackController.dispose();
  }
}
