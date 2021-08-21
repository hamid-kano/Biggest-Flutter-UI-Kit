import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerFriendDetail extends StatefulWidget {
  @override
  _LearnerFriendDetailState createState() => _LearnerFriendDetailState();
}

class _LearnerFriendDetailState extends State<LearnerFriendDetail> {
  late List<LearnerBadgeModel> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = learnerGetBadges();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final topView = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: learner_ic_profile1,
              height: width * 0.3,
              width: width * 0.3,
              alignment: Alignment.center,
              fit: BoxFit.fill,
            ).cornerRadiusWithClipRRect(60).paddingOnly(top: 16).center(),
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(color: learner_green.withOpacity(1.0), shape: BoxShape.circle, border: Border.all(color: learner_white, width: 1.5)),
            ).cornerRadiusWithClipRRect(7).paddingOnly(left: 80, top: 25).center()
          ],
        ),
        text("Marc Elliot", textColor: learner_textColorPrimary, fontSize: textSizeNormal, fontFamily: fontBold).center().paddingOnly(top: 8),
        text(learner_lbl_Student, textColor: textSecondaryColor, fontSize: textSizeMedium, fontFamily: fontBold).center().paddingOnly(top: 4),
        SizedBox(
          height: 25,
        ),
        TextButton(
          onPressed: () {},
          child: text("Add Friend", textColor: learner_colorPrimary, fontSize: textSizeMedium, fontFamily: fontSemibold).paddingAll(8),
          style: TextButton.styleFrom(
            textStyle: TextStyle(color: learner_colorPrimary),
            shape: RoundedRectangleBorder(side: BorderSide(color: learner_colorPrimary, width: 1.5, style: BorderStyle.solid), borderRadius: BorderRadius.circular(50)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("7", textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                text(learner_lbl_Course, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("193,79", textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                text(learner_lbl_Points, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("11", textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                text(learner_lbl_Ranks, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium),
              ],
            ).paddingAll(8)
          ],
        ).paddingOnly(left: 16, right: 16, top: 16)
      ],
    );

    final listingView = ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mList2.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return LearnerBadges(mList2[index], index);
        });

    return Scaffold(
      backgroundColor: learner_layout_background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: new Container(
          color: learner_layout_background,
          child: new SafeArea(
            child: Container(
              color: learner_layout_background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: learner_colorPrimary,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: learner_colorPrimary,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topView,
              listingView,
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerBadges extends StatelessWidget {
  late LearnerBadgeModel model;

  LearnerBadges(LearnerBadgeModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            decoration: BoxDecoration(shape: BoxShape.circle, color: model.color),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(model.img),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
                SizedBox(
                  width: 4,
                ),
                text(model.comment, textColor: learner_textColorSecondary),
              ],
            ),
          )
        ],
      ),
    );
  }
}
