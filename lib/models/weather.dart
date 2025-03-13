import 'package:app_meteo/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

import 'current.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  late final Location location;
  late final Current current;
  String? temp_c;
  String? wind_mph;
  String? pressure_mb;
  String? humidity;
  String? feelslike_c;

  Weather(this.location, this.temp_c, this.wind_mph, this.pressure_mb,
      this.humidity, this.feelslike_c, this.current);

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
