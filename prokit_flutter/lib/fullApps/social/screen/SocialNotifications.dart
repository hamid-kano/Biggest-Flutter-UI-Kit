import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';

class SocialNotification extends StatefulWidget {
  static String tag = '/SocialNotification';

  @override
  SocialNotificationState createState() => SocialNotificationState();
}

class SocialNotificationState extends State<SocialNotification> {
  var mNotificationLabel = text(
    social_lbl_message_notification,
    fontFamily: fontMedium,
  );

  Widget mView() {
    return Container(
      height: 0.5,
      margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
      color: social_view_color,
    );
  }

  Widget mSend(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: <Widget>[
        Container(
          decoration: boxDecoration(showShadow: false, radius: spacing_middle, bgColor: social_blue),
          width: width * 0.12,
          height: width * 0.12,
          padding: EdgeInsets.all(spacing_middle),
          child: SvgPicture.asset(
            social_notification,
            color: social_white,
          ),
        ),
        SizedBox(
          width: spacing_standard_new,
        ),
        text(social_lbl_enter_in_send, fontFamily: fontMedium),
      ],
    );
  }

  bool mSendValue = false;
  bool mNotificationValue = false;

  Widget mPopup() => PopupMenuButton(
        itemBuilder: (context) {
          List<PopupMenuEntry<Object>> list = [];
          list.add(
            PopupMenuItem(
              child: text(social_reset_settings),
              value: 1,
            ),
          );
          return list;
        },
        child: Container(
            margin: EdgeInsets.only(right: spacing_standard_new),
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.width * 0.1,
            padding: EdgeInsets.all(6),
            decoration: boxDecoration(showShadow: false, color: social_view_color, radius: 12),
            child: Icon(
              Icons.more_vert,
              color: social_textColorPrimary,
            )),
      );

  Widget mToolbar() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: width * 0.15,
      color: social_white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: spacing_standard_new),
              width: width * 0.1,
              height: width * 0.1,
              decoration: boxDecoration(showShadow: false, bgColor: social_colorPrimary, radius: 12),
              child: Icon(Icons.keyboard_arrow_left, color: social_white),
            ),
          ),
          Center(
            child: text(social_lbl_notifications, fontFamily: fontBold, fontSize: textSizeLargeMedium, textAllCaps: true),
          ),
          mPopup(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(social_white);
    return Scaffold(
      backgroundColor: social_app_background_color,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            mToolbar(),
            Expanded(
              child: SingleChildScrollView(
                  child: Container(
                margin: EdgeInsets.all(spacing_standard_new),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: boxDecoration(showShadow: true),
                      padding: EdgeInsets.all(spacing_middle),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          mSend(context),
                          Switch(
                            value: mSendValue,
                            onChanged: (value) {
                              setState(() {
                                mSendValue = value;
                              });
                            },
                            activeTrackColor: social_colorPrimary,
                            activeColor: social_view_color,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    mNotificationLabel,
                    Container(
                      margin: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard_new),
                      decoration: boxDecoration(showShadow: true),
                      padding: EdgeInsets.all(spacing_middle),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(social_lbl_notification_tone, fontFamily: fontMedium),
                          text(social_lbl_default_ringtone, textColor: social_textColorSecondary),
                          mView(),
                          text(social_lbl_vibrate, fontFamily: fontMedium),
                          text(social_lbl_default_vibration, textColor: social_textColorSecondary),
                          mView(),
                          text(social_lbl_popup_notification, fontFamily: fontMedium),
                          text(social_lbl_only_show_when_screen_is_on, textColor: social_textColorSecondary),
                          mView(),
                          text(social_lbl_light, fontFamily: fontMedium),
                          text(social_lbl_white, textColor: social_textColorSecondary),
                          mView(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    text(social_lbl_use_high_priority_notifications, fontFamily: fontMedium),
                                    text(social_lbl_show_preview_of_notifications_at_the_top_of_the_screen, textColor: social_textColorSecondary, isLongText: true),
                                  ],
                                ),
                              ),
                              Switch(
                                value: mNotificationValue,
                                onChanged: (value) {
                                  setState(() {
                                    mNotificationValue = value;
                                  });
                                },
                                activeTrackColor: social_colorPrimary,
                                activeColor: social_view_color,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    mNotificationLabel,
                    Container(
                      margin: EdgeInsets.only(top: spacing_standard, bottom: spacing_standard),
                      decoration: boxDecoration(showShadow: true),
                      padding: EdgeInsets.all(spacing_middle),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(social_lbl_ringtone, fontFamily: fontMedium),
                          text(social_lbl_default_ringtone, textColor: social_textColorSecondary),
                          mView(),
                          text(social_lbl_vibrate, fontFamily: fontMedium),
                          text(social_lbl_default_vibration, textColor: social_textColorSecondary),
                          mView(),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
