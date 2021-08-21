import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TrianglePainter extends CustomPainter {
  bool ? isFill;

  TrianglePainter({this.isFill});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 10
      ..style = isFill.validate(value: false)?PaintingStyle.fill:PaintingStyle.stroke;

    final path = Path();
    path.moveTo(size.width * 1 / 2, size.height * 1 / 4);
    path.lineTo(size.width * 1 / 6, size.height * 3 / 4);
    path.lineTo(size.width * 5 / 6, size.height * 3 / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}