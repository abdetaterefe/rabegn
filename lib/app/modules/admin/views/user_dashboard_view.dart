import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:rabegn/app/modules/admin/controllers/user_dashboard_controller.dart';
import 'package:rabegn/app/widgets/dashboard_card.dart';
import 'package:rabegn/app/widgets/user_dashboard_card.dart';

class UserDashboardView extends GetView<UserDashboardController> {
  const UserDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Obx(
                  () => DashBoardCard(
                    category: 'users',
                    info: '${controller.users.length}',
                  ).asGlass(
                    tintColor: Colors.orange,
                    clipBorderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => Expanded(
                  flex: 5,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.users.length,
                    physics: const ScrollPhysics(parent: null),
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return UserDashBoardCard(
                        userName: controller.users[index].name,
                        userEmail: controller.users[index].email,
                        delete: () {},
                      ).asGlass(
                        tintColor: Colors.orange,
                        clipBorderRadius: BorderRadius.circular(10),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
