import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Widget.dart';

import '../../../main.dart';

class T8SignUp extends StatefulWidget {
  static String tag = '/T8SignUp';

  @override
  T8SignUpState createState() => T8SignUpState();
}

class T8SignUpState extends State<T8SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.scaffoldBackground!);

    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: appStore.scaffoldBackground,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 24),
                  text(t8_title_new_account, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                  text(t8_info_sign_up, textColor: appStore.textSecondaryColor, isLongText: true, isCentered: true),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 10),
                    child: Column(
                      children: <Widget>[
                        d8EditTextStyle(t8_hint_your_email, isPassword: false),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t8_lbl_already_have_an_account, textColor: appStore.textSecondaryColor),
                  text(t8_lbl_sign_in, textColor: t8_colorPrimary, textAllCaps: true),
                  SizedBox(height: 80),
                  Container(margin: EdgeInsets.all(24.0), child: T8Button(textContent: t8_lbl_create_account, onPressed: () {}))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
