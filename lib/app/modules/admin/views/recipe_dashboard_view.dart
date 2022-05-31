import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/modules/admin/controllers/recipe_dashboard_controller.dart';
import 'package:rabegn/app/modules/admin/views/add_recipe_view.dart';
import 'package:rabegn/app/widgets/add_recipe_FAB.dart';
import 'package:rabegn/app/widgets/dashboard_card.dart';
import 'package:rabegn/app/widgets/recipe_dashboard_card.dart';

class RecipeDashboardView extends GetView<RecipeDashboardController> {
  const RecipeDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Obx(
                  () {
                    return DashBoardCard(
                      category: 'recipes',
                      info: '${controller.recipes.length}',
                    ).asGlass(
                      tintColor: Colors.orange,
                      clipBorderRadius: BorderRadius.circular(10),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Expanded(
                  flex: 5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.recipes.length,
                    physics: const ScrollPhysics(parent: null),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return RecpeDashBoardCard(
                        recipeImage: controller.recipes[index].image,
                        recipeName: controller.recipes[index].name,
                        edit: () {},
                        delete: () => controller
                            .deleteRecipe(controller.recipes[index].recipeId),
                      ).asGlass(
                        tintColor: Colors.orange,
                        clipBorderRadius: BorderRadius.circular(10),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AddRecipeFAB(
        onTap: () => Get.to(() => const AddRecipeView()),
      ),
    );
  }
}
