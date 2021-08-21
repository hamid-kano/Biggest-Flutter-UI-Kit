import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  static double oneDegreeInRadian = 0.01745329252;

  final Color? secondsPointerColor;
  final Color? otherPaintersColor;

  final double? strokeWidth;

  final Color? hourAndMinutePainterColor;
  final double? hoursAndMinuteLineWidth;
  final double? secondsLine;

  Paint? _innerCircle;
  Paint? _outerArc;

  Paint? _hoursLine;
  Paint? _minutesLine;
  Paint? _secondsLine;
  Paint? _innerCenterCicle;
  Paint? _outerCenterCicle;

  double? x;
  double? y;
  double? height;
  double? width;
  double? circumference;

  ClockPainter({
    this.otherPaintersColor = Colors.white,
    this.strokeWidth = 20.0,
    this.hourAndMinutePainterColor = Colors.white,
    this.hoursAndMinuteLineWidth = 8.0,
    this.secondsPointerColor,
    this.secondsLine = 8.0,
    this.x,
    this.y,
    this.height,
    this.width,
    this.circumference,
  }) {
    _innerCircle = Paint()
      ..color = Color(0xFF292929)
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    _outerArc = Paint()
      ..color = otherPaintersColor!
      ..strokeWidth = strokeWidth!
      ..style = PaintingStyle.stroke;

    _secondsLine = Paint()
      ..color = secondsPointerColor ?? Color(0xFFA33535)
      ..strokeWidth = secondsLine!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _minutesLine = Paint()
      ..color = hourAndMinutePainterColor!
      ..strokeWidth = hoursAndMinuteLineWidth!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _hoursLine = Paint()
      ..color = hourAndMinutePainterColor!
      ..strokeWidth = hoursAndMinuteLineWidth!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _innerCenterCicle = Paint()
      ..color = secondsPointerColor ?? Color(0xFFA33535)
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    _outerCenterCicle = Paint()
      ..color = otherPaintersColor!
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final _centerX = x ?? size.width / 2;
    final _centerY = y ?? size.height / 2;
    final _center = Offset(_centerX, _centerY);
    final _radius = min(_centerX, _centerY);
    final _circleCircunferenceSize = pi * 2;

    final _now = DateTime.now();

    final _hourLineWidth = (_radius / 2);
    final _hourRadians = degreeToRadian((360 / 12) * _now.hour);

    final _minuteLineWidth = (_radius / 1.25);
    final _minuteRadians = degreeToRadian((360 / 60) * _now.minute);

    final _secondsLineWith = (_radius / 1.25);
    final _secondsRadians = degreeToRadian((360 / 60) * _now.second);

    canvas.drawArc(
      Rect.fromCenter(
        center: _center,
        width: width ?? size.width,
        height: height ?? size.height,
      ),
      0,
      circumference ?? _circleCircunferenceSize,
      false,
      _outerArc!,
    );

    canvas.drawCircle(
      _center,
      _radius,
      _innerCircle!,
    );

    canvas.drawLine(
      Offset(
        _centerX + cos(_hourRadians) * _hourLineWidth,
        _centerX + sin(_hourRadians) * _hourLineWidth,
      ),
      _center,
      _hoursLine!,
    );

    canvas.drawLine(
      Offset(
        _centerX + cos(_minuteRadians) * _minuteLineWidth,
        _centerX + sin(_minuteRadians) * _minuteLineWidth,
      ),
      _center,
      _minutesLine!,
    );

    canvas.drawCircle(_center, 4, _outerCenterCicle!);
    canvas.drawCircle(_center, 3, _innerCenterCicle!);

    canvas.drawLine(
      Offset(
        _centerX + cos(_secondsRadians) * _secondsLineWith,
        _centerX + sin(_secondsRadians) * _secondsLineWith,
      ),
      _center,
      _secondsLine!,
    );
  }

  double degreeToRadian(double degree) => oneDegreeInRadian * degree;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
