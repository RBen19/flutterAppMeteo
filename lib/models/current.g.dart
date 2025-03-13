// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      (json['temp_c'] as num?)?.toDouble(),
      (json['wind_mph'] as num?)?.toDouble(),
      (json['humidity'] as num?)?.toDouble(),
      (json['feelslike_c'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'temp_c': instance.temp_c,
      'wind_mph': instance.wind_mph,
      'humidity': instance.humidity,
      'feelslike_c': instance.feelslike_c,
    };
