class PictureData {
  final int id;
  final double lat;
  final double lng;
  final List<String>? picIdList; // make non-nullable

  PictureData._internal({
    required this.id,
    required this.lat,
    required this.lng,
    required this.picIdList,
  });

  factory PictureData() {
    return PictureData._internal(id: 1, lat: 1, lng: 1, picIdList: null);
  }
}
