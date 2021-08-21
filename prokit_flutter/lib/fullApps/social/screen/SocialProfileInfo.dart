import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialWidget.dart';

import 'SocialVerify.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialProfileInfo extends StatefulWidget {
  static String tag = '/SocialProfileInfo';

  @override
  SocialProfileInfoState createState() => SocialProfileInfoState();
}

class SocialProfileInfoState extends State<SocialProfileInfo> {
  bool mValue = false;

  late List<Media> mList;

  @override
  void initState() {
    super.initState();
    mList = addMediaData();
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = MediaQuery.of(context).size.height * 0.33;
    var view = Container(
      height: 0.5,
      color: social_view_color,
      margin: EdgeInsets.only(top: spacing_middle, bottom: spacing_middle),
    );

    var width = MediaQuery.of(context).size.width;
    Widget mPopup() => PopupMenuButton(
          itemBuilder: (context) {
            List<PopupMenuEntry<Object>> list = [];
            list.add(
              PopupMenuItem(
                child: text(social_lbl_share),
                value: 1,
              ),
            );
            list.add(
              PopupMenuItem(
                child: text(social_lbl_edit),
                value: 1,
              ),
            );
            list.add(
              PopupMenuItem(
                child: text(social_lbl_view_in_address_book),
                value: 1,
              ),
            );
            list.add(
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    SocialVerify().launch(context);
                  },
                  child: text(social_lbl_verify_security_code),
                ),
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
              decoration: boxDecoration(showShadow: false, color: social_textColorPrimary, bgColor: Colors.transparent),
              child: Icon(
                Icons.more_vert,
                color: social_textColorPrimary,
              )),
        );

    return Scaffold(
      bottomNavigationBar: Container(
        alignment: Alignment.bottomLeft,
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width,
        color: social_white,
        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new, spacing_standard_new, spacing_standard_new),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(context, dialogContent),
                    );
                  },
                  child: Container(
                    decoration: boxDecoration(
                      bgColor: social_form_google,
                      showShadow: true,
                    ),
                    padding: EdgeInsets.fromLTRB(spacing_standard, spacing_middle, spacing_standard, spacing_middle),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.block,
                                color: social_white,
                                size: 18,
                              ),
                            ),
                          ),
                          TextSpan(text: social_lbl_block_user, style: TextStyle(fontSize: textSizeMedium, color: social_white)),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(
              width: spacing_standard,
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  child: Container(
                decoration: boxDecoration(color: social_form_google, showShadow: true, bgColor: social_white),
                padding: EdgeInsets.fromLTRB(spacing_standard, spacing_middle, spacing_standard, spacing_middle),
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(
                            Icons.thumb_down,
                            color: social_form_google,
                            size: 18,
                          ),
                        ),
                      ),
                      TextSpan(text: social_lbl_report_user, style: TextStyle(fontSize: textSizeMedium, color: social_form_google)),
                    ],
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandHeight,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                titleSpacing: 0,
                backgroundColor: innerBoxIsScrolled ? social_white : social_white,
                title: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: text(social_lbl_notifications, fontFamily: fontBold, fontSize: textSizeLargeMedium, textAllCaps: true),
                      ),
                      mPopup()
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  alignment: Alignment.bottomLeft,
                  height: expandHeight,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Image.network(
                        social_ic_user1_1,
                        width: width,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                )),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: spacing_standard_new, bottom: spacing_standard, top: spacing_standard_new),
                  child: text(social_lbl_media, fontFamily: fontMedium),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.26,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SocialMedia(mList[index], index);
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new, left: spacing_standard_new, right: spacing_standard_new),
                  decoration: boxDecoration(showShadow: true),
                  padding: EdgeInsets.all(spacing_middle),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          text(social_lbl_mute_notifications, fontFamily: fontMedium),
                          Switch(
                            value: mValue,
                            onChanged: (value) {
                              setState(() {
                                mValue = value;
                              });
                            },
                            activeTrackColor: social_colorPrimary,
                            activeColor: social_view_color,
                          )
                        ],
                      ),
                      view,
                      text(social_lbl_custom_notifications, fontFamily: fontMedium),
                      view,
                      text(social_lbl_media_visibility, fontFamily: fontMedium),
                      view,
                      SocialOption(context, social_blue, social_ic_lock, social_lbl_encryption, social_lbl_encryption_info),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: spacing_standard_new,
                  ),
                  child: text(social_lbl_about_and_phone_number, fontFamily: fontMedium),
                ),
                Container(
                  margin: EdgeInsets.all(spacing_standard_new),
                  decoration: boxDecoration(showShadow: true),
                  padding: EdgeInsets.all(spacing_middle),
                  child: Column(
                    children: <Widget>[
                      SocialOption(context, social_blue, social_ic_help, social_lbl_hy_there_i_am_using_inmood, social_lbl__11_december_2019),
                      SizedBox(
                        height: spacing_standard_new,
                      ),
                      SocialOption(context, social_blue, social_phone_fill, social_phone, social_hint_mobile_number),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class SocialMedia extends StatelessWidget {
  late Media model;

  SocialMedia(Media model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: spacing_standard_new),
      child: ClipRRect(
        borderRadius: new BorderRadius.circular(12.0),
        child: CachedNetworkImage(
          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
          imageUrl: model.image,
          fit: BoxFit.fill,
          height: width * 0.15,
          width: width * 0.25,
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CustomDialog(BuildContext context, var value) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: value(context),
  );
}

dialogContent(BuildContext context) {
  return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(spacing_standard_new),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          text(social_lbl_block_matloob, fontFamily: fontMedium, fontSize: textSizeNormal),
          text(social_sample_text, textColor: social_textColorSecondary, isLongText: true),
          SizedBox(
            height: spacing_standard_new,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: social_view_color,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.close, color: social_textColorPrimary),
                  ),
                ),
              ),
              SizedBox(
                width: spacing_standard_new,
              ),
              GestureDetector(
                onTap: () {
                  finish(context);
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: social_form_google,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(Icons.check, color: social_white),
                  ),
                ),
              ),
            ],
          )
        ],
      ));
}
