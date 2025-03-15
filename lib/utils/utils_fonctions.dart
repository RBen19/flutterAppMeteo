import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Utils {
  static ClipRRect animation_builder(
      String pathAnimation, double height, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Lottie.asset(
        '${pathAnimation}',
        fit: BoxFit.fill,
        height: height,
        width: width,
      ),
    );
  }

  static TextStyle PersonnalStyleSizeWeightColors(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  static TextStyle BlueStyleHomeScreen() {
    return TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlueAccent);
  }

  TextStyle OrangeStyleHomeScreen() {
    return TextStyle(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.orangeAccent);
  }
}
