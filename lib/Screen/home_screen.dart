import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/animated_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "M2 Météo",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.deepOrangeAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          animation_builder('assets/animations/animation2.json'),
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

  ClipRRect animation_builder(String pathAnimation) {
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
