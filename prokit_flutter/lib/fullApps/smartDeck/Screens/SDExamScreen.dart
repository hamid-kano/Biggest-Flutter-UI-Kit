import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/main/utils/Lipsum.dart' as lipsum;
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDColors.dart';
import 'package:prokit_flutter/fullApps/smartDeck/SDUtils/SDStyle.dart';
import 'package:prokit_flutter/fullApps/smartDeck/Screens/SDExamDetailsScreen.dart';

// ignore: must_be_immutable
class SDExamScreen extends StatefulWidget {
  String? name;
  String? image;
  Color? startColor;
  Color? endColor;

  SDExamScreen([this.name, this.image, this.startColor, this.endColor]);

  @override
  _SDExamScreenState createState() => _SDExamScreenState();
}

class _SDExamScreenState extends State<SDExamScreen> {
  late var text;

  @override
  // ignore: must_call_super
  void initState() {
    text = lipsum.createText(numParagraphs: 1, numSentences: 5);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(widget.startColor!);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [widget.startColor!, widget.endColor!],
            ),
          ),
          height: size.height,
          width: size.width,
          padding: EdgeInsets.only(top: 25, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: CloseButton(color: Colors.white),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, left: 16),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Image.asset(widget.image!, height: 60, width: 60),
                  radius: 40,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  widget.name!,
                  style: boldTextStyle(color: Colors.white, letterSpacing: 0.2),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, left: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '40 questions',
                      style: secondaryTextStyle(size: 14, color: Colors.white.withOpacity(0.5)),
                    ),
                    SizedBox(width: 10),
                    Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.5)), height: 4, width: 4),
                    SizedBox(width: 10),
                    Text(
                      '60 minutes',
                      textAlign: TextAlign.justify,
                      style: secondaryTextStyle(size: 14, color: Colors.white.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    text,
                    style: secondaryTextStyle(size: 14, color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 25, bottom: 25),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {
                    SDExamDetailsScreen().launch(context);
                  },
                  child: FittedBox(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                      decoration: boxDecorations(radius: 4),
                      child: Center(
                        child: Text('Start Exam', style: boldTextStyle(size: 12, color: sdPrimaryColor)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
