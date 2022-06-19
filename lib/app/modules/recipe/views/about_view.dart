import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AboutView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Rabegn',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Version',
            ),
            Text(
              '1.0.0 beta',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Last Update',
            ),
            Text(
              'June 2022',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Any damage caused while using this app is not my fault bitch ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Text(
              'Terms of services',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
