import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/core/utils/showLoading.dart';
import 'package:rabegn/app/data/models/recipe.dart';
import 'package:random_string/random_string.dart';
import 'package:uuid/uuid.dart';

class AddRecipeController extends GetxController {
  final GlobalKey<FormState> addRecipeFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final List<TextEditingController> ingrControllers = [];
  final List<TextEditingController> instControllers = [];

  Rx<File?>? _pickedImage;
  File? get recipeImage => _pickedImage?.value;
  var selectedImagePath = ''.obs;

  final ingrHeight = 100.0.obs;
  final instHeight = 100.0.obs;
  final ingrCount = 1.obs;
  final instCount = 1.obs;

  void addIngrident() {
    if (ingrCount >= 9 && ingrHeight >= 750.0) {
      Get.snackbar(
        'Limit',
        "Field can't be greater than 10",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      ingrHeight.value = ingrHeight.value + 75.0;
      ingrCount.value++;
    }
  }

  void removeIngrident() {
    if (ingrCount <= 1 && ingrHeight <= 100.0) {
      Get.snackbar(
        'Limit',
        "Field can't be less than 1",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      ingrHeight.value = ingrHeight.value - 75.0;
      ingrCount.value--;
    }
  }

  void addInstruction() {
    if (instCount >= 9 && instHeight >= 750.0) {
      Get.snackbar(
        'Limit',
        "Field can't be greater than 10",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      instHeight.value = instHeight.value + 75.0;
      instCount.value++;
    }
  }

  void removeInstruction() {
    if (instCount <= 1 && instHeight <= 100.0) {
      Get.snackbar(
        'Limit',
        "Field can't be less than 1",
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      instHeight.value = instHeight.value - 75.0;
      instCount.value--;
    }
  }

  String? validateFields(String? value) {
    if (value!.isEmpty) {
      return "Fields is required !";
    } else {
      return null;
    }
  }

  void pickImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().getImage(
      source: imageSource,
      imageQuality: 25,
    );
    if (pickedImage != null) {
      _pickedImage = Rx<File?>(File(pickedImage.path));
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar("Error ", 'Image is not selected');
    }
  }

  _clearImage() {
    _pickedImage = null;
    selectedImagePath.value = '';
  }

  Future<String> _uploadToStorage(File image) async {
    Reference ref =
        firebaseStorage.ref().child('recipes').child(randomString(10));
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  void saveRecipe(
    String name,
    String description,
    File? image,
    String time,
    String category,
    List<dynamic> ingredients,
    List<dynamic> instructions,
  ) async {
    if (addRecipeFormKey.currentState!.validate()) {
      addRecipeFormKey.currentState!.save();
      try {
        if (image != null) {
          showLoading();
          String downloadUrl = await _uploadToStorage(image);
          String recipeId = const Uuid().v1();
          RecipeModel recipeModel = RecipeModel(
            recipeId: recipeId,
            name: name,
            description: description,
            image: downloadUrl,
            time: time,
            category: category,
            uploadedAt: Timestamp.now(),
            favorites: [
              'test',
            ],
            ingredients: ingredients,
            instructions: instructions,
          );
          await firestore
              .collection('recipes')
              .doc(recipeId)
              .set(recipeModel.toJson());
          dismissLoadingWidget();
          _clearControllers();
          _clearImage();
          Get.back();
          Get.snackbar('Succes', 'Recipe is Uploaded');
        } else {
          Get.snackbar('Image', 'Image is required !');
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'error saving recipe',
        );
      }
    }
  }

  _clearControllers() {
    nameController.clear();
    descriptionController.clear();
    timeController.clear();
    categoryController.clear();
    for (TextEditingController i in ingrControllers) {
      i.clear();
    }
    for (TextEditingController i in instControllers) {
      i.clear();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    timeController.dispose();
    categoryController.dispose();
    for (TextEditingController i in ingrControllers) {
      i.dispose();
    }
    for (TextEditingController i in instControllers) {
      i.dispose();
    }
  }
}
