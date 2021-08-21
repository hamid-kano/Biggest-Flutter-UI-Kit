import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/flutter_rating_bar.dart';

class LearnerModrenMedicine extends StatefulWidget {
  static String tag = '/LearnerModrenMedicine';

  @override
  _LearnerModrenMedicineState createState() => _LearnerModrenMedicineState();
}

class _LearnerModrenMedicineState extends State<LearnerModrenMedicine> {
  var selectedTab = 0;
  Color indicatorColor = learner_textColorPrimary;
  Color labelColor = learner_textColorPrimary;

  late List<LearnerPeopleModel> mList1;
  late List<LearnerLectureModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetInstructor();
    mList2 = learnerGetLectureData();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_white);
    var w = MediaQuery.of(context).size.width;

    final learnerLesson = Container(
      decoration: boxDecoration(radius: 16.0, showShadow: true),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset(
                learner_walk_BackImg,
                width: MediaQuery.of(context).size.width,
                height: w * 0.2,
              ).paddingOnly(top: 16),
              CachedNetworkImage(
                placeholder: (_, s) => placeholderWidget(),
                imageUrl: learner_ic_Img,
                width: w * 0.2,
                height: w * 0.2,
                fit: BoxFit.fill,
              ).center(),
            ],
          ),
          text(learner_lbl_Introducation, textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontMedium).paddingOnly(top: 16).center(),
          text(learner_lbl_Article, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).paddingOnly(bottom: 16),
          text(learner_sample_long_text, textColor: learner_textColorSecondary, fontFamily: fontSemibold, maxLine: 5, isCentered: true).paddingOnly(left: 8, right: 8),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 4,
              primary: learner_colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              padding: const EdgeInsets.all(0.0),
            ),
            onPressed: () {},
            child: Container(
              width: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80.0)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Start",
                    style: TextStyle(fontSize: 16, color: learner_white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    final learnerReview = Container(
      decoration: boxDecoration(showShadow: true, bgColor: learner_white, radius: 10.0),
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                child: CachedNetworkImage(
                  placeholder: (_, s) => placeholderWidget(),
                  imageUrl: learner_walk_1,
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      text("Nimasha Perara", fontFamily: fontBold, textColor: learner_textColorPrimary),
                    ],
                  ),
                  text(learner_lbl_Student, textColor: learner_textColorPrimary),
                ],
              ),
            ],
          ),
          Divider(height: 25),
          RatingBar(
            initialRating: 5,
            minRating: 5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          text(learner_sample_long_text, textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium, maxLine: 5).paddingOnly(bottom: 16)
        ],
      ),
    );

    final learnerStudent = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mList1.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                child: Stack(
                  alignment: Alignment.topRight,
                  children: <Widget>[
                    CircleAvatar(backgroundImage: CachedNetworkImageProvider(mList1[index].img), radius: 50),
                    Container(
                      height: 15,
                      width: 15,
                      color: mList1[index].isOnline ? learner_green : learner_greyColor.withOpacity(1.0),
                    ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 4)
                  ],
                ),
              ),
              SizedBox(height: 8),
              text(mList1[index].name, fontSize: textSizeLargeMedium, fontFamily: fontBold, textColor: learner_textColorPrimary),
            ],
          ),
        );
      },
    );

    final learnerLecture = SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mList2.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecoration(showShadow: true, radius: 10.0),
            margin: EdgeInsets.only(left: 16.0),
            width: context.width() * .7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(mList2[index].no, textColor: learner_textColorPrimary, fontSize: textSizeLarge, fontFamily: fontSemibold).paddingOnly(left: 16, top: 8),
                    text(
                      mList2[index].title,
                      textColor: learner_textColorPrimary,
                      fontSize: textSizeNormal,
                      fontFamily: fontSemibold,
                      maxLine: 2,
                    ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8).expand(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 24),
                    Text(
                      mList2[index].subtitle,
                      style: secondaryTextStyle(),
                      maxLines: 2,
                    ).paddingOnly(left: 16, right: 16).expand(),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 24),
                    text(mList2[index].type, textColor: learner_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold, maxLine: 2).paddingOnly(left: 16, right: 16),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );

    final learnerAbout = SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        color: learner_layout_background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                text("5.0", textColor: learner_yellow, fontSize: textSizeLarge, fontFamily: fontBold).paddingOnly(right: 8),
                RatingBar(
                  initialRating: 5,
                  minRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ).center(),
              ],
            ).paddingOnly(left: 16, top: 16, right: 16),
            text(learner_lbl_2K_Student, textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold).paddingOnly(top: 16, left: 16, bottom: 16),
            Container(height: 120, width: MediaQuery.of(context).size.width, child: learnerStudent),
            text(learner_36_Lectures, textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontBold).paddingOnly(top: 16, left: 16, bottom: 16),
            Container(child: learnerLecture.paddingOnly(right: 16)),
            SizedBox(height: 16)
          ],
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: learner_layout_background,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(220),
              child: Container(
                color: learner_colorBlue,
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
                                  color: learner_textColorPrimary,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: learner_textColorPrimary,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                        text(learner_lbl_modren_medicine, fontSize: textSizeXXLarge, fontFamily: fontBold, textColor: learner_textColorPrimary),
                        Row(
                          children: <Widget>[
                            CachedNetworkImage(
                              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                              imageUrl: learner_ic_Profile,
                              height: 30,
                              width: 30,
                              fit: BoxFit.fill,
                            ).cornerRadiusWithClipRRect(15).paddingOnly(top: 8),
                            text(learner_lbl_Louisa_macGee, textColor: learner_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontSemibold).paddingOnly(left: 8).center(),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: new TabBar(
                            labelPadding: EdgeInsets.only(left: 0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: indicatorColor,
                            labelColor: labelColor,
                            isScrollable: false,
                            unselectedLabelColor: learner_textColorSecondary,
                            tabs: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_Lessons,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_Reviews,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_About,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 12, right: 16),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return learnerLesson;
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return learnerReview;
                  },
                ),
                learnerAbout,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
