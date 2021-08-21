import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/main/utils/AppConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Colors.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Images.dart';
import 'package:prokit_flutter/themes/theme4/utils/T4Strings.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4Button.dart';
import 'package:prokit_flutter/themes/theme4/utils/widgets/T4EditText.dart';

class T4SignIn extends StatefulWidget {
  static String tag = '/T4SignIn';

  @override
  T4SignInState createState() => T4SignInState();
}

class T4SignInState extends State<T4SignIn> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    changeStatusColor(Colors.transparent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: t4_bg,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Color(0XD5160336), Color(0XD5160336)],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(left: 24, right: 24, top: height * 0.1),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t4_icon, width: width / 3.2),
                    SizedBox(height: 40),
                    T4EditText(hint: t4_hint_Email, isPassword: false),
                    SizedBox(height: 24),
                    T4EditText(hint: t4_hint_password, isSecure: true),
                    SizedBox(height: 24),
                    T4Button(
                      textContent: t4_lbl_login,
                      onPressed: () {},
                    ),
                    SizedBox(height: 48),
                    text(t4_lbl_login_with, textColor: t4_white, fontFamily: fontMedium, fontSize: textSizeLargeMedium),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: width / 7,
                          height: width / 7,
                          padding: EdgeInsets.all(width / 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: t4_white,
                          ),
                          child: SvgPicture.asset(t4_google, color: t4_form_google),
                        ),
                        SizedBox(width: 24),
                        Container(
                          width: width / 7,
                          height: width / 7,
                          padding: EdgeInsets.all(width / 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: t4_white,
                          ),
                          child: SvgPicture.asset(t4_fb, color: t4_form_facebook),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
