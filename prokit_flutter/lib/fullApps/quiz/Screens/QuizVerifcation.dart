import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizNotification.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';

import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class QuizVerification extends StatefulWidget {
  static String tag = '/QuizMobileVerification';

  @override
  _QuizVerificationState createState() => _QuizVerificationState();
}

class _QuizVerificationState extends State<QuizVerification> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(quiz_app_background);

    return Scaffold(
      appBar: AppBar(
        title: text(quiz_title_Verification, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
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
                SizedBox(height: 20),
                text(quiz_info_Verification, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true).center(),
                SizedBox(height: 20),
                PinEntryTextField(fields: 4, fontSize: textSizeLargeMedium).center(),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    children: <Widget>[
                      text(quiz_lbl_did_not_receive_code),
                      text(quiz_lbl_Resend, textColor: quiz_colorPrimary, textAllCaps: true),
                    ],
                  ),
                ).onTap(() {}),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: quizButton(
                    textContent: quiz_lbl_continue,
                    onPressed: () {
                      setState(() {
                        QuizNotification().launch(context);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
