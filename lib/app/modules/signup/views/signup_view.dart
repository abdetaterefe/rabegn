import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/widgets/custom_button.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.signupFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Name"),
                  controller: controller.nameController,
                  validator: (value) => controller.validateName(value),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Email"),
                  controller: controller.emailController,
                  validator: (value) => controller.validateEmail(value),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Password"),
                  controller: controller.passwordController,
                  obscureText: true,
                  validator: (value) => controller.validatePass(value),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  bName: 'Sign up',
                  onTap: () => controller.signUp(),
                ),
                const Spacer(),
                CustomButton(
                  bName: "I've been Here",
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
