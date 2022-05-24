import 'package:get/get.dart';

import '../controllers/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(
      () => ForgotController(),
    );
  }
}
