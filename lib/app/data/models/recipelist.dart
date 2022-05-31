import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeListModel {
  String recipeId;
  String name;
  String description;
  String image;
  String time;
  String category;

  Timestamp uploadedAt;
  List<dynamic> ingredients;
  List<dynamic> instructions;

  RecipeListModel({
    required this.recipeId,
    required this.name,
    required this.description,
    required this.image,
    required this.time,
    required this.category,
    required this.uploadedAt,
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
        'ingredients': ingredients,
        'instructions': instructions,
      };

  static RecipeListModel fromDocumentSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return RecipeListModel(
      recipeId: snapshot["recipeId"],
      name: snapshot["name"],
      description: snapshot["description"],
      image: snapshot["image"],
      time: snapshot["time"],
      category: snapshot["category"],
      uploadedAt: snapshot["uploadedAt"],
      ingredients: snapshot["ingredients"],
      instructions: snapshot["instructions"],
    );
  }
}
