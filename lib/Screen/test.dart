import 'package:app_meteo/models/weather.dart';
import 'package:app_meteo/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return TestWeather();
  }
}

class TestWeather extends StatefulWidget {
  const TestWeather({super.key});

  @override
  State<TestWeather> createState() => _TestWeatherState();
}

class _TestWeatherState extends State<TestWeather> {
  late ApiService apiService;
  Weather? weather;

  @override
  void initState() {
    // TODO: implement initState
    final dio = Dio(BaseOptions(contentType: "application/json"));
    apiService = ApiService(dio);
    // _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    apiService
        .getWeatherData('b3129c6a07b14c10a03232711251203', 'Dakar', 'fr')
        .then((data) {
      setState(() {
        weather = data;
        print(data.location.name);
        print(data.current.feelslike_c);
      });
    }).catchError((e) {
      print('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
          initialCenter: LatLng(1.2878, 103.8666),
          initialZoom: 15.0,
          interactionOptions:
              InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
      children: [openStreetMapTileLayer],
    );
  }

  TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example');
}
