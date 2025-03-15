import 'package:app_meteo/models/weather.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final List<Weather> listWeather;
  const SecondScreen({super.key, required this.listWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${listWeather[0].location.name}",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
