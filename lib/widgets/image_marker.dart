import 'package:aep_smart_reports/screens/image_viewer_screen.dart';
import 'package:flutter/material.dart';

class ImageMarker extends StatelessWidget {
  final List<String> picIdList;
  const ImageMarker({Key? key, required this.id, required this.picIdList})
      : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Marker tapped, $id");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewerScreen(
                id: id,
                picIdList: picIdList,
              ),
            ));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
