import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as LatLng;

Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng.LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng.LatLng(51.5, -0.09),
            builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    ],
    children: <Widget>[
      TileLayerWidget(
          options: TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'])),
      MarkerLayerWidget(
          options: MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng.LatLng(51.5, -0.09),
            builder: (ctx) => Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      )),
    ],
  );
}
