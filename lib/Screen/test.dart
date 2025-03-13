import 'package:app_meteo/models/weather.dart';
import 'package:app_meteo/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
    _getWeather();
    super.initState();
  }

  Future<void> _getWeather() async {
    apiService
        .getWeatherData(
      'b3129c6a07b14c10a03232711251203',
      'London',
    )
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
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: weather == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Location: ${weather!.location.name}'),
                  Text('Temperature: ${weather!.current.feelslike_c}°C'),
                  Text('Humidity: ${weather!.current.humidity}%'),
                ],
              ),
            ),
    );
  }
}
