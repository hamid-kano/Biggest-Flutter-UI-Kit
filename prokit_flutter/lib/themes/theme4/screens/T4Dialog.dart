import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/screens/T4SignIn.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Constant.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4Button.dart';

import '../../../main.dart';

class T4Dialog extends StatefulWidget {
  static var tag = "/T4Dialog";

  @override
  T4DialogState createState() => T4DialogState();
}

class T4DialogState extends State<T4Dialog> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T4SignIn();
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: appStore.scaffoldBackground,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          text("Would you like to get updates and notifications?", fontSize: textSizeLargeMedium, maxLine: 2, isCentered: true, textColor: appStore.textPrimaryColor, fontFamily: fontSemibold),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              T4Button(
                textContent: t4_lbl_allow,
                onPressed: () {},
              ),
              SizedBox(width: 24),
              T4Button(
                textContent: t4_lbl_deny,
                isStroked: true,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ));
}
