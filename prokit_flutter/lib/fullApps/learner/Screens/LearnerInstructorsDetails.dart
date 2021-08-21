import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerInstructorsDetails extends StatefulWidget {
  @override
  _LearnerInstructorsDetailsState createState() => _LearnerInstructorsDetailsState();
}

class _LearnerInstructorsDetailsState extends State<LearnerInstructorsDetails> {
  late List<LearnerFeaturedModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetFavourites();
  }

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
        text("Marc Elliot", textColor: learner_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold).center().paddingOnly(top: 8),
        text(learner_lbl_Student, textColor: textSecondaryColor, fontSize: textSizeMedium, fontFamily: fontBold).center().paddingOnly(top: 4),
        SizedBox(
          height: 25,
        ),
        Container(
          width: 120,
          alignment: Alignment.center,
          child: LearnerButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textContent: learner_lbl_Follow,
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
                text("5.0", textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                text(learner_lbl_Ratting, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium),
              ],
            ).center(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("1.6 K", textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium),
                text(learner_lbl_Stud, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium),
              ],
            ).paddingAll(8)
          ],
        ).paddingOnly(left: 16, right: 16, top: 16)
      ],
    );
    final cardList = ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: mList1.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, bgColor: learner_white, radius: 10.0),
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    child: CachedNetworkImage(
                      placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                      imageUrl: mList1[index].img,
                      height: 50,
                      width: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(mList1[index].name, fontFamily: fontBold, textColor: learner_textColorPrimary),
                                  SizedBox(height: 4),
                                  text(mList1[index].type, textColor: learner_textColorPrimary),
                                ],
                              ),
                            ),
                            Icon(Icons.favorite, color: Colors.red, size: 30),
                          ],
                        ),
                        Divider(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text("20", fontFamily: fontBold, textColor: learner_textColorPrimary),
                                SizedBox(height: 4),
                                text("Students", textColor: learner_textColorSecondary),
                              ],
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text("51", fontFamily: fontBold, textColor: learner_textColorPrimary),
                                  SizedBox(height: 4),
                                  text("Lectures", textColor: learner_textColorSecondary),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(8))),
                              child: text(mList1[index].price, textColor: learner_white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
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
              SizedBox(height: 24),
              cardList,
            ],
          ),
        ),
      ),
    );
  }
}
