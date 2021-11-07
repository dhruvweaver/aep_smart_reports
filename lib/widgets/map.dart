import 'package:aep_smart_reports/model/picture_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:photo_manager/photo_manager.dart';

import '../widgets/image_marker.dart';

class Map extends StatelessWidget {
  final PictureList picList;
  const Map({
    Key? key,
    required this.picList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Pic list length >>> ${picList.picList.length}");
    List<Marker> list = [];
    for (var i = 0; i < picList.picList.length; i++) {
      list.add(Marker(
          point: latlng.LatLng(
              picList.picList[i].lat, -1 * picList.picList[i].lng),
          builder: (ctx) => ImageMarker(
              picIdList: picList.picList[i].picIdList,
              id: "${picList.picList[i].id}")));
    }
    print("List length >>> ${list.length}");

    return FlutterMap(
      options: MapOptions(
        center: latlng.LatLng(38, -82),
        zoom: 6.5,
        rotation: 0.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']),
        MarkerLayerOptions(
          markers: list,
        ),
      ],
    );
  }
}
