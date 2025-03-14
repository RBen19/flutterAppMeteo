import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CitiesScreen extends StatefulWidget {
  @override
  _CitiesScreenState createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final String apiKey = "b8e9f7aab439dd2d703f4707de08cf23";
  List<Map<String, String>> _citiesWeather = [];

  @override
  void initState() {
    super.initState();
    _updateCitiesWeather();
    Timer.periodic(Duration(seconds: 20), (timer) => _updateCitiesWeather());
  }

  /// 🌍 Récupérer la météo de 5 villes aléatoires dans le monde
  Future<void> _updateCitiesWeather() async {
    List<Map<String, String>> newCitiesWeather = [];

    for (int i = 0; i < 5; i++) {
      double randomLat = _randomInRange(-90, 90);
      double randomLon = _randomInRange(-180, 180);
      final url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$randomLat&lon=$randomLon&appid=$apiKey&units=metric&lang=fr");

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['name'] != null && data['name'].toString().isNotEmpty) {
            newCitiesWeather.add({
              "ville": data['name'],
              "température": "${data['main']['temp']}°C",
              "humidité": "${data['main']['humidity']}%",
              "météo": data['weather'][0]['description'].toString().capitalize(),
            });
          } else {
            i--; // Si la ville est invalide, on essaie une autre ville
          }
        }
      } catch (e) {
        newCitiesWeather.add({
          "ville": "Ville inconnue",
          "température": "Erreur",
          "humidité": "",
          "météo": "Impossible de récupérer les données"
        });
      }
    }

    setState(() {
      _citiesWeather = newCitiesWeather;
    });
  }

  /// 🔢 Générer un nombre aléatoire dans une plage
  double _randomInRange(double min, double max) {
    final random = Random();
    return min + (max - min) * random.nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text("Météo aléatoire"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),

          /// 📌 Liste des 5 villes aléatoires
          Expanded(
            child: ListView.builder(
              itemCount: _citiesWeather.length,
              itemBuilder: (context, index) {
                final city = _citiesWeather[index];
                return Card(
                  color: Colors.blueGrey[800],
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(Icons.location_city, color: Colors.white),
                    title: Text(city["ville"]!, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "🌡 Température : ${city['température']}\n"
                          "💧 Humidité : ${city['humidité']}\n"
                          "🌤 Météo : ${city['météo']}",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Extension pour mettre en majuscule la première lettre
extension StringExtension on String {
  String capitalize() {
    return this.length > 0 ? this[0].toUpperCase() + this.substring(1) : this;
  }
}
