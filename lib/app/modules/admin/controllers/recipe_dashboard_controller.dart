import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/recipelist.dart';

class RecipeDashboardController extends GetxController {
  final recipes = <RecipeListModel>[].obs;

  @override
  void onInit() {
    recipes.bindStream(recipesStream());
    super.onInit();
  }

  Stream<List<RecipeListModel>> recipesStream() {
    return firestore.collection('recipes').snapshots().map(
      (event) {
        return event.docs
            .map((e) => RecipeListModel.fromDocumentSnapshot(e))
            .toList();
      },
    );
  }

  deleteRecipe(String recipeId) {
    firestore.collection('recipes').doc(recipeId).delete();
    Get.back();
  }
}
