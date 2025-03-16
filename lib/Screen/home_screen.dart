import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controller/theme_controller.dart';
import '../widgets/animated_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "M2 Météo",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.deepOrangeAccent),
        ),
        leading: IconButton(onPressed: () {
          themeController.changeMode();
        }, icon: Obx(() {
          return Icon(
            themeController.isDarkMode.value
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round,
            color: themeController.isDarkMode.value
                ? Colors.yellow
                : Colors.deepOrange,
            size: 45,
          );
        })),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Obx(() {
            return themeController.isDarkMode.value
                ? animation_builder('assets/animations/onthemoon.json')
                : animation_builder('assets/animations/animation2.json');
          }),
          // animation_builder('assets/animations/animation2.json'),
          SizedBox(
            height: 80,
          ),
          Center(child: AnimatedScreen()),
          SizedBox(
            height: 50,
          ),
          animation_builder('assets/animations/animation3.json')
        ]),
      ),
    );
  }

  static ClipRRect animation_builder(String pathAnimation) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Lottie.asset(
        '${pathAnimation}',
        fit: BoxFit.fill,
        height: 250,
        width: 250,
      ),
    );
  }
}
