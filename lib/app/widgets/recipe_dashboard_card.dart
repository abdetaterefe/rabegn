import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecpeDashBoardCard extends StatelessWidget {
  final String recipeImage, recipeName;
  final VoidCallback edit, delete;
  const RecpeDashBoardCard({
    Key? key,
    required this.recipeImage,
    required this.recipeName,
    required this.edit,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height * .08,
              width: MediaQuery.of(context).size.height * .08,
              imageUrl: recipeImage,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            recipeName,
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          IconButton(
            onPressed: edit,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Delete ?'),
                  content: Text(
                      'are you sure you want delete $recipeName, this action is irreversable'),
                  actions: [
                    TextButton(
                      onPressed: delete,
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
