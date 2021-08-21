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
import 'T5Dialog.dart';

class T5SignIn extends StatefulWidget {
  static String tag = '/T5SignIn';

  @override
  T5SignInState createState() => T5SignInState();
}

class T5SignInState extends State<T5SignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(t5White);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(appStore.appBarColor!);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(t5_login, width: width / 2.5, height: width / 2.5),
              text(t5_heading_login, textColor: appStore.textPrimaryColor, fontFamily: fontBold, fontSize: 22.0),
              Container(
                margin: EdgeInsets.all(24),
                decoration: boxDecoration(bgColor: appStore.scaffoldBackground, showShadow: true, radius: 4),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 10),
                    EditText(
                      hint: t5_hint_phone_no,
                      isPassword: false,
                    ),
                    SizedBox(height: 16),
                    EditText(hint: t5_hint_password, isSecure: true),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        toast(t5_forgot_pswd);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
                        child: text(t5_forgot_pswd, textColor: t5ColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              toast("Sign in clicked");
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
                              alignment: Alignment.center,
                              height: width / 8,
                              child: text(t5_sign_in, textColor: t5White, isCentered: true),
                              decoration: boxDecoration(bgColor: t5ColorPrimary, radius: 8),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog(),
                              );
                            },
                            child: SvgPicture.asset(t5_img_fingerprint, width: width / 8.2, color: t5ViewColor))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
