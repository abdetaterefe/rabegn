import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/modules/admin/controllers/admin_dashboard_controller.dart';
import 'package:rabegn/app/widgets/admin_dashboard_card.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: const AdminDashBoardCard(
                  category: 'users',
                  info: '42',
                ).asGlass(
                  tintColor: Colors.orange,
                  clipBorderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: const AdminDashBoardCard(
                  category: 'recipes',
                  info: '27',
                ).asGlass(
                  tintColor: Colors.orange,
                  clipBorderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
