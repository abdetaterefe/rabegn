import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rabegn/app/modules/admin/controllers/add_recipe_controller.dart';
import 'package:rabegn/app/widgets/add_recipe_chips.dart';
import 'package:rabegn/app/widgets/add_recipe_field.dart';
import 'package:rabegn/app/widgets/add_recipe_iandi.dart';
import 'package:rabegn/app/widgets/custom_button.dart';

class AddRecipeView extends GetWidget<AddRecipeController> {
  const AddRecipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: controller.addRecipeFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () {
                      return Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: controller.selectedImagePath.value == ''
                                ? const AssetImage(
                                        "assets/images/place_holder_for_recipe.jpeg")
                                    as ImageProvider
                                : FileImage(
                                    File(controller.selectedImagePath.value),
                                  ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: IconButton(
                                    onPressed: () => controller
                                        .pickImage(ImageSource.camera),
                                    icon: const Icon(Icons.camera),
                                  ),
                                ).asGlass(
                                  tintColor: Colors.orange,
                                  clipBorderRadius: BorderRadius.circular(10),
                                ),
                                Container(
                                  child: IconButton(
                                    onPressed: () => controller
                                        .pickImage(ImageSource.gallery),
                                    icon: const Icon(Icons.image),
                                  ),
                                ).asGlass(
                                  tintColor: Colors.orange,
                                  clipBorderRadius: BorderRadius.circular(10),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: const Text(
                                  'Pick Image From Camera or Gallery'),
                            ).asGlass(
                              tintColor: Colors.orange,
                              clipBorderRadius: BorderRadius.circular(10),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddRecipeField(
                    controller: controller.nameController,
                    hint: 'Recipe Name',
                    action: TextInputAction.next,
                    validate: (value) => controller.validateFields(value),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddRecipeField(
                    controller: controller.descriptionController,
                    hint: 'Recipe Description',
                    lines: 3,
                    validate: (value) => controller.validateFields(value),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: AddRecipeField(
                          controller: controller.timeController,
                          hint: 'Time',
                          action: TextInputAction.next,
                          validate: (value) => controller.validateFields(value),
                          type: TextInputType.number,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: AddRecipeField(
                          controller: controller.categoryController,
                          hint: 'Category',
                          validate: (value) => controller.validateFields(value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Ingridients',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => AddRecipeIandI(
                      height: controller.ingrHeight.value,
                      count: controller.ingrCount.value,
                      controllers: controller.ingrControllers,
                      object: 'Ingridient',
                      validate: (value) => controller.validateFields(value),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddRecipeChips(
                    add: () {
                      controller.addIngrident();
                    },
                    remove: () {
                      controller.removeIngrident();
                    },
                    object: 'Ingridient',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Instruction',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => AddRecipeIandI(
                      height: controller.instHeight.value,
                      count: controller.instCount.value,
                      controllers: controller.instControllers,
                      object: 'Instruction',
                      validate: (value) => controller.validateFields(value),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AddRecipeChips(
                    add: () {
                      controller.addInstruction();
                    },
                    remove: () {
                      controller.removeInstruction();
                    },
                    object: 'Instruction',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    bName: 'Save Recipe',
                    onTap: () {
                      List<String> ingrList = controller.ingrControllers
                          .map((e) => e.text)
                          .toList();
                      ingrList.removeWhere((item) => item.isEmpty);
                      List<String> instList = controller.instControllers
                          .map((e) => e.text)
                          .toList();
                      instList.removeWhere((item) => item.isEmpty);
                      controller.saveRecipe(
                        controller.nameController.text,
                        controller.descriptionController.text,
                        controller.recipeImage,
                        controller.timeController.text,
                        controller.categoryController.text,
                        ingrList,
                        instList,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
