import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/themes/theme11/utils/T11Colors.dart';

SizedBox buttonStyle(var text) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: MaterialButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
      textColor: t11_WhiteColor,
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
      color: t11_PrimaryColor,
      onPressed: () => {},
    ),
  );
}
