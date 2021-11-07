import './picture_data.dart';

class PictureList {
  Map<String, dynamic>? picList; // make non-nullable

  PictureList._internal({
    required this.picList,
  });

  factory PictureList.fromJson() {
    return PictureList._internal(picList: null);
  }
  // TODO: add method to return average coordinates between pictures for map centering
  List<double> getAvgCoord() {
    List<double> coords = List.empty();
    return coords;
  }
}
