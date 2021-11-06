import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image: $widget.id',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.network(
              "https://pyxis.nymag.com/v1/imgs/819/12a/46aa0a6292788f5febd7065e16374fdc2a-30-drone-lede.2x.rsocial.w600.jpg")
        ],
      ),
    );
  }
}
