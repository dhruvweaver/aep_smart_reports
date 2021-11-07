import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  final String id;
  final List<String> picIdList;
  const ImageViewerScreen({
    Key? key,
    required this.id,
    required this.picIdList,
  }) : super(key: key);

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  // Future<String> getUrl(String id) async {
  //   FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //   firebaseStorage.app = FirebaseFirestore.instance.app;
  //   firebaseStorage.bucket = 'gs://aepsmartreports.appspot.com';
  //   final ref = firebaseStorage.ref().child(id);
  //   print('Failed before download');
  //   String url = await ref.getDownloadURL().toString();
  //   print('Failed after download');
  //   return url;
  // }

  static Future<dynamic> loadImage(BuildContext context, String imageId) async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    firebaseStorage.app = FirebaseFirestore.instance.app;
    // firebaseStorage.bucket = 'gs://aepsmartreports.appspot.com';
    String url = await firebaseStorage.ref().child(imageId).getDownloadURL();
    print(url);
    url.replaceAll('///', '//');
    return url;
  }

  String url = "";

  @override
  void initState() {
    String id = widget.picIdList[0].replaceAll('[', '');
    id.replaceAll(']', '');
    id.replaceAll('\'', '');
    print(id);
    loadImage(context, id).then((value) {
      if (mounted) {
        setState(() {
          url = value;
          print("URL >>> $url");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'ID: ${widget.id}',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            // CustomPaint(
            //   child: Image.network(
            //     "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/AEP_Building_from_Rhodes_State.jpg/400px-AEP_Building_from_Rhodes_State.jpg",
            //     width: double.infinity,
            //   ),
            //   painter: NewCustomPainter(),
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              // child: Image.network(
              //   url,
              //   // "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/AEP_Building_from_Rhodes_State.jpg/400px-AEP_Building_from_Rhodes_State.jpg",
              //   width: double.infinity,
              // ),
              child: Image(image: AssetImage('assets/images/7.JPG')),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 48),
              child: TextField(
                maxLines: 5,
                // controller: widget.emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Theme.of(context).focusColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    borderSide: BorderSide(color: Theme.of(context).focusColor),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).canvasColor,
                  labelText: "Notes",
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(color: Theme.of(context).hintColor),
                ),
                autocorrect: true,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
