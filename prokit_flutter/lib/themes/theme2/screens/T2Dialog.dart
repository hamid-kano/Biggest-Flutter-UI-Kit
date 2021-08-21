import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/screens/T2Profile.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Images.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';

import '../../../main.dart';

class T2Dialog extends StatefulWidget {
  static var tag = "/T2Dialog";

  @override
  T2DialogState createState() => T2DialogState();
}

class T2DialogState extends State<T2Dialog> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);

    Future.delayed(Duration(milliseconds: 1000), () {
      showDialog(context: context, builder: (BuildContext context) => CustomDialog());
    });
    return Observer(builder: (_) => T2Profile());
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
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0.0, 10.0)),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: appStore.iconColor),
            ),
          ),
          Image.asset(t2_ic_dialog, color: t2_colorPrimary, width: 95, height: 95),
          SizedBox(height: 24),
          Text("Congratulations!", style: boldTextStyle(color: t2_colorPrimary, size: 24)),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(t2_sample_text, style: primaryTextStyle(size: 16), textAlign: TextAlign.center).center(),
          ),
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              color: t2_colorPrimary,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
            ),
            alignment: Alignment.center,
            child: Text(t2_lbl_try_again, style: boldTextStyle(color: white, size: 20)),
          )
        ],
      ));
}
