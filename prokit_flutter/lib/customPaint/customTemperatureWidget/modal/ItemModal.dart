import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/customPaint/customTemperatureWidget/modal/temprature.dart';

class Item {
  Item({
    @required this.name,
    @required this.iconOn,
    @required this.iconOff,
    @required this.active,
    @required this.color,
    @required this.type,
  });

  String? name;
  IconData? iconOn;
  IconData? iconOff;
  bool? active;
  Color? color;
  ItemType? type;
}

enum ItemType { light, temperature, tv, sound }

List<dynamic> itemList = [
  Item(
    name: 'Smart Light',
    iconOn: Icons.lightbulb_outline,
    iconOff: Icons.lightbulb_outline,
    active: false,
    color: Color(0xFFFD443C),
    type: ItemType.light,
  ),
  Temperature(
    name: 'Smart AC',
    iconOn: Icons.ac_unit,
    iconOff: Icons.ac_unit,
    active: false,
    color: Color(0xFF5D24FB),
    type: ItemType.temperature,
  ),
  Item(
    name: 'Smart TV',
    iconOn: Icons.tv_outlined,
    iconOff: Icons.tv_off_outlined,
    active: false,
    color: Color(0xFF00c853),
    type: ItemType.tv,
  ),
  Item(
    name: 'Smart Sound',
    iconOn: Icons.music_note,
    iconOff: Icons.music_note,
    active: false,
    color: Color(0xFFffab00),
    type: ItemType.sound,
  ),
];
