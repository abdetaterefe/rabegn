import 'package:get/get.dart';

import 'package:rabegn/app/modules/recipe/controllers/explore_controller.dart';
import 'package:rabegn/app/modules/recipe/controllers/favorite_controller.dart';
import 'package:rabegn/app/modules/recipe/controllers/main_recipe_controller.dart';

import '../controllers/recipe_controller.dart';

class RecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
    Get.lazyPut<MainRecipeController>(
      () => MainRecipeController(),
    );
    Get.lazyPut<ExploreController>(
      () => ExploreController(),
    );
    Get.lazyPut<RecipeController>(
      () => RecipeController(),
    );
  }
}
