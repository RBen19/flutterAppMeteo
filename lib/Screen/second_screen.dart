import 'package:app_meteo/Screen/loader_screen.dart';
import 'package:app_meteo/models/weather.dart';
import 'package:app_meteo/utils/utils_fonctions.dart';
import 'package:app_meteo/widgets/card_villes_widget.dart';
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
            Utils.animation_builder("assets/animations/world.json", 200, 200),
            SizedBox(
              height: 30,
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
            ),
            SizedBox(
              height: 35,
            ),
            /*
            Container(
              height: 180,
              width: 420,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${listWeather[0].current.temp_c}",
                              style:
                                  TextStyle(fontSize: 60, color: Colors.white)),
                          Text(
                            "degrés",
                            style: TextStyle(
                                color: Colors.deepOrange, fontSize: 20),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${listWeather[0].location.name}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  /*
                     Column(
                    children: [Text("Temperature")],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [Text("Vitesse du vent")],
                  )
                 * */
                ],
              ),
            )
           *
           * */
            CardVillesWidget()
          ],
        ),
      ),
    );
  }
}
