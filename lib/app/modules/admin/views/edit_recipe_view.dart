import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/widgets/add_recipe_chips.dart';
import 'package:rabegn/app/widgets/add_recipe_field.dart';
import 'package:rabegn/app/widgets/add_recipe_iandi.dart';

class EditRecipeView extends StatefulWidget {
  @override
  State<EditRecipeView> createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final List<TextEditingController> _ingrControllers = [];
  final List<TextEditingController> _instControllers = [];

  double ingrHeight = 100;
  double instHeight = 100;
  int ingrCount = 1;
  int instCount = 1;
  void addIngrident() {
    setState(() {
      if (ingrCount >= 9 && ingrHeight >= 750) {
        Get.snackbar(
          'Limit',
          "Field can't be greater than 10",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        ingrHeight = ingrHeight + 75;
        ingrCount++;
      }
    });
  }

  void removeIngrident() {
    setState(() {
      if (ingrCount <= 1 && ingrHeight <= 100) {
        Get.snackbar(
          'Limit',
          "Field can't be less than 1",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        ingrHeight = ingrHeight - 75;
        ingrCount--;
      }
    });
  }

  void addInstruction() {
    setState(() {
      if (instCount >= 9 && instHeight >= 750) {
        Get.snackbar(
          'Limit',
          "Field can't be greater than 10",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        instHeight = instHeight + 75;
        instCount++;
      }
    });
  }

  void removeInstruction() {
    setState(() {
      if (instCount <= 1 && instHeight <= 100) {
        Get.snackbar(
          'Limit',
          "Field can't be less than 1",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        instHeight = instHeight - 75;
        instCount--;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _timeController.dispose();
    _categoryController.dispose();
    for (TextEditingController c in _ingrControllers) {
      c.dispose();
    }
    for (TextEditingController c in _instControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Recipe'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AddRecipeField(
                        controller: _nameController,
                        hint: 'Recipe Name',
                        action: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AddRecipeField(
                  controller: _descriptionController,
                  hint: 'Recipe Description',
                  lines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AddRecipeField(
                        controller: _timeController,
                        hint: 'Time',
                        action: TextInputAction.next,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: AddRecipeField(
                        controller: _categoryController,
                        hint: 'Category',
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
                AddRecipeIandI(
                  height: ingrHeight,
                  count: ingrCount,
                  controllers: _ingrControllers,
                  object: 'Ingridient',
                ),
                const SizedBox(
                  height: 10,
                ),
                AddRecipeChips(
                  add: () {
                    addIngrident();
                  },
                  remove: () {
                    removeIngrident();
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
                AddRecipeIandI(
                  height: instHeight,
                  count: instCount,
                  controllers: _instControllers,
                  object: 'Instruction',
                ),
                const SizedBox(
                  height: 10,
                ),
                AddRecipeChips(
                  add: () {
                    addInstruction();
                  },
                  remove: () {
                    removeInstruction();
                  },
                  object: 'Instruction',
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  height: 60,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Update Recipe',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  onPressed: () {},
                ).asGlass(
                  tintColor: Colors.orange,
                  clipBorderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
