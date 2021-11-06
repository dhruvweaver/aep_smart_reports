import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  final String id;

  const ImageViewerScreen({Key? key, required this.id}) : super(key: key);

  @override
  _ImageViewerScreenState createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  // void onPanStart(DragStartDetails details) {
  //   print('User started drawing');
  //   final box = context.findRenderObject() as RenderBox;
  //   final point = box.globalToLocal(details.globalPosition);
  //   print(point);
  // }

  // void onPanUpdate(DragUpdateDetails details) {
  //   final box = context.findRenderObject() as RenderBox;
  //   final point = box.globalToLocal(details.globalPosition);
  //   print(point);
  // }

  // void onPanEnd(DragEndDetails details) {
  //   print('User ended drawing');
  // }

  // GestureDetector buildCurrentPath(BuildContext context) {
  //   return GestureDetector(
  //     onPanStart: onPanStart,
  //     onPanUpdate: onPanUpdate,
  //     onPanEnd: onPanEnd,
  //     child: RepaintBoundary(
  //       child: Container(
  //         color: Colors.transparent,
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         // CustomPaint widget will go here
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'Image: ${widget.id}',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/AEP_Building_from_Rhodes_State.jpg/400px-AEP_Building_from_Rhodes_State.jpg",
                width: double.infinity,
              ),
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
