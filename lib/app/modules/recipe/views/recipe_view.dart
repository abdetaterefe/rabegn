import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/modules/recipe/views/profile_view.dart';
import 'package:rabegn/app/modules/recipe/controllers/recipe_controller.dart';
import 'package:rabegn/app/modules/recipe/views/explore_recipe_view.dart';
import 'package:rabegn/app/modules/recipe/views/favorite_recipe_view.dart';
import 'package:rabegn/app/modules/recipe/views/main_recipe_view.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecipeController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              const MainRecipeView(),
              const ExploreRecipeView(),
              FavoriteRecipeView(),
              const ProfileView(),
            ],
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: NavigationBar(
              height: 65,
              selectedIndex: controller.tabIndex,
              onDestinationSelected: controller.changeTabIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_outlined),
                  selectedIcon: Icon(Icons.category),
                  label: 'Explore',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite_outline),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_outline),
                  selectedIcon: Icon(Icons.people),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
