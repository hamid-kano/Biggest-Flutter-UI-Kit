import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/ModelClass/SDExamModel.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDCongratulationsScreen.dart';

class SDExamDetailsScreen extends StatefulWidget {
  @override
  _SDExamDetailsScreenState createState() => _SDExamDetailsScreenState();
}

class _SDExamDetailsScreenState extends State<SDExamDetailsScreen> {
  int _counter = 30;
  Timer? _timer;
  var selectedSize = -1;

  int pageChanged = 0;
  PageController pageController = PageController();

  void _startTimer() {
    _counter = 30;

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer!.cancel();
          }
        });
      },
    );
  }

  @override
  // ignore: must_call_super
  void initState() {
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var titles = ["QUESTION 1 OF 5", "QUESTION 2 OF 5", "QUESTION 3 OF 5", "QUESTION 4 OF 5", "QUESTION 5 OF 5"];
    var subTitles = [
      "The Homolographic projection has the correct representation of",
      "The Homolographic projection has the correct representation of",
      "The Homolographic projection has the correct representation of",
      "The Homolographic projection has the correct representation of",
      "The Homolographic projection has the correct representation of",
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 15),
            child: CloseButton(color: Colors.black),
          ),
          title: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.alarm, color: Colors.grey),
                Text('$_counter\s remaining', style: secondaryTextStyle(size: 12, color: Colors.red)),
              ],
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Center(
                  child: Text('Quit Exam', style: boldTextStyle(size: 14, color: sdPrimaryColor)),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: IgnorePointer(
                child: new PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() => pageChanged = value);
                  },
                  children: <Widget>[
                    Question(textContent: titles[pageChanged], question: subTitles[pageChanged]),
                    Question(textContent: titles[pageChanged], question: subTitles[pageChanged]),
                    Question(textContent: titles[pageChanged], question: subTitles[pageChanged]),
                    Question(textContent: titles[pageChanged], question: subTitles[pageChanged]),
                    Question(textContent: titles[pageChanged], question: subTitles[pageChanged]),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: mQuestionList.length,
                  padding: EdgeInsets.only(top: 16.0),
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: boxDecorationWithRoundedCorners(backgroundColor: selectedSize == index ? sdSecondaryColorGreen : Colors.white),
                      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: InkWell(
                        onTap: () {
                          selectedSize = index;
                          setState(() {});
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              child: selectedSize == index ? Icon(Icons.check_circle, color: Colors.white, size: 22) : Icon(Icons.radio_button_unchecked, color: sdPrimaryColor, size: 22),
                            ),
                            SizedBox(width: 16),
                            Text(mQuestionList[index].value!, style: primaryTextStyle(color: selectedSize == index ? Colors.white : sdTextPrimaryColor)),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
        persistentFooterButtons: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            height: 100,
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Ch 4 - Igneous Rocks', style: boldTextStyle()),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text('25 of 32 pages', style: secondaryTextStyle()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (pageChanged-1 >= 0) {
                          pageChanged = pageChanged - 1;
                          pageController.animateToPage(pageChanged, duration: Duration(milliseconds: 500), curve: Curves.ease);
                        }
                      },
                      child: Icon(Icons.arrow_back, color: sdPrimaryColor, size: 30),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        pageChanged = pageChanged + 1;
                        if (pageChanged >= 5) {
                          pageChanged = 0;
                          finish(context);
                          SDCongratulationsScreen().launch(context);
                        } else {
                          selectedSize = -1;
                          pageController.animateToPage(pageChanged, duration: Duration(milliseconds: 500), curve: Curves.ease);
                        }
                      },
                      child: Icon(Icons.arrow_forward, color: sdPrimaryColor, size: 30),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Question extends StatefulWidget {
  final String textContent;
  final String? question;

  Question({Key? key, required this.textContent, this.question}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 25, left: 15),
          child: Text(widget.textContent, style: secondaryTextStyle(size: 14)),
        ),
        Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Text(widget.question!, style: primaryTextStyle(size: 16)),
        ),
      ],
    );
  }
}
