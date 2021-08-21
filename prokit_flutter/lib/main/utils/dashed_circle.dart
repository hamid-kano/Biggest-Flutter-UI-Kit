library dashed_circle;

import 'dart:math';

import 'package:flutter/widgets.dart';

const int _DefaultDashes = 20;
const Color _DefaultColor = Color(0);
const double _DefaultGapSize = 3.0;
const double _DefaultStrokeWidth = 2.5;

class DashedCircle extends StatelessWidget {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;
  final Widget? child;

  DashedCircle({this.child, this.dashes = _DefaultDashes, this.color = _DefaultColor, this.gapSize = _DefaultGapSize, this.strokeWidth = _DefaultStrokeWidth});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedCirclePainter(dashes: dashes, color: color, gapSize: gapSize, strokeWidth: strokeWidth),
      child: child,
    );
  }
}

class DashedCirclePainter extends CustomPainter {
  final int dashes;
  final Color color;
  final double gapSize;
  final double strokeWidth;

  DashedCirclePainter({this.dashes = _DefaultDashes, this.color = _DefaultColor, this.gapSize = _DefaultGapSize, this.strokeWidth = _DefaultStrokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final double gap = pi / 180 * gapSize;
    final double singleAngle = (pi * 2) / dashes;

    for (int i = 0; i < dashes; i++) {
      final Paint paint = Paint()
        ..color = color
        ..strokeWidth = _DefaultStrokeWidth
        ..style = PaintingStyle.stroke;

      canvas.drawArc(Offset.zero & size, gap + singleAngle * i, singleAngle - gap * 2, false, paint);
    }
  }

  @override
  bool shouldRepaint(DashedCirclePainter oldDelegate) {
    return dashes != oldDelegate.dashes || color != oldDelegate.color;
  }
}
