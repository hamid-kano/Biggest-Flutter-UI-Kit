import 'package:flutter/material.dart';

class DatingAppModel {
  String? name;
  String? image;
  String? subTitle;
  String? subTitle1;
  bool? mISCheck;
  Widget? widget;
  Color? color;
  int?age;
  String? education;

  DatingAppModel({this.name, this.image, this.subTitle, this.subTitle1, this.mISCheck=false, this.widget, this.color,this.age,this.education});
}

class DAMessageModel {
  int? senderId;
  int? receiverId;
  String? msg;
  String? time;

  DAMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}
