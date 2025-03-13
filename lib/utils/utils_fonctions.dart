import 'package:flutter/cupertino.dart';
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
}
