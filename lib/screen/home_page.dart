import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_strength/controller/main_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Password Strength'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Check Strength',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: TextField(
                onChanged: (value) {
                  controller.checkPwdStrength(value);
                },
                obscureText: controller.isVisible.value ? false : true,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(controller.isVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.toggleVisible();
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                    ),
                    hintText: 'Password'),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  value: controller.passwordStrength.value,
                  backgroundColor: controller.passwordStrength.value <= 1 / 4
                      ? Colors.red
                      : controller.passwordStrength.value == 2 / 4
                          ? Colors.orange
                          : controller.passwordStrength.value == 3 / 4
                              ? Colors.green
                              : Colors.black,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  controller.displayPassword.value,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ))
        ],
      ),
    );
  }
}
