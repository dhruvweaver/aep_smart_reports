import 'package:aep_smart_reports/screens/image_viewer_screen.dart';
import 'package:flutter/material.dart';

class ImageMarker extends StatelessWidget {
  const ImageMarker({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Marker tapped, $id");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageViewerScreen(id: id),
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
