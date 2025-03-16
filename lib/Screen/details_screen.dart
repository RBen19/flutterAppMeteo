import 'package:app_meteo/models/weather.dart';
import 'package:flutter/material.dart';

import '../utils/utils_fonctions.dart';
import '../widgets/card_details_villes.dart';

class DetailsScreen extends StatelessWidget {
  final Weather weather;
  const DetailsScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Météo",
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                  child: Utils.animation_builder(
                      "assets/animations/here.json", 200, 200)),
              SizedBox(height: 30),
              Center(
                child: Text(
                  '${weather.location.name}, ${weather.location.country}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildInfoCard(Icons.thermostat_outlined, "Température",
                  "${weather.current.temp_c} °C"),
              SizedBox(height: 20),
              buildInfoCard(Icons.air, "Vitesse du vent",
                  "${weather.current.wind_mph} km/h"),
              SizedBox(height: 20),
              buildInfoCard(Icons.water_drop, "Humidité",
                  "${weather.current.humidity} %"),
              SizedBox(height: 20),
              buildInfoCard(
                  Icons.ac_unit, "Ressentie", "${weather.current.feelslike_c}"),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    print("Voir sur Maps");
                  },
                  icon: Icon(Icons.map),
                  label: Text(
                    "voir sur la carte",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
