import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/fullApps/social/model/SocialModel.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialColors.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialConstant.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialDataGenerator.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialImages.dart';
import 'package:prokit_flutter/fullApps/social/utils/SocialStrings.dart';
import 'SocialCall.dart';
import 'SocialViewCalls.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialHomeCalls extends StatefulWidget {
  @override
  SocialHomeCallsState createState() => SocialHomeCallsState();
}

class SocialHomeCallsState extends State<SocialHomeCalls> {
  var mFriendsLabel = text(social_lbl_friends, fontFamily: fontMedium);
  var mGroupsLabel = text(social_lbl_groups, fontFamily: fontMedium);

  late List<SocialUser> mList;
  late List<SocialUser> mList1;

  @override
  void initState() {
    super.initState();
    mList = addCallData();
    mList1 = addGroupCallData();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget mSeeMore() {
      return GestureDetector(
        onTap: () {
          SocialViewCall().launch(context);
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.keyboard_arrow_right, color: social_textColorPrimary, size: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60),
        child: Container(
          margin: EdgeInsets.all(spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mFriendsLabel,
              SizedBox(height: spacing_standard_new),
              Container(
                decoration: boxDecoration(radius: spacing_middle),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(spacing_control),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Calls(mList[index], index);
                    // return Chats(mListings[index], index);
                  },
                ),
              ),
              mSeeMore(),
              mGroupsLabel,
              SizedBox(height: spacing_standard_new),
              Container(
                decoration: boxDecoration(radius: spacing_middle),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Calls(mList1[index], index);
                    // return Chats(mListings[index], index);
                  },
                ),
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
class Calls extends StatelessWidget {
  late SocialUser model;

  Calls(SocialUser model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        SocialCall().launch(context);
      },
      child: Container(
        margin: EdgeInsets.all(spacing_control),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(spacing_middle)),
                  child: Container(
                      color: social_dark_gray, child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: model.image, height: width * 0.13, width: width * 0.13, fit: BoxFit.fill)),
                ),
                SizedBox(width: spacing_middle),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[text(model.name, fontFamily: fontMedium,maxLine: 1), text(model.info, textColor: social_textColorSecondary,maxLine: 1)],
                ),
              ],
            ),
            if (model.call == 1) SvgPicture.asset(social_call1, color: social_dark_yellow, width: 30, height: 30),
            if (model.call == 2) SvgPicture.asset(social_call2, color: social_colorPrimary, width: 30, height: 30),
            if (model.call == 3) SvgPicture.asset(social_forward_call, color: social_perpul, width: 30, height: 30),
          ],
        ),
      ),
    );
  }
}
