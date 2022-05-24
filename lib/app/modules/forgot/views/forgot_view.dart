import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/widgets/custom_button.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.forgotFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  controller: controller.emailController,
                  validator: (value) => controller.validateEmail(value),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  bName: 'Procced',
                  onTap: () => controller.forgot(),
                ),
                const Spacer(),
                CustomButton(
                  bName: 'I remembered it',
                  onTap: () => Get.offNamed('/login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
