import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/core/utils/showLoading.dart';


class ForgotController extends GetxController {
  final GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "Email is required !";
    } else {
      if (GetUtils.isEmail(value)) {
        return null;
      } else {
        return "Enter a valid email";
      }
    }
  }

  void forgot() async {
    if (forgotFormKey.currentState!.validate()) {
      forgotFormKey.currentState!.save();
      try {
        showLoading();
        await firebaseAuth.sendPasswordResetEmail(
            email: emailController.text.trim());
        Get.toNamed('/login');
        dismissLoadingWidget();
      } on FirebaseAuthException catch (e) {
        dismissLoadingWidget();
        Get.snackbar("Error", e.toString());
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
  }
}
