import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/recipe.dart';

class MainRecipeController extends GetxController {
  final count = 0.obs;
  final Rx<List<RecipeModel>> _recipes = Rx<List<RecipeModel>>([]);
  List<RecipeModel> get recipes => _recipes.value;

  @override
  void onInit() {
    super.onInit();
    _recipes.bindStream(
      firestore.collection('recipes').snapshots().map(
        (event) {
          List<RecipeModel> reRec = [];
          for (var element in event.docs) {
            reRec.add(
              RecipeModel.fromDocumentSnapshot(element),
            );
          }
          return reRec;
        },
      ),
    );
  }

  void increment() => count.value++;
}
