import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizImages.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizEditProfile extends StatefulWidget {
  static String tag = '/QuizEditProfile';

  @override
  _QuizEditProfileState createState() => _QuizEditProfileState();
}

class _QuizEditProfileState extends State<QuizEditProfile> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Imgview = Container(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quiz_white, width: 4)),
                child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(quiz_img_People2), radius: MediaQuery.of(context).size.width / 8.5),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: quiz_white, width: 2), color: quiz_white),
                child: Icon(Icons.edit, size: 20),
              ).paddingOnly(right: 16, top: 16).onTap(() {
                print("Edit profile");
              })
            ],
          ).paddingOnly(top: 8),
        ],
      ),
    ).center();

    changeStatusColor(quiz_app_background);
    return Scaffold(
      backgroundColor: quiz_app_background,
      appBar: AppBar(
        title: text(Quiz_lbl_Edit_Profile, fontSize: textSizeNormal, fontFamily: fontMedium),
        leading: Icon(Icons.arrow_back, color: quiz_colorPrimary, size: 30).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: quiz_app_background,
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              Imgview,
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(24.0),
                decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                child: Column(
                  children: <Widget>[
                    quizEditTextStyle(quiz_hint_First_name, isPassword: false),
                    quizDivider(),
                    quizEditTextStyle(quiz_hint_Last_name, isPassword: false),
                    quizDivider(),
                    quizEditTextStyle(quiz_hint_Mobile_Number, isPassword: false),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(24.0),
                child: quizButton(
                  textContent: quiz_Save_Profile,
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                      toast(quiz_Successfully_Save_Profile);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
