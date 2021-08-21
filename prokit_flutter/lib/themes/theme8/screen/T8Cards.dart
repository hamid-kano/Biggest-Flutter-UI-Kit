import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/themes/theme8/utils/PlanetCard.dart';
import 'package:prokit_flutter/themes/theme8/utils/T8Colors.dart';

import '../../../main.dart';

class T8Cards extends StatefulWidget {
  static String tag = '/T8Cards';

  @override
  T8CardsState createState() => T8CardsState();
}

class T8CardsState extends State<T8Cards> {
  List<Widget> cardList = [];

  void removeCards(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    cardList = _generateCards();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: cardList),
    );
  }

  List<Widget> _generateCards() {
    List<T8Quiz> planetCard = [];
    planetCard.add(
      T8Quiz("How many basic steps are there in scientific method?", "Eight Steps", "Ten Steps", "Two Steps", "One Steps", 70.0),
    );
    planetCard.add(
      T8Quiz("Which blood vessels have the smallest diameter? ", "Capillaries", "Arterioles", "Venules", "Lymphatic", 80.0),
    );
    planetCard.add(T8Quiz("The substrate of photo-respiration is", "Phruvic acid", "Glucose", "Fructose", "Glycolate", 90.0));
    planetCard.add(T8Quiz("Which one of these animal is jawless?", "Shark", "Myxine", "Trygon", "Sphyrna", 100.0));
    planetCard.add(
      T8Quiz("How many basic steps are there in scientific method?", "Eight Steps", "Ten Steps", "One Steps", "Three Steps", 110.0),
    );
    List<Widget> cardList = [];

    for (int x = 0; x < 5; x++) {
      cardList.add(
        Positioned(
          top: planetCard[x].topMargin,
          child: Draggable(
            onDragEnd: (drag) {
              removeCards(x);
            },
            childWhenDragging: Container(),
            feedback: Material(
              child: GestureDetector(
                child: Container(
                  decoration: boxDecoration(radius: 20, bgColor: appStore.scaffoldBackground, showShadow: true),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: 320.0,
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Text(planetCard[x].cardImage, style: boldTextStyle(size: 22), textAlign: TextAlign.center),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            t8CardSelection("A.", planetCard[x].option1, () {
                              removeCards(x);
                            }),
                            t8CardSelection("B.", planetCard[x].option2, () {
                              removeCards(x);
                            }),
                            t8CardSelection("C.", planetCard[x].option3, () {
                              removeCards(x);
                            }),
                            t8CardSelection("D.", planetCard[x].option4, () {
                              removeCards(x);
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            child: GestureDetector(
              child: Container(
                decoration: boxDecoration(radius: 20, bgColor: appStore.scaffoldBackground, showShadow: true),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: 320.0,
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                        child: Text(planetCard[x].cardImage, style: boldTextStyle(size: 22), textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          t8CardSelection("A.", planetCard[x].option1, () {
                            removeCards(x);
                          }),
                          t8CardSelection("B.", planetCard[x].option2, () {
                            removeCards(x);
                          }),
                          t8CardSelection("C.", planetCard[x].option3, () {
                            removeCards(x);
                          }),
                          t8CardSelection("D.", planetCard[x].option4, () {
                            removeCards(x);
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    return cardList;
  }
}

Widget t8CardSelection(var option, var option1, callBack) {
  return InkWell(
    onTap: () {
      callBack();
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: boxDecoration(showShadow: false, bgColor: appStore.scaffoldBackground, radius: 10, color: t8_view_color),
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
      width: 320,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Text(option1, style: secondaryTextStyle()),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(option, style: secondaryTextStyle()),
          )
        ],
      ),
    ),
  );
}
