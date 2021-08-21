import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoaderPainter extends CustomPainter
{
  Color ?buttonBorderColor;
  Color ?progressColor;
  double ?percentage;
  double ?width;
  CustomLoaderPainter({this.buttonBorderColor,this.progressColor,this.percentage,this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = buttonBorderColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Paint complete =  Paint()
      ..color = progressColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Offset center  = Offset(size.width/2, size.height/2);
    double radius  = min(size.width/2,size.height/2);
    canvas.drawCircle(
        center,
        radius,
        line
    );
    double arcAngle = 2*pi* (percentage!/100);
    canvas.drawArc(
        Rect.fromCircle(center: center,radius: radius),
        -pi/2,
        arcAngle,
        false,
        complete
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}