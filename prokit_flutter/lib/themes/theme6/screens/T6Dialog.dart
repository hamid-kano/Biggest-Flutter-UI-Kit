import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/screens/T6SignIn.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Images.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';

import '../../../main.dart';

class T6Dialog extends StatefulWidget {
  static String tag = '/T6Dialog';

  @override
  T6DialogState createState() => T6DialogState();
}

class T6DialogState extends State<T6Dialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
    return T6SignIn();
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTheme(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContent(context),
      ),
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
          BoxShadow(
            color: shadowColorGlobal,
            blurRadius: 10.0,
            offset: Offset(0.0, 8.0),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: t6form_facebook),
                width: 35,
                height: 35,
                child: Icon(Icons.play_arrow, color: t6white),
              ),
            ),
            SizedBox(height: 30),
            Container(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                imageUrl: t6_ic_work4,
                height: 110,
              ),
            ),
            SizedBox(height: 30),
            text(t6_lbl_triceps_kickbacks, textColor: t6colorPrimary, fontFamily: fontMedium),
            SizedBox(height: 10),
            text(t6_sample_text, maxLine: 3, fontSize: textSizeSMedium, textColor: appStore.textSecondaryColor),
            SizedBox(height: 8),
            text(t6_sample_text, maxLine: 3, fontSize: textSizeSMedium, textColor: appStore.textSecondaryColor),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.skip_next, color: t6colorPrimary),
                  text(t6_7_15, textColor: t6colorPrimary),
                  Icon(Icons.skip_next, color: t6colorPrimary),
                ],
              ),
            )
          ],
        ),
      ));
}
