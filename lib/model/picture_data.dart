enum objectType {
  transformers,
  poles,
}

class PictureData {
  final int id;
  final objectType type;
  final double lat;
  final double lng;
  final List<String>? picIdList; // make non-nullable

  PictureData({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    required this.picIdList,
  });

  // factory PictureData() {
  //   return PictureData._internal(
  //       id: 1, type: objectType.transformers, lat: 1, lng: 1, picIdList: null);
  // }
}
