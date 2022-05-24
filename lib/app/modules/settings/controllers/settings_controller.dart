import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';

class SettingsController extends GetxController {
  signOut() {
    firebaseAuth.signOut();
  }

  @override
  void onClose() {}
}
