import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/modules/admin/controllers/admin_controller.dart';
import 'package:rabegn/app/modules/admin/views/admin_dashboard_view.dart';
import 'package:rabegn/app/modules/admin/views/recipe_dashboard_view.dart';
import 'package:rabegn/app/modules/admin/views/user_dashboard_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              AdminDashboardView(),
              UserDashboardView(),
              RecipeDashboardView(),
            ],
          ),
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: NavigationBar(
              height: 65,
              selectedIndex: controller.tabIndex,
              onDestinationSelected: controller.changeTabIndex,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard_outlined),
                  selectedIcon: Icon(Icons.dashboard),
                  label: 'DashBoard',
                ),
                NavigationDestination(
                  icon: Icon(Icons.people_outline),
                  selectedIcon: Icon(Icons.people),
                  label: 'Users',
                ),
                NavigationDestination(
                  icon: Icon(Icons.food_bank_outlined),
                  selectedIcon: Icon(Icons.food_bank),
                  label: 'Recipes',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
