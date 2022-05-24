import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/user.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Name is required !";
    } else if (value.length < 6) {
      return "Name cant be less than 6 digit";
    }
    return null;
  }

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

  Future<void> signUp() async {
    if (signupFormKey.currentState!.validate()) {
      signupFormKey.currentState!.save();
      try {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        UserModel userModel = UserModel(
          uid: cred.user!.uid,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          role: false,
          createdAt: Timestamp.now(),
        );
        await firestore
            .collection('user')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        Get.toNamed('/recipe');
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar("Error", e.toString());
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
