import './picture_data.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PictureList {
  List<PictureData> picList = [];

  PictureList._internal({
    required this.picList,
  });

  PictureList.usingData() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    db
        .collection("collection.col")
        .doc("C53y9V4jNwZ8PH2kT1F7")
        .get()
        .then((snapshot) {
      try {
        picList = PictureList._fromSnapshot(snapshot).picList;
        print(picList.first.id);
      } catch (e) {
        print(e);
      }
    });
  }

  factory PictureList._fromSnapshot(DocumentSnapshot snapshot) {
    List<dynamic> data = snapshot["grouped_pics"];
    // print("Map printed: $data");
    // return PictureList._internal(
    //     picList: snapshot['grouped_pics'].map<PictureData>((item) {
    //   return PictureData.fromMap(item);
    // }).toList());
    List<PictureData> picData = [];
    // // for (int i = 0; i < data.entries.length; i++) {
    // //   picData.add(PictureData.fromMap(data));
    // // }
    for (var i in data) {
      // print("iterable: $i");
      picData.add(PictureData.fromMap(i));
      // print("picData: ${picData.last.picIdList}");
    }

    return PictureList._internal(picList: picData);
  }

  static Future<PictureList> create() async {
    return PictureList.usingData();
  }

  // TODO: add method to return average coordinates between pictures for map centering
  List<double> getAvgCoord() {
    List<double> coords = List.empty();
    return coords;
  }
}
