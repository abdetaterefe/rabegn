import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/core/utils/showLoading.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  String? validatePass(String? value) {
    if (value!.isEmpty) {
      return "Password is required !";
    } else if (value.length < 6) {
      return "Password cant be less than 6 digit";
    }
    return null;
  }

  void signIn() async {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        showLoading();
        await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Get.toNamed('/recipe');
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
    passwordController.dispose();
  }
}
