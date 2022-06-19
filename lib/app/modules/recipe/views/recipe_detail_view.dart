import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rabegn/app/modules/recipe/controllers/recipe_detail_controller.dart';
import 'package:rabegn/app/modules/recipe/views/recipe_instruction_view.dart';

class RecipeDetailView extends GetView<RecipeDetailController> {
  @override
  Widget build(BuildContext context) {
    var detail = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Hero(
                  tag: detail[0].toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: detail[2],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            detail[1],
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(Icons.favorite),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        detail[3],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            detail[4] + " min",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.category_rounded,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            detail[5],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Ingridients",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(parent: null),
                          scrollDirection: Axis.vertical,
                          itemCount: detail[6].length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              "<> " + detail[6][index].toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: InkWell(
        onTap: () => Get.to(
          () => RecipeInstructionView(),
          arguments: [
            detail[7],
          ],
        ),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.next_plan,
                size: 30,
              ),
              Text(
                'start cooking',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
