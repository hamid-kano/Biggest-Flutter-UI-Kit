import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Colors.dart';

import 'T9Constant.dart';

// ignore: non_constant_identifier_names
Container T9EditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(radius: 40, showShadow: true, bgColor: t9_white),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: t9_white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: t9_white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: t9_white, width: 0.0),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class T9Button extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  T9Button({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return T9ButtonState();
  }
}

class T9ButtonState extends State<T9Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: t9_white),
        primary: t9_colorPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.textContent,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  State<StatefulWidget>? createState() {
    // TODO: implement createState
    return null;
  }
}
