import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerInstructorsDetails.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerSearch extends StatefulWidget {
  @override
  _LearnerSearchState createState() => _LearnerSearchState();
}

class _LearnerSearchState extends State<LearnerSearch> {
  late List<LearnerPeopleModel> mList1;
  late List<LearnerPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetInstructor();
    mList2 = learnerGetRecommended();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
        backgroundColor: learner_layout_background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: boxDecoration(showShadow: true, bgColor: learner_white, radius: 0),
                padding: EdgeInsets.fromLTRB(12, 16, 16, 12),
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.search, color: learner_colorPrimary, size: 20),
                        ),
                        Text(learner_hint_search, style: TextStyle(fontSize: textSizeMedium, color: learner_textColorSecondary)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(learner_lbl_filter, style: TextStyle(fontSize: textSizeMedium, color: learner_colorPrimary)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.close, color: learner_textColorSecondary, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: text(learner_lbl_top_instructors, fontFamily: fontBold, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LearnerInstructor(mList1[index], index);
                    }),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: text(learner_lbl_recommended, fontFamily: fontBold, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LearnerRecommended(mList2[index], index);
                    }),
              ),
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class LearnerInstructor extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerInstructor(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: w * 0.1,
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(color: model.isOnline ? learner_green : learner_greyColor.withOpacity(1.0), shape: BoxShape.circle, border: Border.all(color: learner_white, width: 1.5)),
              ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
            ],
          ),
          SizedBox(
            height: 8,
          ),
          text(model.name, fontFamily: fontMedium),
          text(model.subject, textColor: learner_textColorSecondary),
        ],
      ),
    ).onTap(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LearnerInstructorsDetails()),
      );
    });
  }
}

// ignore: must_be_immutable
class LearnerRecommended extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerRecommended(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 8),
      child: CircleAvatar(
        radius: w * 0.1,
        backgroundImage: CachedNetworkImageProvider(model.img),
      ),
    );
  }
}
