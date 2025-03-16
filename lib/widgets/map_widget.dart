import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final double lat;
  final double lon;
  const MapWidget({super.key, required this.lat, required this.lon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapWidgetmethods(this.lat, this.lon),
    );
  }
}

Widget MapWidgetmethods(double lat, double lon) {
  return FlutterMap(
    options: MapOptions(
        initialCenter: LatLng(lat, lon),
        initialZoom: 15.0,
        interactionOptions:
            InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom)),
    children: [
      openStreetMapTileLayer,
      MarkerLayer(markers: [
        Marker(
            point: LatLng(lat, lon),
            width: 60,
            height: 60,
            alignment: Alignment.center,
            child: Icon(
              Icons.location_pin,
              size: 60,
              color: Colors.red,
            ))
      ])
    ],
  );
}

TileLayer get openStreetMapTileLayer => TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'dev.fleaflet.flutter_map.example');
