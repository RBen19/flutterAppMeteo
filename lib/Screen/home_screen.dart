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
        AnimatedScreen()
      ]),
    );
  }
}

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(
        child: AnimatedTextKit(
            repeatForever: true,
            pause: Duration(seconds: 2),
            animatedTexts: [
              TypewriterAnimatedText("Bienvenue dans votre app ...",
                  textAlign: TextAlign.center,
                  textStyle: BlueStyleHomeScreen()),
              ScaleAnimatedText("M2 météo",
                  textAlign: TextAlign.center,
                  textStyle: OrangeStyleHomeScreen()),
              FadeAnimatedText("Ciquer sur le button magique",
                  textAlign: TextAlign.center,
                  textStyle: BlueStyleHomeScreen()),
              ColorizeAnimatedText('Pour commencer l\'experience',
                  textAlign: TextAlign.center,
                  textStyle: OrangeStyleHomeScreen(),
                  colors: [Colors.orange, Colors.indigo]),
            ]),
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
