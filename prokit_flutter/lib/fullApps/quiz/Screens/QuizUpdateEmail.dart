import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizUpdateEmail extends StatefulWidget {
  static String tag = '/QuizUpdateEmail';

  @override
  _QuizUpdateEmailState createState() => _QuizUpdateEmailState();
}

class _QuizUpdateEmailState extends State<QuizUpdateEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Update_email, fontSize: textSizeNormal, fontFamily: fontMedium),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: quiz_app_background,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                text(quiz_info_Update_email, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true).center(),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      quizEditTextStyle(quiz_hint_your_email, isPassword: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      text(quiz_lbl_email_Verify, textColor: quiz_textColorPrimary, fontSize: textSizeMedium, fontFamily: fontRegular, isLongText: true, isCentered: true),
                    ],
                  ),
                ).onTap(() {
                  Navigator.of(context).pop();
                }),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.all(24.0),
                    child: quizButton(
                        textContent: quiz_lbl_save,
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                            toast(quiz_Successfully_Email_Updated);
                          });
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
