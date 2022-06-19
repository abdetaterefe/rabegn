import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/recipelist.dart';
import 'package:rabegn/app/modules/recipe/views/recipe_detail_view.dart';

class MainRecipeController extends GetxController {
  final recipes = <RecipeListModel>[].obs;

  RxList<RecipeListModel> carouselRecipes =
      List<RecipeListModel>.empty(growable: true).obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    recipes.bindStream(recipesStream());
    carouselRecipes.bindStream(recipesStream());
    super.onInit();
  }

  navigate(int index) {
    Get.to(
      () => RecipeDetailView(),
      arguments: [
        recipes[index].recipeId,
        recipes[index].name,
        recipes[index].image,
        recipes[index].description,
        recipes[index].time,
        recipes[index].category,
        recipes[index].ingredients,
        recipes[index].instructions
      ],
    );
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
}
