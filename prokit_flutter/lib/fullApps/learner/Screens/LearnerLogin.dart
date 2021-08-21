import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/Screens/LearnerSignUp.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerStrings.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerWidget.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerLogin extends StatefulWidget {
  static String tag = '/LearnerModrenMedicine';

  @override
  _LearnerLoginState createState() => _LearnerLoginState();
}

class _LearnerLoginState extends State<LearnerLogin> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(learner_layout_background);

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: learner_layout_background,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: learner_white, width: 4)),
                      child: CircleAvatar(backgroundImage: CachedNetworkImageProvider(learner_ic_Profile), radius: width / 7),
                    ),
                    SizedBox(height: 30),
                    LearnerEditTextStyle(learner_hint_email, isPassword: false),
                    SizedBox(height: 16),
                    LearnerEditTextStyle(learner_hint_password, isPassword: true),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: LearnerButton(
                          onPressed: () {},
                          textContent: learner_lbl_enter,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 30),
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[text(learner_lbl_don_t_joined_yet), SizedBox(width: 8), text(learner_lbl_join, textColor: learner_colorPrimary)],
                ),
                onTap: () {
                  LearnerSignUp().launch(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
