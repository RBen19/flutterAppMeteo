import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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
                    pause: Duration(seconds: 2),
                    animatedTexts: [
                      TypewriterAnimatedText("Bienvenue dans votre app",
                          textAlign: TextAlign.center,
                          textStyle: BlueStyleHomeScreen()),
                      ScaleAnimatedText("M2 météo",
                          textAlign: TextAlign.center,
                          textStyle: OrangeStyleHomeScreen()),
                      FadeAnimatedText("Cliquez sur le button magique",
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
                print("redirection vers la page de la meteo");
              },
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                ColorizeAnimatedText('Cliquez moi',
                    textAlign: TextAlign.center,
                    textStyle: OrangeStyleHomeScreen(),
                    colors: [Colors.blueAccent, Colors.orange])
              ]),
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
