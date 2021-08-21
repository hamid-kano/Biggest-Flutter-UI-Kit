import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerAchievement.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerFavourites.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerMyFriends.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerProfile extends StatefulWidget {
  @override
  _LearnerProfileState createState() => _LearnerProfileState();
}

class _LearnerProfileState extends State<LearnerProfile> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: learner_white, width: 4)),
                      child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(learner_ic_Profile), radius: width / 8.5),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text("Nimasha Perara", fontFamily: fontSemibold, fontSize: textSizeLargeMedium, textColor: learner_textColorPrimary),
                        text(learner_lbl_390_290_points, textColor: learner_textColorPrimary),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            learnerAward(learner_ic_medal, learner_colorPrimary),
                            learnerAward(learner_ic_crown, learner_green),
                            learnerAward(learner_ic_cup, learner_light_pink),
                            learnerAward(learner_ic_flag, learner_orange_dark),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(margin: EdgeInsets.only(top: 30, left: 16), child: text(learner_lbl_general, fontFamily: fontBold, textAllCaps: true, textColor: learner_textColorPrimary)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(bgColor: learner_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: learnerOption(
                        learner_ic_heart,
                        learner_lbl_favourite_courses,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LearnerFavourites()),
                        );
                      },
                    ),
                    InkWell(
                      child: learnerOption(learner_ic_user, learner_lbl_my_friends),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LearnerMyFriends()),
                        );
                      },
                    ),
                    InkWell(
                      child: learnerOption(learner_ic_achievements, learner_lbl_achievements),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LearnerAchievements()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(margin: EdgeInsets.only(top: 25, left: 16), child: text(learner_lbl_settings, fontFamily: fontBold, textAllCaps: true, textColor: learner_textColorPrimary)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(bgColor: learner_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    learnerOption(learner_ic_key, learner_lbl_edit_login_details),
                    learnerOption(learner_ic_correct, learner_lbl_update_interests),
                    learnerOption(learner_ic_block, learner_lbl_blocked_users),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget learnerAward(var icon, var bgColor) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icon,
      ),
    ),
  );
}

Widget learnerOption(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: boxDecoration(bgColor: learner_white, radius: 8, showShadow: true),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading, textColor: learner_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontSemibold),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: learner_textColorSecondary,
        ),
      ],
    ),
  );
}
