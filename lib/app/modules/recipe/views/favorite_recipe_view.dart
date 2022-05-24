import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FavoriteRecipeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FavoriteRecipeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavoriteRecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
