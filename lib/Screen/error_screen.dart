import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_meteo/Screen/loader_screen.dart';
import 'package:app_meteo/utils/utils_fonctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "OUPS !",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.deepOrangeAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Utils.animation_builder(
                      "assets/animations/fusee.json", 250, 250),
                  SizedBox(
                    height: 80,
                  ),
                  AnimatedTextKit(repeatForever: true, animatedTexts: [
                    RotateAnimatedText("Une erreur est survenue !",
                        textAlign: TextAlign.center,
                        textStyle: OrangeStyleHomeScreen()),
                    RotateAnimatedText("l'API fait des siennes !",
                        textAlign: TextAlign.center,
                        textStyle: OrangeStyleHomeScreen())
                  ]),
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  print('take me');
                  Get.off(PrincipalScreen(),
                      transition: Transition.upToDown,
                      duration: Duration(seconds: 1));
                },
                child: Text(
                  'Recommencer',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: Colors.indigo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle OrangeStyleHomeScreen() {
  return TextStyle(
      fontSize: 34, fontWeight: FontWeight.bold, color: Colors.orangeAccent);
}
