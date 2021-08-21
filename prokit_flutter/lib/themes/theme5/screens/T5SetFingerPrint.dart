import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';

import '../../../main.dart';

class T5SetFingerPrint extends StatefulWidget {
  static String tag = '/T5SetFingerPrint';

  @override
  T5SetFingerPrintState createState() => T5SetFingerPrintState();
}

class T5SetFingerPrintState extends State<T5SetFingerPrint> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(t5_login, width: width / 2.5, height: width / 2.5),
                  text(t5_lbl_fingerprint, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 16),
                    child: text(t5_note_finger_set, textColor: t5TextColorSecondary, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
                  ),
                  SizedBox(height: 50),
                  GestureDetector(onTap: () {}, child: SvgPicture.asset(t5_img_fingerprint, width: width / 3.5, color: t5ColorPrimary)),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      finish(context);
                    },
                    child: Container(
                      margin: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      height: width / 8,
                      child: text(t5_continue, textColor: t5White, isCentered: true),
                      decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TopBar()
        ],
      ),
    );
  }
}
