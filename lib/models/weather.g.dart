// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      Location.fromJson(json['location'] as Map<String, dynamic>),
      json['temp_c'] as String?,
      json['wind_mph'] as String?,
      json['pressure_mb'] as String?,
      json['humidity'] as String?,
      json['feelslike_c'] as String?,
      Current.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'temp_c': instance.temp_c,
      'wind_mph': instance.wind_mph,
      'pressure_mb': instance.pressure_mb,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslike_c,
    };
