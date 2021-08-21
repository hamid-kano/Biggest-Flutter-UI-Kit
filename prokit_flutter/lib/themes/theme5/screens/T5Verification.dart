import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme5/screens/T5SetPassword.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Colors.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Images.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Strings.dart';
import 'package:prokit_flutter/themes/theme5/utils/T5Widget.dart';

import '../../../main.dart';

class T5Verification extends StatefulWidget {
  static String tag = '/T5Verification';

  @override
  T5VerificationState createState() => T5VerificationState();
}

class T5VerificationState extends State<T5Verification> {
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
                  CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t5_verification, width: width / 2.5, height: width / 2.5),
                  SizedBox(height: 30),
                  text(t5_lbl_verification, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 16),
                    child: text(t5_note_verification, textColor: t5TextColorSecondary, fontFamily: fontMedium, fontSize: textSizeMedium, maxLine: 2, isCentered: true),
                  ),
                  Container(
                    margin: EdgeInsets.all(24),
                    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 4),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: 10),
                        PinEntryTextField(fields: 4, fontSize: textSizeNormal),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            T5SetPassword().launch(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: width / 8,
                            child: text(t5_continue, textColor: t5White, isCentered: true),
                            decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toast(t5_resend);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: text(t5_resend, textColor: t5ColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
                    ),
                  )
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
