import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_meteo/Screen/principal_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 280,
        ),
        AnimatedScreen(),
        SizedBox(
          height: 80,
        ),
      ]),
    );
  }
}

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Center(
            child: Column(
              children: [
                AnimatedTextKit(
                    repeatForever: true,
                    pause: Duration(seconds: 1),
                    animatedTexts: [
                      TypewriterAnimatedText("Bienvenue dans votre app",
                          textAlign: TextAlign.center,
                          textStyle: BlueStyleHomeScreen()),
                      ScaleAnimatedText("M2 météo",
                          textAlign: TextAlign.center,
                          textStyle: OrangeStyleHomeScreen()),
                      ScaleAnimatedText("Cliquez sur le button magique",
                          textAlign: TextAlign.center,
                          textStyle: BlueStyleHomeScreen()),
                      ColorizeAnimatedText('Pour commencer l\'experience',
                          textAlign: TextAlign.center,
                          textStyle: OrangeStyleHomeScreen(),
                          colors: [Colors.orange, Colors.indigo]),
                    ]),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                print('take me');
                Get.off(PrincipalScreen(),
                    transition: Transition.upToDown,
                    duration: Duration(seconds: 1));
              },
              child: Text(
                'Cliquez moi ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.indigo),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle OrangeStyleHomeScreen() {
    return TextStyle(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.orangeAccent);
  }

  TextStyle BlueStyleHomeScreen() {
    return TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlueAccent);
  }
}
