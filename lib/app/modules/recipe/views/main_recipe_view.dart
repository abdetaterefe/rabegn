import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainRecipeView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainRecipeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MainRecipeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
