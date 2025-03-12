import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;

  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
