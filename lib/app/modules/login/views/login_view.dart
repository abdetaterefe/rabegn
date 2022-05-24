import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabegn/app/widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.loginFormKey,
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
                  bName: 'Log in',
                  onTap: () => controller.signIn(),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Get.offNamed('/forgot'),
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const Spacer(),
                CustomButton(
                  bName: "I am New",
                  onTap: () => Get.offNamed('/signup'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
