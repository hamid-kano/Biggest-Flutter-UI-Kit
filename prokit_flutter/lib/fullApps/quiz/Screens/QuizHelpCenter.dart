import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizHelpCenter extends StatefulWidget {
  static String tag = '/QuizHelpCenter';

  @override
  _QuizHelpCenterState createState() => _QuizHelpCenterState();
}

class _QuizHelpCenterState extends State<QuizHelpCenter> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);
    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Help_Center, fontSize: textSizeNormal, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: quiz_app_background,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: quiz_app_background,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(24.0),
                decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                child: Column(
                  children: <Widget>[
                    quizEditTextStyle(quiz_hint_Mobile_Number, isPassword: false),
                    quizDivider(),
                    quizEditTextStyle(quiz_hint_your_email, isPassword: false),
                    quizDivider(),
                    Container(
                      height: 80,
                      child: TextField(
                        minLines: 10,
                        maxLines: 15,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: quiz_hint_Description,
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: textSizeMedium, color: quiz_textColorSecondary, fontFamily: fontRegular),
                        ),
                      ).paddingOnly(left: 16, right: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                      textContent: quiz_lbl_Submit,
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                          toast(quiz_Thank_you_Successfully_Added);
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
