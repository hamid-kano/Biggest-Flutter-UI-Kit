import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizDetails.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizNewList.dart';
import 'package:prokit_flutter/fullApps/quiz/Screens/QuizSearch.dart';
import 'package:prokit_flutter/fullApps/quiz/model/QuizModels.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizColors.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizConstant.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizDataGenerator.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizStrings.dart';
import 'package:prokit_flutter/fullApps/quiz/utils/QuizWidget.dart';

class QuizHome extends StatefulWidget {
  static String tag = '/QuizHome';

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  late List<NewQuizModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quiz_app_background,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  text(quiz_lbl_hi_antonio, fontFamily: fontBold, fontSize: textSizeXLarge),
                  text(quiz_lbl_what_would_you_like_to_learn_n_today_search_below, textColor: quiz_textColorSecondary, isLongText: true, isCentered: true),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.all(16.0),
                    decoration: boxDecoration(radius: 10, showShadow: true, bgColor: quiz_white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(child: quizEditTextStyle(quiz_lbl_search, isPassword: false)),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: boxDecoration(radius: 10, showShadow: false, bgColor: quiz_colorPrimary),
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search, color: quiz_white),
                        ).onTap(() {
                          QuizSearch().launch(context);
                          setState(() {});
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text(quiz_lbl_new_quiz, textAllCaps: true, fontFamily: fontMedium, fontSize: textSizeNormal),
                        text(
                          quiz_lbl_view_all,
                          textColor: quiz_textColorSecondary,
                        ).onTap(() {
                          setState(() {
                            QuizListing().launch(context);
                          });
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    //height: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => GestureDetector(
                        onTap: () {
                          QuizDetails().launch(context);
                        },
                        child: NewQuiz(mListings[index], index),
                      ),
                    ),
                  ).paddingOnly(bottom: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NewQuiz extends StatelessWidget {
  late NewQuizModel model;

  NewQuiz(NewQuizModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: boxDecoration(radius: 16, showShadow: true, bgColor: quiz_white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
                child: CachedNetworkImage(placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?, imageUrl: model.quizImage, height: w * 0.4, width: MediaQuery.of(context).size.width * 0.75, fit: BoxFit.cover),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text(model.quizName, fontSize: textSizeMedium, isLongText: true, fontFamily: fontMedium, isCentered: false),
                    text(model.totalQuiz, textColor: quiz_textColorSecondary),
                  ],
                ),
                Icon(Icons.arrow_forward, color: quiz_textColorSecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
