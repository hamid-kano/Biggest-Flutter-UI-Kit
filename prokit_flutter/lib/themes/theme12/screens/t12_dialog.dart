import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme12/screens/t12_dashboard.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_colors.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_constant.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_images.dart';
import 'package:prokit_flutter/themes/theme12/utils/t12_widget.dart';

import '../../../main.dart';

class T12Dialog extends StatefulWidget {
  static String tag = '/T12Dialog';

  @override
  T12DialogState createState() => T12DialogState();
}

class T12DialogState extends State<T12Dialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return T12Dashboard();
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
    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: false, radius: spacing_standard),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(t12_tick, width: 90, height: 90).paddingTop(50),
        toolBarTitle("Successful", textColor: appStore.textPrimaryColor).paddingTop(spacing_large),
        text("You have successfully completed you bill pay", textColor: appStore.textSecondaryColor, maxLine: 5, isCentered: true, fontSize: textSizeMedium).paddingTop(spacing_control),
        text("Transaction ID: GFDRTW6363FF", textColor: t12_primary_color, fontSize: textSizeMedium).paddingTop(spacing_standard_new).paddingBottom(70),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            padding: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
            child: text("GO HOME", textColor: Colors.white, fontFamily: fontMedium),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(spacing_standard)),
            color: t12_primary_color,
            onPressed: () {
              finish(context);
              finish(context);
            },
          ),
        ).paddingAll(spacing_standard_new)
      ],
    ).paddingAll(spacing_standard_new),
  );
}
