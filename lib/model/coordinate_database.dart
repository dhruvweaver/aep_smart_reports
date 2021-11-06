import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exif/exif.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:xml/xml.dart';

class DatabaseService {
  final String id;
  DatabaseService({required this.id});

  // collection reference
  final CollectionReference coordinates =
      FirebaseFirestore.instance.collection('coordinates');

  void sendExifToDatabase(List<AssetEntity> photos) async {
    for (AssetEntity photo in photos) {
      Map<String, IfdTag> data = await readExifFromFile(photo);
      print(data);
      coordinates.doc(id).set({
        'lat': '${data['Latitude']}',
        'lng': '${data['Longitude']}',
      });
    }
  }

  void sendXmlDataToDatabase(File kmlFile) {
    final data = XmlDocument.parse(kmlFile.readAsStringSync());
    coordinates
        .doc(id)
        .set({'lat': '${data.children}', 'lng': '${data.children}'});
  }
}
