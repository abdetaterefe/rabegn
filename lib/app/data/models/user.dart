import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String email;
  bool role;
  Timestamp createdAt;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "name": name,
        "email": email,
        "role": role,
        "createdAt": createdAt,
      };
  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      role: snapshot['role'],
      createdAt: snapshot['createdAt'],
    );
  }
}
