import 'package:app_meteo/Screen/details_screen.dart';
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
    Weather weather;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.off(PrincipalScreen());
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Météo",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Utils.animation_builder("assets/animations/world.json", 200, 200),
            SizedBox(
              height: 5,
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
              height: 25,
            ),
            ListView.builder(
              itemCount: listWeather.length,
              itemBuilder: (context, index) {
                weather = listWeather[index];
                return GestureDetector(
                  onTap: () {
                    print("sur la liste j'ai fais un clique");
                    Get.to(() => DetailsScreen(
                          weather: listWeather[index],
                        ));
                    print(listWeather[index].location.name);
                  },
                  child: CardVillesWidget(
                    nameTown: weather.location.name,
                    country: weather.location.country,
                    temp_c: weather.current.temp_c,
                    wind: weather.current.wind_mph,
                  ),
                );
              },
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
