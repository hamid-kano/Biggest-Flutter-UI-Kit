import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/main/utils/codePicker/country_code_picker.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDashboard.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizVerifcation.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizMobileVerify extends StatefulWidget {
  static String tag = '/QuizMobileVerify';

  @override
  _QuizMobileVerifyState createState() => _QuizMobileVerifyState();
}

class _QuizMobileVerifyState extends State<QuizMobileVerify> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      appBar: AppBar(
        title: text(quiz_lbl_let_started, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: quiz_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      QuizDashboard().launch(context);
                    });
                  },
                  child: text(quiz_lbl_skip, textColor: quiz_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontMedium).center())),
        ],
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
                SizedBox(height: 20),
                text(quiz_info_let_started, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true).center(),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  decoration: boxDecoration(bgColor: quiz_white, color: quiz_white, showShadow: true, radius: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 5),
                      CountryCodePicker(onChanged: print, showFlag: true),
                      Container(
                        height: 30.0,
                        width: 1.0,
                        color: quiz_colorPrimary,
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: TextStyle(fontSize: textSizeLargeMedium, fontFamily: fontRegular),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(16, 22, 16, 22),
                            counterText: "",
                            hintText: quiz_hint_Mobile_Number,
                            hintStyle: TextStyle(color: quiz_textColorPrimary, fontSize: textSizeMedium),
                            border: InputBorder.none,
                          ),
                        ),
                      )
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
                  ).onTap(() {
                    finish(context);
                  }),
                ).onTap(() {
                  Navigator.of(context).pop();
                }),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_continue,
                    onPressed: () {
                      setState(() {
                        QuizVerification().launch(context);
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
