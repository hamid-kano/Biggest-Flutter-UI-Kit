import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Colors.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Constant.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Images.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Strings.dart';
import 'package:prokit_flutter/themes/theme6/utils/T6Widget.dart';

import '../../../main.dart';

class T6SignUp extends StatefulWidget {
  static String tag = '/T6SignUp';

  @override
  T6SignUpState createState() => T6SignUpState();
}

class T6SignUpState extends State<T6SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor!);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: t6_ic_logo, width: width / 2.2),
                ),
                SizedBox(height: 30),
                text(t6_lbl_user_name, textColor: appStore.textSecondaryColor),
                SizedBox(height: 8),
                T6EditTextStyle(t6_username),
                SizedBox(height: 16),
                text(t6_lbl_mobile_number, textColor: appStore.textSecondaryColor),
                SizedBox(height: 8),
                T6EditTextStyle(t6_mobileno),
                SizedBox(height: 16),
                text(t6_lbl_referral_code, textColor: appStore.textSecondaryColor),
                SizedBox(height: 8),
                T6EditTextStyle(t6_referral_code),
                SizedBox(height: 20),
                T6Button(
                  textContent: t6_lbl_sign_up,
                  onPressed: () {},
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(t6_lbl_already_did_this),
                    SizedBox(width: 4),
                    GestureDetector(child: Text(t6_lbl_sign_in, style: TextStyle(fontSize: textSizeMedium, decoration: TextDecoration.underline, color: t6form_google)), onTap: () {})
                  ],
                ),
                SizedBox(height: 10),
                Container(alignment: Alignment.center, child: text(t6_lbl_or_with, textColor: t6colorPrimary, textAllCaps: true)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: t6form_google),
                      width: width / 7.5,
                      height: width / 7.5,
                      padding: EdgeInsets.all(width / 28),
                      child: SvgPicture.asset(t6_google_fill, color: t6white, width: 20, height: 20),
                    ),
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: t6form_facebook),
                      width: width / 7.5,
                      height: width / 7.5,
                      padding: EdgeInsets.all(width / 28),
                      child: SvgPicture.asset(t6_facebook_fill, color: t6white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
