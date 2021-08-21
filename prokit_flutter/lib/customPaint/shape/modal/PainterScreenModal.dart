import 'package:flutter/cupertino.dart';
import 'package:prokit_flutter/customPaint/shape/CirclePainter.dart';
import 'package:prokit_flutter/customPaint/shape/LinePainter.dart';
import 'package:prokit_flutter/customPaint/shape/RectanglePainter.dart';
import 'package:prokit_flutter/customPaint/shape/RoundedRectanglePainter.dart';
import 'package:prokit_flutter/customPaint/shape/ShapeScreen.dart';
import 'package:prokit_flutter/customPaint/shape/TrianglePainter.dart';

class PainterScreenModal {
  String? shapeName;
  PaintType? paint;

  PainterScreenModal({this.shapeName, this.paint});


  static List<PainterScreenModal> getData(){

    List<PainterScreenModal> list = [];

    list.add(PainterScreenModal(shapeName: "Circle",paint: PaintType.CIRCLE));
    list.add(PainterScreenModal(shapeName: "Rectangle",paint: PaintType.RECTANGLE));
    list.add(PainterScreenModal(shapeName: "RoundRectangle",paint: PaintType.ROUND_RECTANGLE));
    list.add(PainterScreenModal(shapeName: "Triangle",paint: PaintType.TRIANGLE));
    list.add(PainterScreenModal(shapeName: "Line",paint: PaintType.LINE));


    return list;
  }
}
