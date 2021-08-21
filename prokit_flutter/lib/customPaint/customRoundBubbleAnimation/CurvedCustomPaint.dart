import 'package:flutter/material.dart';
import 'dart:math' as math;

class CurvedCustomPaint extends CustomPainter {
  List<Circular>? circulars;

  CurvedCustomPaint(this.circulars);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = circulars!.length - 1; i >= 0; i--) {
      Circular c = circulars![i];
      c.draw(canvas);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Circular {
  double r;
  double x;
  double y;
  Color color;

  double ySpeed;
  double opcitySpeed = 30.0;

  Circular(this.x, this.y, this.r, this.color) : ySpeed = random(3, math.max(r.toInt(), 6)).toDouble();

  draw(Canvas canvas) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(x, y),
      r,
      paint,
    );
  }
  update() {
    y += ySpeed;
    color = Color.fromARGB(
      (color.opacity - opcitySpeed).toInt(),
      color.red,
      color.green,
      color.blue,
    );
  }

  edge(double maxH) {
    return y > maxH + r;
  }
}
int random(int min, int max) {
  final _random = math.Random();
  return min + _random.nextInt(max - min + 1);
}