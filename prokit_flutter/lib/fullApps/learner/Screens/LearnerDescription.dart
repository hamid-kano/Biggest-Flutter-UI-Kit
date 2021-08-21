import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerDescription extends StatefulWidget {
  static String tag = '/LearnerDescription';

  @override
  _LearnerDescriptionState createState() => _LearnerDescriptionState();
}

class _LearnerDescriptionState extends State<LearnerDescription> {
  late List<LearnerContentModel> mList;

  @override
  void initState() {
    super.initState();
    mList = learnerGetContents();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
                  decoration: boxDecoration(showShadow: true, radius: 16, bgColor: learner_white),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                        child: CachedNetworkImage(
                          placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                          imageUrl: learner_climb,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(height: 16),
                      text(learner_lbl_project_management, fontSize: textSizeNormal, fontFamily: fontBold),
                      SizedBox(height: 8),
                      Container(
                        decoration: boxDecoration(bgColor: learner_green, radius: 8, showShadow: false),
                        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
                        child: text(learner_lbl_30_80, textColor: learner_white),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LearnerOptionDescription(learner_lbl_1_6k, learner_lbl_students),
                          LearnerOptionDescription(learner_lbl_5_0, learner_lbl_rating),
                          LearnerOptionDescription(learner_lbl_37, learner_lbl_lectures),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: learner_textColorSecondary,
                      ),
                      text(learner_lbl_swipe_up_to_show_course_contents, textColor: learner_textColorSecondary)
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(16.0),
                  child: Icon(Icons.close, color: learner_textColorSecondary, size: 20),
                ),
                text(learner_lbl_project_management, fontSize: textSizeNormal, fontFamily: fontMedium),
                SizedBox(height: 10),
                Container(
                  decoration: boxDecoration(bgColor: learner_green, radius: 8, showShadow: false),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                    child: text(learner_lbl_30_80, textColor: learner_white),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(learner_ic_Profile),
                            radius: MediaQuery.of(context).size.height * 0.025,
                          ),
                          SizedBox(width: 16),
                          text(learner_lbl_hannah_tran, textColor: learner_colorPrimary)
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(Icons.star, color: learner_yellow, size: 16),
                              ),
                            ),
                            TextSpan(text: learner_lbl_5_0, style: TextStyle(fontSize: textSizeMedium, color: learner_yellow, fontFamily: fontMedium)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return LearnerQuestion(mList[index], index);
                  },
                ),
                Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LearnerQuestion extends StatelessWidget {
  late LearnerContentModel model;

  LearnerQuestion(LearnerContentModel model, int pos) {
    this.model = model;
  }

  var i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: <Widget>[
          text("1", textColor: learner_textColorSecondary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text(model.name, fontFamily: fontMedium, fontSize: textSizeLargeMedium, maxLine: 2, isLongText: true),
                text(model.subtitle, isLongText: true, maxLine: 2),
                text(model.type, textColor: learner_colorPrimary)
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget LearnerOptionDescription(var total, var type) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: <Widget>[
        Image.asset(learner_ic_cup, height: 20, width: 20),
        SizedBox(height: 4),
        text(total, fontFamily: fontMedium, isLongText: true),
        text(type, textColor: learner_textColorSecondary),
      ],
    ),
  );
}
