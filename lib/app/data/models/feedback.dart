import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback {
  String uid;
  String feedback;

  Feedback({
    required this.uid,
    required this.feedback,
  });
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'feedback': feedback,
      };
  static Feedback fromDocumentSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Feedback(
      uid: snapshot["recipeId"],
      feedback: snapshot["name"],
    );
  }
}
