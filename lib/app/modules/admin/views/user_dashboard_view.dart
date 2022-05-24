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
                child: const DashBoardCard(
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
                flex: 5,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  physics: const ScrollPhysics(parent: null),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return UserDashBoardCard(
                      userName: 'User Name',
                      userEmail: 'useremail@email.com',
                      delete: () {},
                    ).asGlass(
                      tintColor: Colors.orange,
                      clipBorderRadius: BorderRadius.circular(10),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
