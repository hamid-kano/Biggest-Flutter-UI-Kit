import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Colors.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Constant.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Images.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Strings.dart';
import 'package:prokit_flutter/themes/theme1/utils/T1Widget.dart';

import '../../../main.dart';

class T1Signup extends StatelessWidget {
  static var tag = "/T1SignUp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Observer(
            builder: (_) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 30),
                  Image.asset(t1_ic_ring, height: 100, width: 100),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      formHeading(t1_lbl_sign_up_header),
                      formSubHeadingForm(t1_lbl_sign_in),
                    ],
                  ),
                  SizedBox(height: 40),
                  editTextStyle(t1_hint_fullName, isPassword: false),
                  SizedBox(height: 16),
                  editTextStyle(t1_email_phone_no, isPassword: false),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_password, isPassword: true),
                  SizedBox(height: 16),
                  editTextStyle(t1_hint_re_password, isPassword: true),
                  SizedBox(height: 20),
                  Padding(padding: const EdgeInsets.fromLTRB(40, 0, 40, 0), child: shadowButton(t1_lbl_sign_up)),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text(t1_lbl_already_have_account, textColor: appStore.textSecondaryColor, fontSize: textSizeLargeMedium),
                      SizedBox(width: 8),
                      text(t1_lbl_sign_in, fontFamily: fontMedium, textColor: t1_blue)
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
