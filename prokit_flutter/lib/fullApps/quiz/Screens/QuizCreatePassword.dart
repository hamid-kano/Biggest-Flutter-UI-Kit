import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizMobileVerify.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizCreatePassword extends StatefulWidget {
  static String tag = '/QuizCreatePassword';

  @override
  _QuizCreatePasswordState createState() => _QuizCreatePasswordState();
}

class _QuizCreatePasswordState extends State<QuizCreatePassword> {
  var obscureText = true;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_Create_password, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
                text(quiz_info_create_password, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true).paddingOnly(left: 40, right: 40, top: 16),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontMedium),
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                          border: InputBorder.none,
                          hintText: quiz_hint_your_password,
                          labelStyle: primaryTextStyle(size: 20, color: quiz_textColorPrimary),
                          suffix: text(obscureText ? "Show" : "Hide", textColor: quiz_textColorSecondary, fontSize: textSizeNormal, fontFamily: fontMedium).onTap(() {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          }),
                          //suffixText: (obscureText ? "show" : "hide")
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      text(quiz_lbl_already_have_an_account),
                      text(quiz_lbl_sign_in, textColor: quiz_colorPrimary, textAllCaps: true),
                    ],
                  ),
                ).onTap(() {
                  finish(context);
                }),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_continue,
                    onPressed: () {
                      setState(() {
                        QuizMobileVerify().launch(context);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
