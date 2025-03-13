import 'package:json_annotation/json_annotation.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  double? temp_c;
  double? wind_mph;
  double? humidity;
  double? feelslike_c;

  Current(this.temp_c, this.wind_mph, this.humidity, this.feelslike_c);

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
