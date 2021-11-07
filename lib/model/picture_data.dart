enum objectType {
  transformers,
  poles,
}

class PictureData {
  final int id;
  final String type;
  final double lat;
  final double lng;
  final List<String> picIdList; // make non-nullable

  PictureData._internal({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    required this.picIdList,
  });

  factory PictureData.fromMap(Map<String, dynamic> data) {
    String list = data["pic_id_list"];
    list.replaceAll(' ', '');
    list.replaceAll('[', '');
    list.replaceAll(']', '');
    list.replaceAll('\'', '');
    print("List >>>>>> $list");
    return PictureData._internal(
      id: int.parse(data["type_id"]),
      type: data["type"],
      lat: double.parse(data["lat"]),
      lng: double.parse(data["lng"]),
      picIdList: list.split(','),
    );
  }
}
