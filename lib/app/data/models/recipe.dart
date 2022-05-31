import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeModel {
  String recipeId;
  String name;
  String description;
  String image;
  String time;
  String category;
  Timestamp uploadedAt;
  List<String> favorites;
  List<dynamic> ingredients;
  List<dynamic> instructions;

  RecipeModel({
    required this.recipeId,
    required this.name,
    required this.description,
    required this.image,
    required this.time,
    required this.category,
    required this.uploadedAt,
    required this.favorites,
    required this.ingredients,
    required this.instructions,
  });
  Map<String, dynamic> toJson() => {
        'recipeId': recipeId,
        'name': name,
        'description': description,
        'image': image,
        'time': time,
        'category': category,
        'uploadedAt': uploadedAt,
        'favorites': favorites,
        'ingredients': ingredients,
        'instructions': instructions,
      };

  static RecipeModel fromDocumentSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return RecipeModel(
      recipeId: snapshot["recipeId"],
      name: snapshot["name"],
      description: snapshot["description"],
      image: snapshot["image"],
      time: snapshot["time"],
      category: snapshot["category"],
      uploadedAt: snapshot["uploadedAt"],
      favorites: snapshot["favorites"],
      ingredients: snapshot["ingredients"],
      instructions: snapshot["instructions"],
    );
  }
}
