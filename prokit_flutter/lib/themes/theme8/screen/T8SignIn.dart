import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Constant.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Strings.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Widget.dart';

class T8SignIn extends StatefulWidget {
  static String tag = '/T8SignIn';

  @override
  T8SignInState createState() => T8SignInState();
}

class T8SignInState extends State<T8SignIn> {
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
                  text(t8_title_login, textColor: appStore.textPrimaryColor, fontSize: textSizeNormal, fontFamily: fontBold),
                  text(t8_info_login, textColor: appStore.textSecondaryColor, isLongText: true, isCentered: true),
                  Container(
                    margin: EdgeInsets.all(24.0),
                    decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 10),
                    child: Column(
                      children: <Widget>[
                        d8EditTextStyle(t8_hint_your_email, isPassword: false),
                        d8Divider(),
                        d8EditTextStyle(t8_hint_your_password),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  text(t8_lbl_don_t_have_an_account),
                  text(t8_lbl_create_account, textColor: t8_colorPrimary),
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
