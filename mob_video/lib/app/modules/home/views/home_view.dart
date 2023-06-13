import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mob_video/app/modules/auth/controllers/auth_controller.dart';
import 'package:mob_video/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController auth = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (auth.userName == 'Admin')
              Column(
                children: [
                  const Center(
                    child: Text(
                      'Pic File',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.getFile();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text('Upload'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.files.length,
                  itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PLAY,
                            arguments: controller.files[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(color: Colors.red),
                            ),
                            Text(
                              '.  ${controller.files[index].name}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ))))),
            )
          ],
        ),
      ),
    );
  }
}
