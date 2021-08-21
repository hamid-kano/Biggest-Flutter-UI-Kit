import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerAchievements extends StatefulWidget {
  @override
  _LearnerAchievementsState createState() => _LearnerAchievementsState();
}

class _LearnerAchievementsState extends State<LearnerAchievements> {
  late List<LearnerPeopleModel> mList1;
  late List<LearnerBadgeModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetPending();
    mList2 = learnerGetBadges();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: learner_layout_background,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(170),
              child: Container(
                color: Colors.white,
                child: SafeArea(
                  child: Container(
                    color: learner_layout_background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        text(learner_lbl_achievements, fontSize: textSizeLarge, fontFamily: fontBold, textColor: learner_textColorPrimary),
                        SizedBox(height: 16),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: TabBar(
                            labelPadding: EdgeInsets.only(left: 0, right: 0),
                            indicatorWeight: 4.0,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: learner_colorPrimary,
                            labelColor: learner_colorPrimary,
                            isScrollable: true,
                            unselectedLabelColor: learner_textColorSecondary,
                            tabs: [
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(learner_lbl_badges, style: TextStyle(fontSize: 18.0, fontFamily: fontBold)),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(learner_lbl_leader_board, style: TextStyle(fontSize: 18.0, fontFamily: fontBold)),
                              )
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
                  scrollDirection: Axis.vertical,
                  itemCount: mList2.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerBadges(mList2[index], index);
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerLeaderBoard(mList1[index], index);
                  },
                ),
              ],
            ),
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
    if (model.isLocked == false) {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration: BoxDecoration(shape: BoxShape.circle, color: model.color),
              child: Padding(padding: EdgeInsets.all(10.0), child: Image.asset(model.img)),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, fontFamily: fontMedium, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
                  SizedBox(width: 4),
                  text(model.comment, textColor: learner_textColorSecondary),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.width / 7,
              decoration: BoxDecoration(shape: BoxShape.circle, color: learner_met_grey),
              child: Padding(padding: EdgeInsets.all(10.0), child: Icon(Icons.lock, color: learner_white)),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(learner_lbl_locked_badge, fontFamily: fontMedium, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
                SizedBox(width: 4),
                text(learner_lbl_unlock_to_see_details, textColor: learner_textColorSecondary),
              ],
            )
          ],
        ),
      );
    }
  }
}

// ignore: must_be_immutable
class LearnerLeaderBoard extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerLeaderBoard(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var i = 0;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(backgroundImage: CachedNetworkImageProvider(model.img), radius: MediaQuery.of(context).size.width * 0.08),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(model.name, fontFamily: fontMedium, textColor: learner_textColorPrimary),
                  SizedBox(width: 4),
                  text(model.points, textColor: learner_textColorSecondary),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 35,
            height: 35,
            decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor, border: Border.all(color: learner_view_color, width: 0.5)),
            child: Center(child: text((i + 1).toString())),
          )
        ],
      ),
    );
  }
}
