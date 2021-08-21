import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerChatting.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerChat extends StatefulWidget {
  @override
  _LearnerChatState createState() => _LearnerChatState();
}

class _LearnerChatState extends State<LearnerChat> {
  late List<LearnerChatModel> mList1;
  late List<LearnerPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList1 = learnerGetChatData();
    mList2 = learnerGetInstructor();
  }

  @override
  Widget build(BuildContext context) {
    final listInTab = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: mList1.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return LearnerChatsData(mList1[index], index);
            },
          ),
          SizedBox(height: 20),
          text(learner_lbl_Start_a_new_chat, textColor: learner_textColorSecondary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold).paddingOnly(top: 16, left: 16, right: 16),
          SizedBox(height: 20),
          Container(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 90,
                    width: 90,
                    color: learner_white,
                    child: Icon(Icons.add, size: 70, color: learner_colorPrimary),
                  ).cornerRadiusWithClipRRect(50).paddingOnly(left: 16),
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mList2.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LearnerNewChats(mList2[index], index);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: learner_layout_background,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: new Container(
                child: new SafeArea(
                  child: Container(
                    color: learner_layout_background,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text(learner_lbl_chat, fontSize: textSizeXXLarge, fontFamily: fontBold, textColor: learner_textColorPrimary).paddingOnly(left: 16),
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.white,
                                  child: Icon(Icons.search, size: 30, color: learner_colorPrimary),
                                ).cornerRadiusWithClipRRect(20).paddingOnly(top: 16),
                                onTap: () {
                                  print('Search');
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
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
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_All,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(left: 8, right: 8),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_Instrctors,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(right: 8),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_Friends,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(right: 8),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: new Text(
                                  learner_lbl_Bots,
                                  style: TextStyle(fontSize: 18.0, fontFamily: fontBold),
                                ),
                              ).paddingOnly(right: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(left: 8, right: 16),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[listInTab, listInTab, listInTab, listInTab],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerChatsData extends StatelessWidget {
  late LearnerChatModel model;

  LearnerChatsData(LearnerChatModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(model.img),
                radius: MediaQuery.of(context).size.width * 0.09,
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(color: model.isOnline ? learner_green : learner_greyColor.withOpacity(1.0), shape: BoxShape.circle, border: Border.all(color: learner_white, width: 1.5)),
              ).cornerRadiusWithClipRRect(7).paddingOnly(top: 4, right: 2)
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium, textColor: learner_textColorPrimary),
                SizedBox(width: 4),
                text(model.msg, textColor: learner_textColorSecondary, isLongText: false),
              ],
            ),
          )
        ],
      ).onTap(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LearnerChattingScreen()));
      }),
    );
  }
}

// ignore: must_be_immutable
class LearnerNewChats extends StatelessWidget {
  late LearnerPeopleModel model;

  LearnerNewChats(LearnerPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      height: 90,
      width: 90,
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
        ],
      ),
    );
  }
}
