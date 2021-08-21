import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ArcPainter extends CustomPainter {
  bool ? isFill;

  ArcPainter({this.isFill});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 10
      ..style = isFill.validate(value: false) ? PaintingStyle.fill:PaintingStyle.stroke;

    final arc1 = Path();
    arc1.moveTo(size.width * 0.2, size.height * 0.2);
    arc1.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.2),
      radius: Radius.circular(150),
      clockwise: false,
    );

    canvas.drawPath(arc1, paint);

    canvas.drawPath(arc1, paint);

    final arc2 = Path();
    arc2.moveTo(size.width * 0.2, size.height * 0.8);
    arc2.arcToPoint(
      Offset(size.width * 0.8, size.height * 0.8),
      radius: Radius.circular(150),
    );

    canvas.drawPath(arc2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}