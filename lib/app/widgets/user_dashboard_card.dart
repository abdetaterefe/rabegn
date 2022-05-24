import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDashBoardCard extends StatelessWidget {
  final String userName, userEmail;
  final VoidCallback delete;
  const UserDashBoardCard({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(fontSize: 20),
              ),
              Text(userEmail),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Delete User ?'),
                  content: Text(
                    'are you sure you want delete $userName, this action is irreversable',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('delete'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('close'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    );
  }
}
