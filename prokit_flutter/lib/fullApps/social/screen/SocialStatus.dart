import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/dashed_circle.dart';
import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';

import 'SocialGallery.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialHomeStatus extends StatefulWidget {
  @override
  SocialHomeStatusState createState() => SocialHomeStatusState();
}

class SocialHomeStatusState extends State<SocialHomeStatus> {
  var mMyStatusLabel = text(social_lbl_friends, fontFamily: fontMedium);
  var mFriendsLabel = text(social_lbl_my_status, fontFamily: fontMedium);

  Widget mStatus() {
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: boxDecoration(radius: spacing_middle),
      padding: EdgeInsets.all(spacing_middle),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  SocialGallery().launch(context);
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                      child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: social_ic_user1, height: width * 0.13, width: width * 0.13, fit: BoxFit.cover),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle)), color: social_colorPrimary),
                      child: Icon(Icons.add, color: social_white, size: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: spacing_middle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(social_lbl_my_status, fontFamily: fontMedium),
                  text(
                    social_lbl_tap_to_add_status,
                    textColor: social_textColorSecondary,
                  )
                ],
              ),
            ],
          ),
          text(social_7_30_pm, fontFamily: fontMedium, fontSize: textSizeSMedium),
        ],
      ),
    );
  }

  late List<SocialUser> mList;

  @override
  void initState() {
    super.initState();
    mList = addStatusData();
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
              mMyStatusLabel,
              SizedBox(
                height: spacing_standard_new,
              ),
              mStatus(),
              SizedBox(
                height: spacing_standard_new,
              ),
              mFriendsLabel,
              SizedBox(
                height: spacing_standard_new,
              ),
              Container(
                decoration: boxDecoration(showShadow: true),
                padding: EdgeInsets.all(spacing_standard_new),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Friends(mList[index], index);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Friends extends StatelessWidget {
  late SocialUser model;

  Friends(SocialUser model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: spacing_standard_new),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              DashedCircle(
                dashes: 7,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 15.0,
                      child: Container(
                        color: social_white,
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: model.image,
                          height: width * 0.2,
                          width: width * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                color: social_colorPrimary,
              ),
              SizedBox(
                width: spacing_middle,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, fontFamily: fontMedium),
                  text(
                    model.info,
                    textColor: social_textColorSecondary,
                  )
                ],
              ),
            ],
          ),
          text(model.duration, fontFamily: fontMedium, fontSize: textSizeSMedium),
        ],
      ),
    );
  }
}
