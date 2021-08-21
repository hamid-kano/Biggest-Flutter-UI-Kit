import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';

import '../../../main.dart';
import 'T13SettingScreen.dart';

class T13DialogScreen extends StatefulWidget {
  static String tag = '/T13DialogScreen';

  @override
  T13DialogScreenState createState() => T13DialogScreenState();
}

class T13DialogScreenState extends State<T13DialogScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T13SettingScreen();
  }
}

Widget mLabel(String value) {
  return Padding(
    padding: EdgeInsets.all(spacing_standard_new),
    child: text(value.toUpperCase(), fontSize: 14.0),
  );
}

var mView = Divider(
  height: 1,
  color: t13_view_color,
);

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
  return Column(
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, 0, spacing_standard_new),
          alignment: Alignment.centerRight,
          child: Icon(Icons.close, color: t13_textColorSecondary),
        ),
      ),
      SizedBox(height: spacing_large),
      Container(
          decoration: BoxDecoration(
            color: appStore.scaffoldBackground,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max, // To make the card compact
            children: <Widget>[
              mLabel(t13_lbl_low_to_high_s),
              mView,
              mLabel(t13_lbl_high_to_low_s),
              mView,
              mLabel(t13_lbl_date_posted_new_to_old),
              mView,
              mLabel(t13_lbl_date_posted_old_to_new),
              mView,
              mLabel(t13_lbl_distance_to_your_location),
            ],
          )),
      SizedBox(
        height: spacing_large,
      ),
      T13Button(
          textContent: t13_lbl_apply,
          onPressed: () {
            finish(context);
          }),
    ],
  );
}
