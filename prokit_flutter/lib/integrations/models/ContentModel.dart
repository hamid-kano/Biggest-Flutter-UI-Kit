import 'package:flutter/material.dart';

class ContentModel {
  String title;
  String subTitle;
  String icon;
  Widget? pageName;
  Color bgColor;
  bool isExpanded;
  List<ContentModel>? items;
  String tag;

  ContentModel({this.tag = '', this.title = '', this.subTitle = '', this.icon = 'ic_smartphone.png', this.pageName, this.bgColor = Colors.blue, this.isExpanded = false, this.items});
}
