import 'package:flutter/material.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Colors.dart';

import '../T4Constant.dart';

// ignore: must_be_immutable
class T4EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var hint;
  var maxLine;
  TextEditingController? mController;

  VoidCallback? onPressed;

  T4EditText(
      {var this.fontSize = textSizeNormal,
      var this.textColor = t4_textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.hint = "",
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return T4EditTextState();
  }
}

class T4EditTextState extends State<T4EditText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.mController,
      obscureText: widget.isPassword,
      style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular, color: t4_white),
      decoration: InputDecoration(
        suffixIcon: widget.isSecure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isPassword = !widget.isPassword;
                  });
                },
                child: new Icon(
                  widget.isPassword ? Icons.visibility : Icons.visibility_off,
                  color: t4_white,
                ),
              )
            : null,
        contentPadding: EdgeInsets.fromLTRB(16, 10, 16, 10),
        hintText: widget.hint,
        hintStyle: TextStyle(color: t4_white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: t4_white, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: t4_white, width: 0.5),
        ),
      ),
    );
  }
}
