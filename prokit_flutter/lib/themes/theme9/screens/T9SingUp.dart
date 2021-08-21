import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Colors.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Constant.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Images.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Strings.dart';
import 'package:prokit_flutter/themes/theme9/utils/T9Widget.dart';

import '../../../main.dart';

class T9SignUp extends StatefulWidget {
  static String tag = '/T9SignUp';

  @override
  T9SignUpState createState() => T9SignUpState();
}

class T9SignUpState extends State<T9SignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(
      appStore.scaffoldBackground!,
    );
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: t9_colorPrimary,
                      size: 30,
                    ),
                    onPressed: () {
                      finish(context);
                    },
                  ))),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: t9_white, width: 4)),
                        child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(t9_ic_profile), radius: width / 8.5),
                      ),
                      SizedBox(height: 30),
                      T9EditTextStyle(t9_hint_full_name, isPassword: false),
                      SizedBox(height: 16),
                      T9EditTextStyle(t9_hint_email, isPassword: false),
                      SizedBox(height: 16),
                      T9EditTextStyle(t9_hint_password, isPassword: true),
                      SizedBox(height: 50),
                      Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: T9Button(
                          onPressed: () {},
                          textContent: t9_lbl_join,
                        ),
                      ),
                      SizedBox(height: 20),
                      text(t9_sign_up_info),
                      SizedBox(height: 4),
                      GestureDetector(
                          child: Text(t9_txt_terms_condition,
                              style: TextStyle(
                                fontSize: textSizeLargeMedium,
                                decoration: TextDecoration.underline,
                                color: t9_colorPrimary,
                              )),
                          onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
