import 'dart:ui';

import 'package:flutter/material.dart';

class CustomContainerShapeBorder extends CustomPainter {
  final double? height;
  final double? width;
  final Color? fillColor;
  final double? radius;

  CustomContainerShapeBorder({
    this.height: 400.0,
    this.width: 300.0,
    this.fillColor,
    this.radius: 50.0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(0.0, -radius!);
    path.lineTo(0.0, -(height! - radius!));
    path.conicTo(0.0, -height!, radius!, -height!, 1);
    path.lineTo(width! - radius!, -height!);
    path.conicTo(width!, -height!, width!, -(height! + radius!), 1);
    path.lineTo(width!, -(height! - radius!));
    path.lineTo(width!, -radius!);

    path.conicTo(width!, 0.0, width! - radius!, 0.0, 1);
    path.lineTo(radius!, 0.0);
    path.conicTo(0.0, 0.0, 0.0, -radius!, 1);
    path.close();
    canvas.drawPath(path, Paint()..color = fillColor!);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
