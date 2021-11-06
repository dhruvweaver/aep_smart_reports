import 'package:flutter/material.dart';

class NewCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset startPoint = const Offset(0, 0);
    Offset endPoint = Offset(size.width, size.height);
    Paint paint = Paint();
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(NewCustomPainter delegate) {
    return true;
  }
}
