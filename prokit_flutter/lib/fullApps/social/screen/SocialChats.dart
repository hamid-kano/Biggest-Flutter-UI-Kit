import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

class SocialChats extends StatefulWidget {
  static String tag = '/SocialChats';

  @override
  SocialChatsState createState() => SocialChatsState();
}

class SocialChatsState extends State<SocialChats> {
  @override
  Widget build(BuildContext context) {
    var isSwitched1 = false;
    var view = Container(
      height: 0.5,
      color: social_view_color,
      margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
    );
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mTop(context, social_lbl_chats),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(spacing_middle),
                      decoration: boxDecoration(showShadow: true),
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(social_lbl_enter_in_send, fontFamily: fontMedium),
                                    text(social_lbl_enter_key_will_send_your_message, textColor: social_textColorSecondary),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: spacing_standard,
                              ),
                              Switch(
                                value: isSwitched1,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched1 = value;
                                  });
                                },
                                activeTrackColor: social_colorPrimary,
                                activeColor: social_view_color,
                              )
                            ],
                          ),
                          view,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(social_lbl_media_visibility, fontFamily: fontMedium),
                                    text(social_lbl_show_preview_of_notifications_at_the_top_of_the_screen, textColor: social_textColorSecondary),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: spacing_standard,
                              ),
                              Switch(
                                value: isSwitched1,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched1 = value;
                                  });
                                },
                                activeTrackColor: social_colorPrimary,
                                activeColor: social_view_color,
                              )
                            ],
                          ),
                          view,
                          text(social_lbl_font_size, fontFamily: fontMedium),
                          text(social_lbl_medium_fonts, textColor: social_textColorSecondary),
                          view,
                          text(social_lbl_app_languages, fontFamily: fontMedium),
                          text(social_lbl_phone_languages_english, textColor: social_textColorSecondary),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(spacing_middle),
                      decoration: boxDecoration(showShadow: true),
                      margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
                      child: Column(
                        children: <Widget>[
                          SocialOption(context, social_dark_yellow, social_picture, social_lbl_wallpaper, social_lbl_select_chat_background_wallpaper),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          SocialOption(context, social_dark_yellow, social_bckup, social_lbl_chat_backup, social_lbl_view_backup_history_settings),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          SocialOption(context, social_dark_yellow, social_history, social_lbl_chat_history, social_lbl_share_and_download_history),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
