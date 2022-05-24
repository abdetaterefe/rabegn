import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rabegn/app/modules/recipe/controllers/explore_controller.dart';

class ExploreRecipeView extends GetView<ExploreController> {
  const ExploreRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExploreRecipeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ExploreRecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
