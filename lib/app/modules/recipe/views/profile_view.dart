import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rabegn/app/modules/recipe/views/about_view.dart';
import 'package:rabegn/app/widgets/profile_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'email address',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nottification',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (e) {},
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Theme Mode',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Obx(
                    () => controller.theme.value
                        ? IconButton(
                            icon: const Icon(Icons.dark_mode),
                            onPressed: () => controller.changeTheme(),
                          )
                        : IconButton(
                            icon: const Icon(Icons.light_mode),
                            onPressed: () => controller.changeTheme(),
                          ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              ProfileButton(
                name: 'Feedback',
                onTap: () => controller.feedback(),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileButton(
                name: 'About',
                onTap: () => Get.to(() => AboutView()),
              ),
              const SizedBox(
                height: 20,
              ),
              ProfileButton(
                name: 'Log out',
                onTap: () => controller.signOut(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
