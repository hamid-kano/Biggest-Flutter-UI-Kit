import 'package:flutter/material.dart';

const t2_colorPrimary = Color(0XFF5959fc);
const t2_colorPrimaryDark = Color(0XFF7900F5);
const t2_colorPrimaryLight = Color(0XFFF2ECFD);
const t2_colorAccent = Color(0XFF7e05fa);
const t2_textColorPrimary = Color(0XFF212121);
const t2_textColorSecondary = Color(0XFF747474);
const t2_app_background = Color(0XFFf8f8f8);
const t2_view_color = Color(0XFFDADADA);
const t2_white = Color(0XFFFFFFFF);
const t2_icon_color = Color(0XFF747474);
const t2_blue = Color(0XFF1C38D3);
const t2_orange = Color(0XFFFF5722);
const t2_background_bottom_navigation = Color(0XFFE9E7FE);
const t2_background_selected = Color(0XFFF3EDFE);
const t2_green = Color(0XFF5CD551);
const t2_red = Color(0XFFFD4D4B);
const t2_card_background = Color(0XFFFaFaFa);
const t2_bg_bottom_sheet = Color(0XFFE8E6FD);
const t2_instagram_pink = Color(0XFFCC2F97);
const t2_linkedin_pink = Color(0XFF0c78b6);
var t2lightStatusBar = materialColor(0XFFEAEAF9);
var t2White = materialColor(0XFFFFFFFF);
var t2TextColorPrimary = materialColor(0XFF212121);
const shadow_color = Color(0XFFECECEC);

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
