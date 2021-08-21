import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

import 'SocialDashboard.dart';

class SocialChangeNumber extends StatefulWidget {
  static String tag = '/SocialChangeNumber';

  @override
  SocialChangeNumberState createState() => SocialChangeNumberState();
}

class SocialChangeNumberState extends State<SocialChangeNumber> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mTop(context, ""),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(spacing_standard_new),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: spacing_large,
                        ),
                        text(social_lbl_change_phone, fontFamily: fontBold, fontSize: textSizeLarge),
                        text(social_lbl_please_enter_your_old_and_new_phone_numbers_below, isLongText: true, textColor: social_textColorSecondary),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        text(social_lbl_old_phone_number),
                        SizedBox(
                          height: spacing_control,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: boxDecoration(showShadow: false, bgColor: social_app_background_color, radius: 8, color: social_view_color),
                              padding: EdgeInsets.all(0),
                              child: CountryCodePicker(
                                onChanged: print,
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            SizedBox(
                              width: spacing_standard_new,
                            ),
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
                                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    hintText: social_lbl_old_phone_number,
                                    hintStyle: TextStyle(color: social_textColorSecondary, fontSize: textSizeMedium),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: spacing_middle,
                        ),
                        text(social_lbl_new_phone_number),
                        SizedBox(
                          height: spacing_control,
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              decoration: boxDecoration(showShadow: false, bgColor: social_app_background_color, radius: 8, color: social_view_color),
                              padding: EdgeInsets.all(0),
                              child: CountryCodePicker(
                                onChanged: print,
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            SizedBox(
                              width: spacing_standard_new,
                            ),
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
                                    contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    hintText: social_lbl_new_phone_number,
                                    hintStyle: TextStyle(color: social_textColorSecondary, fontSize: textSizeMedium),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        SocialAppButton(
                          onPressed: () {
                            SocialDashboard().launch(context);
                          },
                          textContent: social_lbl_continue,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
