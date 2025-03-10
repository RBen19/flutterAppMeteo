import 'package:app_meteo/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(HomeScreen());
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
