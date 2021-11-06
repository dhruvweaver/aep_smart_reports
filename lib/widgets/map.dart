import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../widgets/image_marker.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(52.999, -1.015),
        zoom: 13.0,
        rotation: 0.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 20.0,
              height: 20.0,
              point: LatLng(53, -1),
              builder: (ctx) => const ImageMarker(id: '002'),
            ),
            Marker(
              width: 20.0,
              height: 20.0,
              point: LatLng(52.998, -1.03),
              builder: (ctx) => const ImageMarker(id: '002'),
            ),
          ],
        ),
      ],
    );
  }
}
