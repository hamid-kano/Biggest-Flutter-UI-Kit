import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Colors.dart';

// ignore: must_be_immutable
class T4Button extends StatefulWidget {
  static String tag = '/T4Button';
  var textContent;
  VoidCallback onPressed;
  var isStroked = false;
  var height = 50.0;

  T4Button({required this.textContent, required this.onPressed, this.isStroked = false, this.height = 45.0});

  @override
  T4ButtonState createState() => T4ButtonState();
}

class T4ButtonState extends State<T4Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: widget.height,
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        alignment: Alignment.center,
        child: text(widget.textContent, textColor: widget.isStroked ? t4_colorPrimary : t4_white, isCentered: true, fontFamily: fontMedium, textAllCaps: true),
        decoration: widget.isStroked ? boxDecoration(bgColor: Colors.transparent, color: t4_colorPrimary) : boxDecoration(bgColor: t4_colorPrimary, radius: 4),
      ),
    );
  }
}
