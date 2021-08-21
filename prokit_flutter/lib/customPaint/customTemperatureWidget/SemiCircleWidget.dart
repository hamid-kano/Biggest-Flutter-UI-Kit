import 'dart:math' as math;

import 'package:flutter/material.dart';

class SemiCircleWidget extends StatelessWidget {
  final double? diameter;
  final double? sweepAngle;
  final Color? color;

  SemiCircleWidget({
    this.diameter = 200,
    this.sweepAngle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: MyPainter(sweepAngle, color),
        size: Size(diameter!, diameter!),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(this.sweepAngle, this.color);

  final double? sweepAngle;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 60.0
      ..style = PaintingStyle.stroke
      ..color = color!;

    double degToRad(double deg) => deg * (math.pi / 180.0);

    final path = Path()
      ..arcTo(
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height,
            width: size.width,
          ),
          degToRad(180),
          degToRad(sweepAngle!),
          false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
