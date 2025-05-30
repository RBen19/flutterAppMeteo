import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_meteo/Screen/weather_screen.dart';
import 'package:app_meteo/utils/utils_fonctions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../models/weather.dart';
import '../services/api_service.dart';
import 'error_screen.dart';

class PrincipalScreen extends StatefulWidget {
  @override
  _PrincipalScreenState createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  List<String> randomTown = [];
  List<Weather> weatherListLoader = [];
  int cpt = 0;
  List<Future> weatherFutures = [];
  double _progress = 0.0;
  int _messageIndex = 0;
  late ApiService apiService;
  Weather? weather;
  final List<String> _messages = [
    "Nous téléchargeons les données…",
    "C’est presque fini…",
    "Plus que quelques secondes",
    "avant d’avoir le résultat…"
  ];

  @override
  initState() {
    super.initState();
    final dio = Dio(BaseOptions(contentType: "application/json"));
    apiService = ApiService(dio);

    _getWeather();
  }

  Future<void> _getWeather() async {
    List<String> capitals = List.from(Utils.capitals);
    capitals.shuffle();
    randomTown = capitals.take(5).toList();

    for (String town in randomTown) {
      weatherFutures.add(
        apiService
            .getWeatherData('b3129c6a07b14c10a03232711251203', town, 'fr')
            .then((data) {
          setState(() {
            weatherListLoader.add(data);
            cpt = cpt + 1;
            print("La valeur du compteur est ${cpt}");
            print("La taille de la liste est ${Utils.weatherList.length}");
            weather = data;
            print(data.location.name);
            print(data.current.feelslike_c);
            print(data.current.temp_c);
            _startLoading();
            print("Après que le loader ait fait son taf");
            print("${data.current.wind_mph} vitesse du vent");
          });
        }).catchError((e) {
          print('Error: $e');
          Get.off(() => ErrorScreen());
        }),
      );
    }

    await Future.wait(weatherFutures);
    print("nombre de promesses ${weatherFutures.length}");
    if (cpt == 5) {
      Get.off(() => SecondScreen(
            listWeather: weatherListLoader,
          ));

      // gotoPrincipalScreen();
    }
  }

  void _startLoading() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_progress < 1.0) {
        setState(() {
          _progress += 0.2;
          _messageIndex = (_messageIndex + 1) % _messages.length;
        });
      } else {
        timer.cancel();
        print('Fin du timer');
        // Redirection vers la page CitiesScreen
        // _redirectToCitiesScreen();
        // gotoPrincipalScreen();
      }
    });
    if (cpt == 5) {
      // gotoPrincipalScreen();
    }
  }

  void gotoPrincipalScreen() {
    Get.to(PrincipalScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blueGrey[900],
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Utils.animation_builder(
                    "assets/animations/couldAnimation.json", 250, 250),
                SizedBox(
                  height: 50,
                ),
                SpinKitWave(
                  color: Colors.deepOrangeAccent,
                  size: 50.0,
                ),
                SizedBox(height: 20),
                LinearProgressIndicator(
                  value: _progress,
                  backgroundColor: Colors.grey[700],
                  color: Colors.blueAccent,
                  minHeight: 8,
                ),
              ],
            ),
          ),
          SizedBox(height: 90),
          Positioned(
            bottom: 300,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AnimatedTextKit(animatedTexts: [
                  FadeAnimatedText(
                    _messages[0],
                    textStyle:
                        TextStyle(color: Colors.blueAccent, fontSize: 20),
                  ),
                  RotateAnimatedText(_messages[1],
                      textStyle: TextStyle(
                          color: Colors.deepOrangeAccent, fontSize: 20)),
                  FadeAnimatedText(_messages[2],
                      textStyle:
                          TextStyle(color: Colors.blueAccent, fontSize: 20)),
                  WavyAnimatedText(
                    _messages[3],
                    textStyle:
                        TextStyle(color: Colors.blueAccent, fontSize: 20),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
