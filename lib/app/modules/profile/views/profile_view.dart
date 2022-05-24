import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rabegn/app/data/services/theme_service.dart';
import 'package:rabegn/app/widgets/custom_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final ThemeService themeService = Get.put(ThemeService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CustomButton(
                onTap: () => Get.toNamed('/settings'),
                bName: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
