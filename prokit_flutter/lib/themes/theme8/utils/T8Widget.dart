import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';

import '../../../main.dart';
import 'T8Constant.dart';

TextFormField d8EditTextStyle(var hintText, {isPassword = true}) {
  return TextFormField(
    style: TextStyle(color: appStore.textPrimaryColor, fontSize: textSizeMedium, fontFamily: fontRegular),
    obscureText: isPassword,
    cursorColor: appStore.textPrimaryColor,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
      hintText: hintText,
      border: InputBorder.none,
      hintStyle: TextStyle(color: t8_textColorSecondary),
    ),
  );
}

Divider d8Divider() {
  return Divider(
    height: 1,
    color: appStore.textSecondaryColor,
    thickness: 1,
  );
}

// ignore: must_be_immutable
class T8Button extends StatefulWidget {
  var textContent;

  //   var icon;
  VoidCallback onPressed;

  T8Button({
    required this.textContent,
    required this.onPressed,
    //   @required this.icon,
  });

  @override
  T8ButtonState createState() => T8ButtonState();
}

class T8ButtonState extends State<T8Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
          decoration: boxDecoration(bgColor: t8_colorPrimary, radius: 16),
          padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: text(widget.textContent, textColor: t8_white, fontFamily: fontMedium, textAllCaps: false),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: t8_colorPrimaryDark),
                  width: 35,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: t8_white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable, camel_case_types
class t8TopBar extends StatefulWidget {
  var titleName;

  t8TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return t8TopBarState();
  }
}

// ignore: camel_case_types
class t8TopBarState extends State<t8TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: appStore.appBarColor,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              color: t8_colorPrimary,
              onPressed: () {
                finish(context);
              },
            ),
            Center(
              child: Text(
                widget.titleName,
                maxLines: 2,
                style: TextStyle(fontFamily: fontBold, fontSize: 22, color: t8_textColorPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }

  State<StatefulWidget>? createState() {
    return null;
  }
}

Container t8HeaderText(var text) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    child: Text(
      text,
      maxLines: 2,
      style: TextStyle(fontFamily: fontBold, fontSize: 22, color: appStore.textPrimaryColor),
    ),
  );
}
