import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Colors.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Constant.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Images.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Strings.dart';
import 'package:prokit_flutter/themes/theme13/utils/T13Widget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class T13SignInScreen extends StatefulWidget {
  static String tag = '/T13SignInScreen';

  @override
  T13SignInScreenState createState() => T13SignInScreenState();
}

class T13SignInScreenState extends State<T13SignInScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget mSocial(var bgColor, var icon) {
      return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        width: width * 0.11,
        height: width * 0.11,
        child: Padding(
          padding: EdgeInsets.all(spacing_standard),
          child: SvgPicture.asset(icon, color: t13_white),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                commonCacheImageWidget(t13_ic_logo, width * 0.3, width: width * 0.3),
                SizedBox(height: spacing_xlarge),
                t13EditTextStyle(t13_hint_Email, isPassword: false),
                SizedBox(height: spacing_standard_new),
                t13EditTextStyle(t13_hint_password, isPassword: true),
                SizedBox(height: spacing_large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: T13Button(
                        textContent: t13_lbl_login,
                        onPressed: () {
                          finish(context);
                        },
                      ),
                      flex: 2,
                    ),
                    SizedBox(
                      width: spacing_standard_new,
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          mSocial(t13_dark_blue_color, t13_ic_facebook),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          mSocial(t13_blue_color, t13_ic_twitter),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: spacing_large),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(
                      t13_lbl_need_an_account,
                      textColor: t13_textColorSecondary,
                    ),
                    SizedBox(
                      width: spacing_control,
                    ),
                    text(t13_lbl_sign_up, fontSize: 14.0, fontFamily: fontMedium),
                  ],
                ),
                SizedBox(height: spacing_standard_new),
                text(t13_lbl_forgot_your_password, textColor: t13_textColorSecondary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
