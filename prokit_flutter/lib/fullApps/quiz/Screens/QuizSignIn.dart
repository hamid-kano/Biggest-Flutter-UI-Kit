import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDashboard.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizSignUp.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';

import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizSignIn extends StatefulWidget {
  static String tag = '/QuizSignIn';

  @override
  _QuizSignInState createState() => _QuizSignInState();
}

class _QuizSignInState extends State<QuizSignIn> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      backgroundColor: quiz_app_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: quiz_app_background,
            child: Column(
              children: <Widget>[
                SizedBox(height: 16),
                text(quiz_title_login, fontSize: textSizeNormal, fontFamily: fontBold),
                text(quiz_info_login, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true).center(),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      quizEditTextStyle(quiz_hint_your_email, isPassword: false),
                      quizDivider(),
                      quizEditTextStyle(quiz_hint_your_password),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  child: Column(
                    children: <Widget>[
                      text(quiz_lbl_don_t_have_an_account),
                      text(quiz_lbl_create_account, textColor: quiz_colorPrimary, fontFamily: fontSemibold),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    QuizSignUp().launch(context);
                  });
                }),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.all(24.0),
                    child: quizButton(
                        textContent: quiz_lbl_continue,
                        onPressed: () {
                          setState(() {
                            QuizDashboard().launch(context);
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
