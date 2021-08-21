import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamCardModel {
  String? image;
  String? examName;
  String? time;
  Widget? icon;
  Color? startColor;
  Color? endColor;

  ExamCardModel({this.image, this.examName, this.time, this.icon, this.startColor, this.endColor});
}
