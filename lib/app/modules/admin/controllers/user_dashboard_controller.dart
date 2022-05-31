import 'package:get/get.dart';
import 'package:rabegn/app/core/utils/helpers.dart';
import 'package:rabegn/app/data/models/user.dart';

class UserDashboardController extends GetxController {
  final users = <UserModel>[].obs;

  @override
  void onInit() {
    users.bindStream(recipesStream());
    super.onInit();
  }

  Stream<List<UserModel>> recipesStream() {
    return firestore.collection('user').snapshots().map(
      (event) {
        return event.docs.map((e) => UserModel.fromSnap(e)).toList();
      },
    );
  }
}
