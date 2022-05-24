import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/user.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;

  @override
  void onInit() {
    super.onInit();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      final DocumentSnapshot snapshot =
          await firestore.collection('user').doc(user.uid).get();
      if (UserModel.fromSnap(snapshot).role == true) {
        Get.offAllNamed('/admin');
      } else {
        Get.offAllNamed('/recipe');
      }
    }
  }
}
