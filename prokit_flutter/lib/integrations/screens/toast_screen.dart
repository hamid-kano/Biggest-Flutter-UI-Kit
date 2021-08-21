import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/utils/colors.dart';
import 'package:prokit_flutter/integrations/utils/constants.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ToastScreen extends StatefulWidget {
  static String tag = '/ToastScreen';

  @override
  ToastScreenState createState() => ToastScreenState();
}

class ToastScreenState extends State<ToastScreen> {
  var mIsLoading = false;

  double? width;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);
    width = (MediaQuery.of(context).size.width) / 4;
    return Scaffold(
      appBar: appBar(context, "Toast"),
      body: GridView(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16),
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              toast('This is simple Toast');
            },
            child: simpleCard("Simple Toast"),
          ),
          GestureDetector(
            onTap: () {
              toast('This is custom Toast');
            },
            child: simpleCard("Custom Toast"),
          ),
          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: "This is error Toast", backgroundColor: Colors.redAccent, textColor: whiteColor, gravity: ToastGravity.BOTTOM, toastLength: Toast.LENGTH_SHORT);
            },
            child: simpleCard("Error\nToast"),
          ),
          GestureDetector(
            onTap: () {
              toast('This is in top Toast', gravity: ToastGravity.TOP);
            },
            child: simpleCard("Top\nGravity"),
          ),
          GestureDetector(
            onTap: () {
              toast('Hello ,I\'m in center', gravity: ToastGravity.CENTER);
            },
            child: simpleCard("Center Gravity"),
          ),
          GestureDetector(
            onTap: () {
              toast('This toast will display for long time', length: Toast.LENGTH_LONG);
            },
            child: simpleCard("Long\nToast"),
          )
        ],
      ),
    );
  }

  Widget simpleCard(String content) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), boxShadow: [BoxShadow(color: shadowColor, blurRadius: 10, spreadRadius: 2)], color: secondaryColor),
      child: text(content, textColor: whiteColor, fontFamily: fontMedium, maxLine: 3, isCentered: true),
    );
  }
}
