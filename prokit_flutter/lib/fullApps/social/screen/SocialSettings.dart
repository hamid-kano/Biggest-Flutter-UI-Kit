import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/social/screen/SocialProfile.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

import 'SocialAccount.dart';
import 'SocialChats.dart';
import 'SocialNotifications.dart';

class SocialSetting extends StatefulWidget {
  static String tag = '/SocialSetting';

  @override
  SocialSettingState createState() => SocialSettingState();
}

class SocialSettingState extends State<SocialSetting> {
  Widget mStatus() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: boxDecoration(radius: spacing_middle),
      padding: EdgeInsets.all(spacing_middle),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              SocialProfile().launch(context);
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                  child: CachedNetworkImage(
                    placeholder: (_, s) => placeholderWidget(),
                    imageUrl: social_ic_user1,
                    height: width * 0.14,
                    width: width * 0.14,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle)), color: social_colorPrimary),
                  child: Icon(
                    Icons.add,
                    color: social_white,
                    size: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: spacing_middle,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(social_name, fontFamily: fontMedium),
                text(social_setting_lbl_, textColor: social_textColorSecondary),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mToolbar(context, social_lbl_settings, social_ic_logout, onTap: () {}),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(spacing_standard_new),
                  child: Column(
                    children: <Widget>[
                      mStatus(),
                      Container(
                        padding: EdgeInsets.all(spacing_middle),
                        margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
                        decoration: boxDecoration(showShadow: true),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SocialOption(context, social_blue, social_key, social_lbl_account, social_lbl_account_info, onTap: () {
                              SocialAccount().launch(context);
                            }),
                            SizedBox(height: spacing_standard_new),
                            SocialOption(context, social_blue, social_chat_line, social_lbl_chats, social_lbl_chats_info, onTap: () {
                              SocialChats().launch(context);
                            }),
                            SizedBox(height: spacing_standard_new),
                            SocialOption(context, social_blue, social_briefcase, social_lbl_data_and_storage_usage, social_lbl_data_info),
                            SizedBox(height: spacing_standard_new),
                            SocialOption(context, social_blue, social_notification, social_lbl_notifications, social_lbl_notification_info, onTap: () {
                              SocialNotification().launch(context);
                            }),
                            SizedBox(height: spacing_standard_new),
                            SocialOption(context, social_blue, social_ic_help, social_lbl_help, social_lbl_help_info),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(spacing_middle),
                        decoration: boxDecoration(showShadow: true),
                        child: SocialOption(context, social_dark_yellow, social_group_line, social_lbl_invite_friends, social_lbl_invite_friends_info),
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
