import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';

import '../../../main.dart';

class T1Login extends StatefulWidget {
  static var tag = "/T1SignIn";

  @override
  _T1LoginState createState() => _T1LoginState();
}

class _T1LoginState extends State<T1Login> {
  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) => Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Image.asset(t1_ic_ring, height: 100, width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading(t1_lbl_sign_in_header),
                      formSubHeadingForm(t1_lbl_sign_up),
                    ],
                  ),
                  SizedBox(height: 50),
                  editTextStyle(t1_user_name, isPassword: false),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_password, isPassword: true),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: CustomTheme(
                      child: CheckboxListTile(
                        title: text(t1_lbl_remember, textColor: appStore.textSecondaryColor),
                        value: rememberMe,
                        onChanged: (newValue) {
                          rememberMe = newValue;
                          setState(() {});
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(padding: EdgeInsets.fromLTRB(40, 16, 40, 16), child: shadowButton(t1_lbl_sign_in)),
                  SizedBox(height: 24),
                  text(t1_lbl_forgot_password, textColor: appStore.textPrimaryColor, fontFamily: fontMedium)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
