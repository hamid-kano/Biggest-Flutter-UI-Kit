import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';

import 'SocialChatting.dart';
import 'SocialViewChats.dart';

class SocialHomeChats extends StatefulWidget {
  @override
  SocialHomeChatsState createState() => SocialHomeChatsState();
}

class SocialHomeChatsState extends State<SocialHomeChats> {
  late List<SocialUser> mList;
  late List<SocialUser> mList1;

  @override
  void initState() {
    super.initState();
    mList = addChatData();
    mList1 = addGroupData();
  }

  var mFriendsLabel = text(social_lbl_friends, fontFamily: fontMedium);
  var mGroupsLabel = text(social_lbl_groups, fontFamily: fontMedium);

  Widget mSeeMore() {
    return GestureDetector(
      onTap: () {
        SocialViewChat().launch(context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(spacing_standard_new, spacing_control, spacing_standard, spacing_control),
        margin: EdgeInsets.only(top: spacing_standard_new, bottom: spacing_standard_new),
        decoration: boxDecoration(color: social_view_color, bgColor: social_app_background, radius: 8),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: social_lbl_see_more, style: TextStyle(fontSize: textSizeMedium, color: social_colorPrimary)),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: spacing_control),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: social_textColorPrimary,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mFriendsLabel,
              SizedBox(
                height: spacing_standard_new,
              ),
              Container(
                decoration: boxDecoration(radius: spacing_middle),
                padding: EdgeInsets.all(spacing_middle),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Chats(mList[index], index);
                    }),
              ),
              mSeeMore(),
              mGroupsLabel,
              SizedBox(
                height: spacing_standard_new,
              ),
              Container(
                decoration: boxDecoration(radius: spacing_middle),
                padding: EdgeInsets.all(spacing_middle),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Chats(mList1[index], index);
                    }),
              ),
              mSeeMore(),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Chats extends StatelessWidget {
  late SocialUser model;

  Chats(SocialUser model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        SocialChatting().launch(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: spacing_standard_new),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                      child: Container(
                        color: social_dark_gray,
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: model.image,
                          height: width * 0.13,
                          width: width * 0.13,
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(
                    width: spacing_middle,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(model.name, fontFamily: fontMedium),
                        text(
                          model.info,
                          textColor: social_textColorSecondary,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: spacing_standard),
            text(model.duration, fontFamily: fontMedium, fontSize: textSizeSMedium),
          ],
        ),
      ),
    );
  }
}
