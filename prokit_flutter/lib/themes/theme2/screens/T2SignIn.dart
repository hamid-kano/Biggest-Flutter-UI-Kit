import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Colors.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Strings.dart';
import 'package:prokit_flutter/themes/theme2/utils/T2Widgets.dart';

import '../../../main.dart';

class T2SignIn extends StatefulWidget {
  static var tag = "/T2SignIn";

  @override
  T2SignInState createState() => T2SignInState();
}

class T2SignInState extends State<T2SignIn> {
  bool passwordVisible = false;
  bool? isRemember = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Container(
            color: appStore.scaffoldBackground,
            child: Column(
              children: <Widget>[
                /*back icon*/
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                /*heading*/
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(t2_lbl_sign_in_header, maxLines: 2, style: boldTextStyle(size: 22, color: appStore.textPrimaryColor)),
                      SizedBox(width: 4),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          t1_lbl_sign_up,
                          maxLines: 2,
                          style: boldTextStyle(size: 18, color: appStore.textSecondaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                /*content*/
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(t2_hint_email, style: primaryTextStyle(size: 16)),
                      T2EditTextField(isPassword: false),
                      SizedBox(height: 25),
                      Text(t2_hint_password, style: primaryTextStyle(size: 16)),
                      T2EditTextField(isSecure: true),
                      SizedBox(height: 18),
                      Row(
                        children: <Widget>[
                          CustomTheme(
                            child: Checkbox(
                              focusColor: t2_colorPrimary,
                              activeColor: t2_colorPrimary,
                              value: isRemember,
                              onChanged: (bool? value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                            ),
                          ),
                          Text(t2_lbl_remember, style: primaryTextStyle(size: 16, color: t2_textColorSecondary))
                        ],
                      ),
                      SizedBox(height: 18),
                      t2AppButton(
                        textContent: t2_lbl_sign_in,
                        onPressed: () {
                          changeStatusColor(t2White);
                        },
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        child: Center(child: Text(t2_lbl_forgot_password, style: primaryTextStyle(color: t2_colorPrimary, size: 16))),
                        onTap: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
