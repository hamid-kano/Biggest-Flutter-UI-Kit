import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;

import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';

class SDLessonsDetailsScreen extends StatefulWidget {
  @override
  _SDLessonsDetailsScreenState createState() => _SDLessonsDetailsScreenState();
}

class _SDLessonsDetailsScreenState extends State<SDLessonsDetailsScreen> {
  late var text;

  @override
  void initState() {
    super.initState();
    text = lipsum.createText(numParagraphs: 10, numSentences: 8);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: Container(),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.details, color: Colors.black),
                  SizedBox(width: 15),
                  Icon(Icons.message, color: Colors.black),
                  SizedBox(width: 15),
                  Icon(Icons.more_vert, color: Colors.black)
                ],
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Text(text, style: boldTextStyle(letterSpacing: 1, wordSpacing: 1, weight: FontWeight.normal), textAlign: TextAlign.justify),
          ),
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
                    Icon(Icons.arrow_back, color: sdPrimaryColor, size: 30),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: sdPrimaryColor, size: 30),
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
