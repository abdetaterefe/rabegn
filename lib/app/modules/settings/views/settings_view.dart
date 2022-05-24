import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rabegn/app/widgets/custom_button.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsView'),
        centerTitle: true,
      ),
      body: Center(
        child: CustomButton(
          bName: 'Log out',
          onTap: () => controller.signOut(),
        ),
      ),
    );
  }
}
