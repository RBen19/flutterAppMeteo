import 'package:app_meteo/Screen/loader_screen.dart';
import 'package:app_meteo/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(PrincipalScreen());
              },
              child: Text(
                'Recommencer',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    color: Colors.indigo),
              ),
            )
          ],
        ),
      ),
    );
  }
}
