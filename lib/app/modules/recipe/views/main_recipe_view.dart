import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/modules/recipe/controllers/main_recipe_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainRecipeView extends GetView<MainRecipeController> {
  const MainRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Wellcome here',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'New Recipes',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () {
                  if (controller.recipes.isNotEmpty) {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.0,
                        enlargeCenterPage: true,
                      ),
                      itemCount: controller.recipes.length,
                      itemBuilder: (context, index, index1) {
                        return InkWell(
                          onTap: () => controller.navigate(index),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Hero(
                                    tag: controller.recipes[index].recipeId,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        width: double.infinity,
                                        imageUrl:
                                            controller.recipes[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  controller.recipes[index].name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ).asGlass(
                            tintColor: Colors.orange,
                            clipBorderRadius: BorderRadius.circular(10),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.hourglass_empty),
                          Text('Data not Found !'),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Top Recipes',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: controller.recipes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl: controller.recipes[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              controller.recipes[index].name,
                            ),
                          ],
                        ),
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
    );
  }
}
