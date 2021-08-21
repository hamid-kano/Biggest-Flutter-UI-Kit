import 'dart:ui';

import 'package:flutter/material.dart';

const t3_colorPrimary = Color(0xFFfc4a1a);
const t3_colorPrimaryDark = Color(0xFFf7b733);
const t3_colorAccent = Color(0xFFf7b733);

const t3_app_background = Color(0xFFf8f8f8);
const t3_view_color = Color(0xFFDADADA);
const t3_gray = Color(0xFFF4F4F4);

const t3_red = Color(0xFFF12727);
const t3_green = Color(0xFF8BC34A);
const t3_edit_background = Color(0xFFF5F4F4);
const t3_light_gray = Color(0xFFCECACA);
const t3_tint = Color(0xFFF4704C);
const t3_colorPrimary_light = Color(0xFFF36F4B);
const t3_orange = Color(0xFFF13E0A);

const t3_white = Color(0xFFffffff);
const t3_black = Color(0xFF000000);
const t3_icon_color = Color(0xFF747474);

const t3_shadow = Color(0x70E2E2E5);
var t3White = materialColor(0xFFFFFFFF);
const shadow_color = Color(0x95E9EBF0);

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor materialColor(colorHax) {
  return MaterialColor(colorHax, color);
}

MaterialColor colorCustom = MaterialColor(0XFF5959fc, color);
