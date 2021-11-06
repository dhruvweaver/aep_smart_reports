import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  final String id;

  const ImageViewerScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image: ${widget.id}',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          InteractiveViewer(
            panEnabled: false,
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 1,
            maxScale: 3,
            child: Image.network(
                "https://pyxis.nymag.com/v1/imgs/819/12a/46aa0a6292788f5febd7065e16374fdc2a-30-drone-lede.2x.rsocial.w600.jpg"),
          )
        ],
      ),
    );
  }
}
