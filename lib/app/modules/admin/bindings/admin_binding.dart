import 'package:get/get.dart';

import 'package:rabegn/app/modules/admin/controllers/add_recipe_controller.dart';
import 'package:rabegn/app/modules/admin/controllers/admin_dashboard_controller.dart';
import 'package:rabegn/app/modules/admin/controllers/recipe_dashboard_controller.dart';
import 'package:rabegn/app/modules/admin/controllers/user_dashboard_controller.dart';

import '../controllers/admin_controller.dart';

class AdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeDashboardController>(
      () => RecipeDashboardController(),
    );
    Get.lazyPut<UserDashboardController>(
      () => UserDashboardController(),
    );
    Get.lazyPut<AdminDashboardController>(
      () => AdminDashboardController(),
    );
    Get.put<AddRecipeController>(
      AddRecipeController(),
    );
    Get.lazyPut<AdminController>(
      () => AdminController(),
    );
  }
}
