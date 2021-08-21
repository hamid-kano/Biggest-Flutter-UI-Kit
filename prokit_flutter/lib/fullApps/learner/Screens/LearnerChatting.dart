import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/learner/model/LearnerModels.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerColors.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerConstant.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerDataGenerator.dart';
import 'package:prokit_flutter/fullApps/learner/utils/LearnerImages.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class LearnerChattingScreen extends StatefulWidget {
  @override
  _LearnerChattingScreenState createState() => _LearnerChattingScreenState();
}

class _LearnerChattingScreenState extends State<LearnerChattingScreen> {
  String userId = '1';

  @override
  Widget build(BuildContext context) {
    Widget buildChatMessages(ChatModel message) {
      if (message.id != userId) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(color: learner_colorPrimary, borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
              child: Text(
                message.message,
                style: primaryTextStyle(color: white),
              ).center().paddingOnly(left: 8, right: 8, top: 8, bottom: 8),
            ).paddingOnly(left: 16, right: 16, bottom: 16),
          ],
        );
      } else {
        return Row(
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: learner_layout_background, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10), topLeft: Radius.circular(10))),
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(message.message, style: primaryTextStyle()).paddingAll(8),
            ).paddingOnly(left: 16, right: 16, bottom: 16),
          ],
        );
      }
    }

    changeStatusColor(Colors.white);
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: learner_white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(width * 0.25),
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                color: learner_white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: learner_colorPrimary),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              text("Marc Elliot", textColor: learner_textColorPrimary, fontSize: textSizeLargeMedium, fontFamily: fontMedium),
                              text("Active", textColor: learner_textColorSecondary, fontSize: textSizeMedium, fontFamily: fontRegular)
                            ],
                          ),
                          Image.network(learner_ic_profile4, height: 45, width: 45, fit: BoxFit.fill).cornerRadiusWithClipRRect(25),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ).paddingOnly(left: 12, right: 16),
              ),
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, i) => buildChatMessages(getMessages()[i]),
              itemCount: getMessages().length,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 60),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: width,
                margin: EdgeInsets.only(top: 8),
                decoration: boxDecorationDefault(),
                child: Row(
                  children: <Widget>[
                    Image.asset(learner_ic_smile, height: 30, width: 30).paddingAll(10),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
                        decoration: InputDecoration(
                          hintText: "Ask me Something",
                          filled: true,
                          fillColor: learner_white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: learner_white, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: learner_white, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.arrow_upward, size: 24, color: learner_white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        color: learner_colorPrimary,
                        shape: BoxShape.circle,
                      ),
                    ).onTap(() {
                      //
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
