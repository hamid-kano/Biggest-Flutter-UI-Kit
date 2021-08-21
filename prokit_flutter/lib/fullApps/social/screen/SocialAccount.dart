import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

import 'SocialChangeNumber.dart';
import 'SocialDeleteAccount.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialAccount extends StatefulWidget {
  static String tag = '/SocialAccount';

  @override
  SocialAccountState createState() => SocialAccountState();
}

class SocialAccountState extends State<SocialAccount> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, social_lbl_account),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(spacing_middle),
                        decoration: boxDecoration(showShadow: true),
                        child: Column(
                          children: <Widget>[
                            SocialOption(context, social_blue, social_privacy, social_lbl_privacy, social_lbl_privacy_info),
                            SizedBox(
                              height: spacing_standard_new,
                            ),
                            SocialOption(context, social_blue, social_ic_lock, social_lbl_security, social_lbl_security_info),
                            SizedBox(
                              height: spacing_standard_new,
                            ),
                            SocialOption(context, social_blue, social_ic_lock, social_lbl_two_step_verification, social_lbl_verification_info),
                            SizedBox(
                              height: spacing_standard_new,
                            ),
                            SocialOption(context, social_blue, social_smartphone, social_lbl_change_number, social_lbl_change_number_info, onTap: () {
                              SocialChangeNumber().launch(context);
                            }),
                            SizedBox(
                              height: spacing_standard_new,
                            ),
                            SocialOption(context, social_blue, social_ic_help, social_lbl_request_info, social_lbl_request_info_),
                            SizedBox(
                              height: spacing_standard_new,
                            ),
                            SocialOption(context, social_blue, social_ic_delete_bin, social_lbl_delete_account, social_lbl_delete_account_info, onTap: () {
                              SocialDeleteAccount().launch(context);
                            }),
                          ],
                        ),
                      ),
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
