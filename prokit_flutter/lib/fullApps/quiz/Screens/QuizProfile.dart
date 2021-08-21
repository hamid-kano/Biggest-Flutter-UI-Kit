import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizEditProfile.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizSettings.dart';
import 'package:prokit_flutter/fullApps/quiz/model/QuizModels.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizDataGenerator.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizImages.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';

class QuizProfile extends StatefulWidget {
  static String tag = '/QuizProfile';

  @override
  _QuizProfileState createState() => _QuizProfileState();
}

class _QuizProfileState extends State<QuizProfile> {
  late List<QuizBadgesModel> mList;
  late List<QuizScoresModel> mList1;

  int selectedPos = 1;

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mList = quizBadgesData();
    mList1 = quizScoresData();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final imgview = Container(
      color: quiz_app_background,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Container(
                height: width * 0.35,
                width: width * 0.35,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quiz_white, width: 4)),
                child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(quiz_img_People2), radius: MediaQuery.of(context).size.width / 8.5),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quiz_white, width: 2), color: quiz_white),
                child: Icon(Icons.edit, size: 20).onTap(() {
                  QuizEditProfile().launch(context);
                  setState(() {});
                }),
              ).paddingOnly(right: 16, top: 16).onTap(() {
                print("Edit profile");
              })
            ],
          ),
          text(quiz_lbl_Antonio_Perez, textColor: quiz_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontBold).paddingOnly(top: 24),
          text(quiz_lbl_Xp, textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular).paddingOnly(top: 8),
          SizedBox(height: 30),
          Container(
            width: width,
            decoration: boxDecoration(radius: spacing_middle, bgColor: quiz_white, showShadow: false),
            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPos = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(spacing_middle), bottomLeft: Radius.circular(spacing_middle)),
                        color: selectedPos == 1 ? quiz_white : Colors.transparent,
                        border: Border.all(color: selectedPos == 1 ? quiz_white : Colors.transparent),
                      ),
                      child: text(
                        quiz_lbl_Badges,
                        fontSize: textSizeMedium,
                        fontFamily: fontSemibold,
                        isCentered: true,
                        textColor: selectedPos == 1 ? quiz_textColorPrimary : quiz_textColorSecondary,
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: quiz_light_gray,
                ).center(),
                Flexible(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPos = 2;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(spacing_middle), bottomRight: Radius.circular(spacing_middle)),
                          color: selectedPos == 2 ? quiz_white : Colors.transparent,
                          border: Border.all(color: selectedPos == 2 ? quiz_white : Colors.transparent),
                        ),
                        child: text(
                          quiz_lbl_Scores,
                          fontSize: textSizeMedium,
                          fontFamily: fontSemibold,
                          isCentered: true,
                          textColor: selectedPos == 2 ? quiz_textColorPrimary : quiz_textColorSecondary,
                        ),
                      )),
                  flex: 1,
                ),
              ],
            ),
          ),
          selectedPos == 1
              ? Container(
                  decoration: boxDecoration(bgColor: quiz_white, radius: 10, showShadow: true),
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    mList[index].img,
                                    height: 50,
                                    width: 50,
                                  ).paddingOnly(right: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(mList[index].title, fontFamily: fontMedium, textColor: quiz_textColorPrimary),
                                      text(mList[index].subtitle, textColor: quiz_textColorSecondary)
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingAll(8),
                          ))).paddingOnly(bottom: 16)
              : Container(
                  decoration: boxDecoration(bgColor: quiz_white, radius: 10, showShadow: true),
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mList1.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  CachedNetworkImage(
                                    placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                    imageUrl: mList1[index].img,
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  ).cornerRadiusWithClipRRect(25).paddingOnly(right: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      text(mList1[index].title, fontFamily: fontMedium, textColor: quiz_textColorPrimary),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          text(mList1[index].totalQuiz, textColor: quiz_textColorSecondary),
                                          text(mList1[index].scores, textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular)
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ).paddingAll(8),
                          ))).paddingOnly(bottom: 16)
        ],
      ),
    ).center();

    changeStatusColor(quiz_app_background);

    return SafeArea(
      child: Scaffold(
        backgroundColor: quiz_app_background,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              color: blackColor,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QuizSettings())),
            ),
          ],
          leading: Container(),
          backgroundColor: quiz_app_background,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(color: quiz_app_background, child: imgview),
        ),
      ),
    );
  }
}
