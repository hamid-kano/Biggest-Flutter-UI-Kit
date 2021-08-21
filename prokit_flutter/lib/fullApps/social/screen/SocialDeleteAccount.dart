import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

import 'SocialChangeNumber.dart';

class SocialDeleteAccount extends StatefulWidget {
  static String tag = '/SocialDeleteAccount';

  @override
  SocialDeleteAccountState createState() => SocialDeleteAccountState();
}

class SocialDeleteAccountState extends State<SocialDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    Widget mOption(var value) {
      return Row(
        children: <Widget>[
          Container(
            height: 8,
            margin: EdgeInsets.only(left: spacing_standard_new),
            width: 8,
            decoration: BoxDecoration(shape: BoxShape.circle, color: social_view_color),
          ),
          SizedBox(width: spacing_standard),
          Expanded(
            child: text(value, textColor: social_textColorSecondary, isLongText: false),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, social_lbl_delete_account),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: boxDecoration(showShadow: true),
                        padding: EdgeInsets.all(spacing_middle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.warning, color: social_form_google, size: 18),
                                    ),
                                  ),
                                  TextSpan(text: social_lbl_deleting_your_account_will, style: TextStyle(fontSize: textSizeMedium, color: social_form_google)),
                                ],
                              ),
                            ),
                            SizedBox(height: spacing_standard),
                            mOption(social_lbl_delete1),
                            mOption(social_lbl_delete2),
                            mOption(social_lbl_delete3),
                            mOption(social_lbl_delete4),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: boxDecoration(showShadow: true),
                        padding: EdgeInsets.all(spacing_middle),
                        margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.phone_android, color: social_textColorPrimary, size: 18),
                                    ),
                                  ),
                                  TextSpan(text: social_lbl_change_phone_number_instead, style: TextStyle(fontSize: textSizeMedium, color: social_colorPrimary)),
                                ],
                              ),
                            ),
                            SizedBox(height: spacing_standard_new),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: SocialAppButton(
                                onPressed: () {
                                  SocialChangeNumber().launch(context);
                                },
                                textContent: social_lbl_change_number,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: boxDecoration(showShadow: true),
                        padding: EdgeInsets.all(spacing_middle),
                        margin: EdgeInsets.only(bottom: spacing_standard_new),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(social_lbl_to_delete_your_account_confirm_your_country_code_and_enter_your_phone_number, isLongText: true, textColor: social_textColorSecondary),
                            SizedBox(height: spacing_standard_new),
                            text(social_lbl_country, fontFamily: fontMedium),
                            SizedBox(height: spacing_control),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(spacing_standard, 0, spacing_standard, 0),
                              decoration: boxDecoration(showShadow: false, color: social_view_color),
                              child: CountryCodePicker(
                                alignLeft: true,
                                onChanged: print,
                                showFlag: true,
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            SizedBox(height: spacing_standard_new),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(spacing_standard, 16, spacing_standard, 16),
                              decoration: boxDecoration(showShadow: false, color: social_view_color),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Icon(Icons.call, color: social_textColorPrimary, size: 18),
                                      ),
                                    ),
                                    TextSpan(text: social_phone, style: TextStyle(color: social_textColorPrimary, fontSize: textSizeMedium)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: spacing_standard_new),
                        padding: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
                        decoration: boxDecoration(showShadow: true, bgColor: social_form_google, radius: 8),
                        child: text(social_lbl_delete_account, textColor: social_white, isCentered: true),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
