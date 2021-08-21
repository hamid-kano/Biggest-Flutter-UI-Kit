import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import '../../../main.dart';
import 'T10Colors.dart';
import 'T10Constant.dart';
import 'T10Images.dart';

// ignore: must_be_immutable
class EditText extends StatefulWidget {
  var isPassword;
  var isSecure;
  var fontSize;
  var textColor;
  var fontFamily;
  var text;
  var maxLine;
  TextEditingController? mController;

  VoidCallback? onPressed;

  EditText(
      {var this.fontSize = textSizeMedium,
      var this.textColor = t10_textColorSecondary,
      var this.fontFamily = fontRegular,
      var this.isPassword = true,
      var this.isSecure = false,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1});

  @override
  State<StatefulWidget> createState() {
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isSecure) {
      return TextFormField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t10_colorPrimary,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          hintStyle: secondaryTextStyle(),
          labelStyle: secondaryTextStyle(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: appStore.textPrimaryColor!, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: appStore.textPrimaryColor!, width: 0.0),
          ),
        ),
        maxLines: widget.maxLine,
        style: TextStyle(fontSize: widget.fontSize, color: appStore.textPrimaryColor, fontFamily: widget.fontFamily),
      );
    } else {
      return TextField(
        controller: widget.mController,
        obscureText: widget.isPassword,
        cursorColor: t10_colorPrimary,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: Icon(widget.isPassword ? Icons.visibility : Icons.visibility_off, color: appStore.iconColor),
          ),
          contentPadding: EdgeInsets.fromLTRB(16, 8, 4, 8),
          hintText: widget.text,
          labelText: widget.text,
          hintStyle: secondaryTextStyle(),
          labelStyle: secondaryTextStyle(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: appStore.textPrimaryColor!, width: 0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: appStore.textPrimaryColor!, width: 0.0),
          ),
        ),
        style: TextStyle(fontSize: widget.fontSize, color: appStore.textPrimaryColor, fontFamily: widget.fontFamily),
      );
    }
  }
}

// ignore: must_be_immutable
class AppButtons extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  AppButtons({required this.textContent, required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return AppButtonsState();
  }
}

class AppButtonsState extends State<AppButtons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(color: t10_white),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
      ),
      onPressed: widget.onPressed,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[t10_gradient1, t10_gradient2]),
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
}

// ignore: must_be_immutable
class T10TopBar extends StatefulWidget {
  var titleName;

  T10TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return T10TopBarState();
  }
}

class T10TopBarState extends State<T10TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: appStore.appBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: appStore.iconColor,
              onPressed: () {
                finish(context);
              },
            ),
            Center(
              child: text(
                widget.titleName,
                fontFamily: fontBold,
                textColor: appStore.textPrimaryColor,
                fontSize: textSizeLargeMedium,
              ),
            ),
            SvgPicture.asset(t10_ic_search, color: appStore.iconColor).paddingOnly(right: 16),
          ],
        ),
      ),
    );
  }
}
