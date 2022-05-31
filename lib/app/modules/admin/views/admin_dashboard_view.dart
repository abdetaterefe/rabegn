import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/data/services/theme_service.dart';
import 'package:rabegn/app/modules/admin/controllers/admin_dashboard_controller.dart';
import 'package:rabegn/app/modules/admin/controllers/recipe_dashboard_controller.dart';
import 'package:rabegn/app/modules/admin/controllers/user_dashboard_controller.dart';
import 'package:rabegn/app/widgets/admin_dashboard_card.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'DashBoard',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: ThemeService().isSavedDarkMode()
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      onPressed: () => controller.changeTheme(),
                    ),
                    IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () => controller.signOut(),
                    ),
                  ],
                ),
              ).asGlass(
                tintColor: Colors.orange,
                clipBorderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<UserDashboardController>(
                builder: (context) {
                  return Expanded(
                    child: AdminDashBoardCard(
                      category: 'users',
                      info: '${context.users.length}',
                    ).asGlass(
                      tintColor: Colors.orange,
                      clipBorderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GetX<RecipeDashboardController>(
                init: RecipeDashboardController(),
                builder: (context) {
                  return Expanded(
                    child: AdminDashBoardCard(
                      category: 'recipes',
                      info: '${context.recipes.length}',
                    ).asGlass(
                      tintColor: Colors.orange,
                      clipBorderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
