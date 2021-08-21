import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'SocialDashboard.dart';

class SocialSignIn extends StatefulWidget {
  static String tag = '/SocialSignIn';

  @override
  SocialSignInState createState() => SocialSignInState();
}

class SocialSignInState extends State<SocialSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              mTop(context, ""),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: spacing_large),
                        Center(child: text(social_lbl_welcome, fontFamily: fontBold, fontSize: textSizeLarge)),
                        SizedBox(height: spacing_middle),
                        text(social_lbl_welcome_info, textColor: social_textColorSecondary, isCentered: true, maxLine: 3),
                        SizedBox(height: spacing_large),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: boxDecoration(showShadow: false, bgColor: social_app_background_color, radius: 8, color: social_view_color),
                              padding: EdgeInsets.all(0),
                              child: CountryCodePicker(onChanged: print, showFlag: true, padding: EdgeInsets.all(0)),
                            ),
                            SizedBox(width: spacing_standard_new),
                            Expanded(
                              child: Container(
                                decoration: boxDecoration(showShadow: false, bgColor: social_app_background_color, radius: 8, color: social_view_color),
                                padding: EdgeInsets.all(0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                                  decoration: InputDecoration(
                                    counterText: "",
                                    contentPadding: EdgeInsets.fromLTRB(16, 12, 16, 0),
                                    hintText: social_hint_mobile_number,
                                    prefixIcon: Icon(Icons.call),
                                    hintStyle: TextStyle(color: social_textColorSecondary, fontSize: textSizeMedium),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: spacing_large),
                        SocialAppButton(
                          onPressed: () {
                            SocialDashboard().launch(context);
                          },
                          textContent: social_lbl_continue,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: spacing_standard_new),
            alignment: Alignment.bottomCenter,
            child: text(social_lbl_your_form_submission_is_subjected_n_to_our_privacy_and_policy, textColor: social_textColorSecondary, isCentered: true, isLongText: true),
          )
        ],
      )),
    );
  }
}
